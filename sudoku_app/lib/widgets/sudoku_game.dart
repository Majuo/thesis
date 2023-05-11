import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sudoku_app/game_internals/generator/sudoku_difficulty_enum.dart';
import 'package:sudoku_app/game_internals/generator/sudoku_generator.dart';
import 'package:sudoku_app/game_internals/solver/sudoku_solver.dart';
import 'package:sudoku_app/game_internals/solver/techniques_enum.dart';
import 'package:sudoku_app/game_internals/sudoku.dart';
import 'package:sudoku_app/game_internals/sudoku_cell.dart';
import 'package:sudoku_app/name_pickers/sudoku_technique_name_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sudoku_app/screen_size_helpers.dart';
import 'package:sudoku_app/widgets/new_game_panel.dart';

import 'package:sudoku_app/widgets/sudoku_cell.dart';
import 'package:sudoku_app/widgets/sudoku_buttons_panel.dart';
import 'package:sudoku_app/widgets/sudoku_grid.dart';

class SudokuGame extends StatefulWidget {	const SudokuGame({super.key});
  static Sudoku? game;
  static bool isGameOver = false;

	@override
	State<SudokuGame> createState() => _SudokuGameState();
}

class _SudokuGameState extends State<SudokuGame> {

  @override
  void initState() {
    if (SudokuGame.game != null) {
      game = SudokuGame.game!;
    } else {
      //game = Sudoku.getSampleSudoku();  // for testing
      game = Sudoku.getEmptySudoku();
      SudokuGenerator.generateSudoku(SudokuDifficultyEnum.easy).then((value) {
        setState(() {
          resetBoard(value);
        });
      });
    }
    isGameOver = SudokuGame.isGameOver;
    super.initState();
  }

  @override
  void dispose() {
    SudokuGame.game = game;
    SudokuGame.isGameOver = isGameOver;
    super.dispose();
  }

