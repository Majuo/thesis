import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sudoku_app/game_internals/generator/sudoku_difficulty_enum.dart';
import 'package:sudoku_app/game_internals/generator/sudoku_generator.dart';
import 'package:sudoku_app/game_internals/solver/sudoku_solver.dart';
import 'package:sudoku_app/game_internals/solver/techniques_enum.dart';
import 'package:sudoku_app/game_internals/sudoku.dart';
import 'package:sudoku_app/game_internals/sudoku_cell.dart';
import 'package:sudoku_app/locale/sudoku_technique_name_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sudoku_app/screen_size_helpers.dart';
import 'package:sudoku_app/widgets/new_game_panel.dart';

import 'package:sudoku_app/widgets/sudoku_cell.dart';
import 'package:sudoku_app/widgets/sudoku_buttons_panel.dart';
import 'package:sudoku_app/widgets/sudoku_grid.dart';

class SudokuGame extends StatefulWidget {	const SudokuGame({super.key});

	@override
	State<SudokuGame> createState() => _SudokuGameState();
}

class _SudokuGameState extends State<SudokuGame> {
	Sudoku game = Sudoku.getSampleSudoku(); 
  List<List<SudokuCellWidget>> cellWidgets = List.empty(growable: true);
  SudokuCellWidget? currentCell;
  List<SudokuCellWidget> highlightedCells = List.empty(growable: true);
  bool isInNotesMode = false;
  bool isGameOver = false;
  String? hintText;

