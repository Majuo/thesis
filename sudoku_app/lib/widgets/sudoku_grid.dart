import 'package:flutter/material.dart';
import 'package:sudoku_app/game_internals/generator/sudoku_difficulty_enum.dart';
import 'package:sudoku_app/game_internals/solver/sudoku_solver.dart';
import 'package:sudoku_app/game_internals/solver/techniques_enum.dart';
import 'package:sudoku_app/game_internals/sudoku.dart';
import 'package:sudoku_app/locale/sudoku_technique_name_picker.dart';
import 'package:sudoku_app/widgets/cell_candidates.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sudoku_app/widgets/new_game_panel.dart';

import 'package:sudoku_app/widgets/sudoku_cell.dart';
import 'package:sudoku_app/widgets/sudoku_buttons_panel.dart';

class SudokuGrid extends StatefulWidget {
  static double gridSize = SudokuCellWidget.cellSize * 9 + SudokuCellWidget.outerBorderWidth * 2 + SudokuCellWidget.innerThickBorderWidth * 4 + SudokuCellWidget.defaultBorderWidth * 12;
	const SudokuGrid({super.key});

	@override
	State<SudokuGrid> createState() => _SudokuGridState();
}

class _SudokuGridState extends State<SudokuGrid> {
	Sudoku game = Sudoku.getSampleSudoku(); 
  List<List<SudokuCellWidget>> cellWidgets = List.empty(growable: true);
  SudokuCellWidget? currentCell;
  List<SudokuCellWidget> highlightedCells = List.empty(growable: true);
  bool isInNotesMode = false;
  bool isGameOver = false;
  String? hintText;

  @override
	Widget build(BuildContext context) {
		return Column(
        children: [
          SizedBox(
          width: SudokuGrid.gridSize,
          height: SudokuGrid.gridSize,
          child: Center(
            child: Column(
              children: (() {
                List<Row> widgets = List.empty(growable: true);
                for (var row in game.board) {
                  var rowWidget = Row(children: List.empty(growable: true),);
                  cellWidgets.add(List.empty(growable: true));
                  for (var cell in row) {
                    var cellWidget = SudokuCellWidget(getCellContent: () {
                          if (cell.value > 0) {
                            return Text(cell.value.toString(), style: TextStyle(fontWeight: cell.editable ? FontWeight.normal : FontWeight.bold, fontSize: SudokuCellWidget.cellSize * 0.7),);
                          }
                          else {
                            return CellCandidates(candidates: cell.candidates);
                          }
                        },
                        handleOnTap: () {
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
                        },
                        rowNo: cell.row,
                        cellNo: cell.col
                      );
                      cellWidgets.elementAt(cell.row).add(cellWidget);
                      rowWidget.children.add(cellWidget);
                  }
                  widgets.add(rowWidget);
                }
                return widgets;
              })()
            ),
          ),
        ),
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
        IconButton(
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
          icon: const Icon(Icons.lightbulb)),
        TextButton(
          child: Text(AppLocalizations.of(context).fillCandidates),
          onPressed: () {
            setState(() {
              game.fillAllNotes();
            });
          },
        ),
        NewGamePanel(newGameOnClick: (SudokuDifficultyEnum difficulty) {
          setState(() {
            hintText = "new game clicked with difficulty: $difficulty";
          });
        })
      ]
    );
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