	late Sudoku game; 
  SudokuCellWidget? currentCell;
  List<SudokuCellWidget> highlightedCells = List.empty(growable: true);
  bool isInNotesMode = false;
  bool isGameOver = SudokuGame.isGameOver;
  String? hintText;
  SudokuGrid? gridWidget;
  SudokuButtonsPanel? numberButtonsWidget;

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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      if (currentCell != null) {
        var newCurrentCell = gridWidget?.currentState?.cellWidgets.elementAt(currentCell!.rowNo).children.elementAt(currentCell!.cellNo) as SudokuCellWidget;
        currentCell = newCurrentCell;
        currentCell!.currentState?.selectCurrent();
      }
      if (isInNotesMode) {
          numberButtonsWidget?.currentState?.isInNotesMode = true;
          numberButtonsWidget?.currentState?.switchButtonsColors(context);
      }
      for (var errorCell in game.errorCells) {
        var cellWidget = gridWidget?.currentState?.cellWidgets.elementAt(errorCell.row).children.elementAt(errorCell.col) as SudokuCellWidget;
        if (cellWidget.rowNo != currentCell?.rowNo || cellWidget.cellNo != currentCell?.cellNo) {
          cellWidget.currentState?.highlightError();
        }
      }
      for (var highlightedCell in highlightedCells) {
        var cellWidget = gridWidget?.currentState?.cellWidgets.elementAt(highlightedCell.rowNo).children.elementAt(highlightedCell.cellNo) as SudokuCellWidget;
        if (cellWidget.rowNo != currentCell?.rowNo || cellWidget.cellNo != currentCell?.cellNo) {
          cellWidget.currentState?.highlight();
        }
      }
    });
    return Column(
      mainAxisSize: ScreenSizeHelpers.isVerticalOrientation(context) ? MainAxisSize.min : MainAxisSize.max,
      mainAxisAlignment: ScreenSizeHelpers.isVerticalOrientation(context) ? MainAxisAlignment.start : MainAxisAlignment.center,
      children: [
        () {
          gridWidget = SudokuGrid(
            game: game,
            cellHandleOnTap: (SudokuCell cell) {
              clearHighlightedCells();
              var newCurrentCell = gridWidget?.currentState?.cellWidgets.elementAt(cell.row).children.elementAt(cell.col) as SudokuCellWidget;
              if (currentCell != null && game.errorCells.contains(game.board.elementAt(currentCell!.rowNo).elementAt(currentCell!.cellNo))) {
                currentCell?.currentState?.highlightError();
              } else {
                currentCell?.currentState?.deselect();
              }
              if (currentCell?.rowNo == newCurrentCell.rowNo && currentCell?.cellNo == newCurrentCell.cellNo) {
                currentCell = null;
              } else {
                currentCell = gridWidget?.currentState?.cellWidgets.elementAt(cell.row).children.elementAt(cell.col) as SudokuCellWidget;
                currentCell?.currentState?.selectCurrent();
              }
            },
          );
          return gridWidget!;
        } (),
        SizedBox(
          width: SudokuGrid.gridSize,
          height: SudokuCellWidget.cellSize,
          child: Text(hintText ?? "", textAlign: TextAlign.center, maxLines: 2, style: TextStyle(fontSize: SudokuCellWidget.cellSize / 3)),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: () {
            numberButtonsWidget = SudokuButtonsPanel(numOnClick: (int val) {
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
                    var cellWidget = gridWidget?.currentState?.cellWidgets.elementAt(errorCell.row).children.elementAt(errorCell.col) as SudokuCellWidget;
                    if (cellWidget.rowNo != currentCell?.rowNo || cellWidget.cellNo != currentCell?.cellNo) {
                      cellWidget.currentState?.highlightError();
                    }
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
            },);
            return numberButtonsWidget;
          } ()
        ),
      ],
    );
  }

  Widget getGameControlPanel(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          crossAxisAlignment: !ScreenSizeHelpers.isVerticalOrientation(context) ? CrossAxisAlignment.start : CrossAxisAlignment.center,
          children: [
            getGameControlButtonsPanel(context),
            NewGamePanel(
              newGameOnClick: (SudokuDifficultyEnum difficulty) {
                SudokuGenerator.generateSudoku(difficulty).then((value) {
                  setState(() {
                    resetBoard(value);
                  });
                });
              }
            ),
          ]
        ),
      ]
    );
  }

  Widget getGameControlButtonsPanel(BuildContext context) {
    if (ScreenSizeHelpers.isVerticalOrientation(context)) {
      return SizedBox(
        width: SudokuGrid.gridSize * 1.2,
        height: Platform.isAndroid ? SudokuCellWidget.cellSize * 1.5 : SudokuCellWidget.cellSize,  // Icon buttons are rendered differently on windows and android
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: Platform.isAndroid ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.center,
            children: getGameControlButtons(context).map((e) {
              if (Platform.isAndroid) {
                return e;
              }
              return Padding(padding: const EdgeInsets.symmetric(horizontal: 3), child: e);
            }).toList(),
          ),
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: getGameControlButtons(context).map((b) => Padding(padding: const EdgeInsets.symmetric(vertical: 2), child: b)).toList(),
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
              var cellWidget = gridWidget?.currentState?.cellWidgets.elementAt(resultCell.row).children.elementAt(resultCell.col) as SudokuCellWidget;
              cellWidget.currentState?.highlight();
              highlightedCells.add(cellWidget);
            }
          }
        },
        child: Row(
          children: [
            const Icon(Icons.lightbulb, size: 16),
            Padding(padding: const EdgeInsets.only(left: 5), child: Text(AppLocalizations.of(context).hint))
          ]
        )
      ),
      TextButton(
        child: Row(
          children: [
            const Icon(Icons.edit_square, size: 16),
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
            const Icon(Icons.restart_alt, size: 16),
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
      var cellWidget = gridWidget?.currentState?.cellWidgets.elementAt(cell.row).children.elementAt(cell.col) as SudokuCellWidget;
      if (cellWidget.cellNo == currentCell?.cellNo && cellWidget.rowNo == currentCell?.rowNo) {
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
          title: Text(AppLocalizations.of(context).congratulations),
          content: Text(AppLocalizations.of(context).youWon),
          actions: <Widget>[
            TextButton(
              child: Text(AppLocalizations.of(context).ok),
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