  @override
	Widget build(BuildContext context) {
    if (ScreenSizeHelpers.isVerticalOrientation(context)) {
      return Column(
        children: [
          getBoardWithNumberButtons(context),
          getGameControlPanel(context)
        ]
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        getBoardWithNumberButtons(context),
        getGameControlPanel(context)
      ],
    );
	}
  Widget getBoardWithNumberButtons(BuildContext context) {
    return Column(
      mainAxisSize: ScreenSizeHelpers.isVerticalOrientation(context) ? MainAxisSize.min : MainAxisSize.max,
      mainAxisAlignment: ScreenSizeHelpers.isVerticalOrientation(context) ? MainAxisAlignment.start : MainAxisAlignment.center,
      children: [
        SudokuGrid(
        game: game,
        cellWidgets: cellWidgets,
        cellHandleOnTap: (SudokuCell cell) {
          clearHighlightedCells();
          var newCurrentCell = cellWidgets.elementAt(cell.row).elementAt(cell.col);
          if (currentCell != null && game.errorCells.contains(game.board.elementAt(currentCell!.rowNo).elementAt(currentCell!.cellNo))) {
            currentCell?.currentState?.highlightError();
          } else {
            currentCell?.currentState?.deselect();
          }
          if (currentCell == newCurrentCell) {
            currentCell = null;
          } else {
            currentCell = cellWidgets.elementAt(cell.row).elementAt(cell.col);
            currentCell?.currentState?.selectCurrent();
          }
        }),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Text(hintText ?? ""),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: 
            SudokuButtonsPanel(numOnClick: (int val) {
              clearHighlightedCells();
              if (currentCell == null || isGameOver) return;
              var boardCell = game.board.elementAt(currentCell!.rowNo).elementAt(currentCell!.cellNo);
              if (boardCell.editable) {
                if (!isInNotesMode) {
                  boardCell.value = val;
                  // check errors
                  clearErrorCells();
                  game.checkErrors();
                  for (var errorCell in game.errorCells) {
                    var cellWidget = cellWidgets.elementAt(errorCell.row).elementAt(errorCell.col);
                    cellWidget.currentState?.highlightError();
                  }

                } else if (val != 0) {
                  if (boardCell.candidates.contains(val)) {
                    boardCell.candidates.remove(val);
                  } else {
                    boardCell.candidates.add(val);
                    boardCell.candidates.sort();
                  }
                } else if (val == 0) {
                  boardCell.candidates.clear();
                }
                currentCell!.currentState?.triggerRedraw();
                if (game.checkWin()) {
                  setState(() {
                    isGameOver = true;
                  });
                  showWinAlert();
                }
              }
            },
            notesOnClick: () {
              isInNotesMode = !isInNotesMode;
            },),
        ),
      ],
    );
  }

  Widget getGameControlPanel(BuildContext context) {
    return SizedBox(
      width: !ScreenSizeHelpers.isVerticalOrientation(context) ? min((ScreenSizeHelpers.displayWidth(context) - SudokuGrid.gridSize) / 2, SudokuGrid.gridSize / 2) : SudokuGrid.gridSize,
      child: Column(
        crossAxisAlignment: !ScreenSizeHelpers.isVerticalOrientation(context) ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          getGameControlButtonsPanel(context),
          NewGamePanel(newGameOnClick: (SudokuDifficultyEnum difficulty) {
            SudokuGenerator.generateSudoku(difficulty).then((value) {
              setState(() {
                resetBoard(value);
              });
            });
          }),
        ]
      ),
    );
  }

  Widget getGameControlButtonsPanel(BuildContext context) {
    if (ScreenSizeHelpers.isVerticalOrientation(context)) {
      return SizedBox(
        width: SudokuGrid.gridSize,
        height: SudokuCellWidget.cellSize * 1.2,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: getGameControlButtons(context),
          ),
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: getGameControlButtons(context),
    );
  }

  List<Widget> getGameControlButtons(BuildContext context) {
    return [
      TextButton(
        onPressed: () {
          if (isGameOver) return;
          clearHighlightedCells();
          var result = SudokuSolver.solveCellWithTechniques(game, SudokuTechniquesEnum.values, applyResult: true);
          if (result == null) {
            setState(() {
              hintText = AppLocalizations.of(context).hintCanNotBeSolved;
            });
          } else {
            if (result.applicableCells == null || result.applicableCells!.isEmpty) return;
            setState(() {
              hintText = (result.applicableCells?.length == 1 ? AppLocalizations.of(context).hintCanBeSolvedUsingSingleCell : AppLocalizations.of(context).hintCanBeSolvedUsingMultipleCells) + SudokuTechniqueNamePicker.getTechniqueName(context, result.usedTechnique!);
            });
            for (var resultCell in result.applicableCells!) {
              var cellWidget = cellWidgets.elementAt(resultCell.row).elementAt(resultCell.col);
              cellWidget.currentState?.highlight();
              highlightedCells.add(cellWidget);
            }
          }
        },
        child: Row(
          children: [
            const Icon(Icons.lightbulb),
            Padding(padding: const EdgeInsets.only(left: 5), child: Text(AppLocalizations.of(context).hint))
          ]
        )
      ),
      TextButton(
        child: Row(
          children: [
            const Icon(Icons.edit_square),
            Padding(padding: const EdgeInsets.only(left: 5), child: Text(AppLocalizations.of(context).fillCandidates))
          ]
        ),
        onPressed: () {
          setState(() {
            game.fillAllNotes();
          });
        },
      ),
      TextButton(
        onPressed: () {
          resetBoard(Sudoku.generateSudoku(game.initState, game.solution));
        }, 
        child: Row(
          children: [
            const Icon(Icons.restart_alt),
            Padding(padding: const EdgeInsets.only(left: 5), child: Text(AppLocalizations.of(context).reset))
          ]
        )
      )
    ];
  }

  void resetBoard(Sudoku newGame) {
    currentCell?.currentState?.deselect();
    currentCell = null;
    clearHighlightedCells();
    clearErrorCells();
    game.board = newGame.board;
    game.solution = newGame.solution;
    game.initState = newGame.initState;
    game.errorCells = newGame.errorCells;
    isGameOver = false;
    hintText = "";
  }

  void clearHighlightedCells() {
    setState(() {
      hintText = null;
    });
    for (var cell in highlightedCells) {
      cell.currentState?.deselect();
    }
    highlightedCells.clear();
  }

  void clearErrorCells() {
    for (var cell in game.errorCells) {
      var cellWidget = cellWidgets.elementAt(cell.row).elementAt(cell.col);
      if (cellWidget == currentCell) {
        cellWidget.currentState?.selectCurrent();
      } else {
        cellWidget.currentState?.deselect();
      }
    }
    game.errorCells.clear();
  }

  Future<void> showWinAlert() async {
    return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Congratulations'),
        content: const Text('You won!'),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
  }
}