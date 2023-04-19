import 'package:flutter/material.dart';
import 'package:sudoku_app/game_internals/sudoku_cell.dart';
import 'package:sudoku_app/game_internals/sudoku_problem.dart';
import 'package:sudoku_app/screen_size_helpers.dart';
import 'package:sudoku_app/widgets/sudoku_buttons_panel.dart';
import 'package:sudoku_app/widgets/sudoku_cell.dart';
import 'package:sudoku_app/widgets/sudoku_grid.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SudokuProblemWidget extends StatefulWidget {
  const SudokuProblemWidget({super.key, required this.problem});
  final SudokuProblem problem;

  @override
  State<SudokuProblemWidget> createState() => _SudokuProblemWidgetState(problem: problem);
}

class _SudokuProblemWidgetState extends State<SudokuProblemWidget> {
  SudokuProblem problem;
  bool isProblemSolved = false;
  List<SudokuCellWidget> highlightedCells = List.empty(growable: true);
  SudokuCellWidget? currentCell;
  bool isInNotesMode = false;
  SudokuGrid? gridWidget;
  bool isCellsHighlightNeeded = true;
  bool isProblemInInitState = true;
  int changesLeft = 0;
  int incorrectChanges = 0;
  SudokuButtonsPanel? numberButtonsWidget;

  _SudokuProblemWidgetState({required this.problem});

  @override
	Widget build(BuildContext context) {
    if (ScreenSizeHelpers.isVerticalOrientation(context)) {
      return Column(
        children: [
          getGameStatsPanel(context),
          getBoardWithButtons(context)
        ]
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        getBoardWithButtons(context),
        getGameStatsPanel(context)
      ],
    );
	}

  Widget getBoardWithButtons(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      if (isProblemInInitState) {
        setState(() {
          isCellsHighlightNeeded = true;
        });
        highlightCells();
      }
      if (currentCell != null) {
        var newCurrentCell = gridWidget?.currentState?.cellWidgets.elementAt(currentCell!.rowNo).children.elementAt(currentCell!.cellNo) as SudokuCellWidget;
        currentCell = newCurrentCell;
        currentCell!.currentState?.selectCurrent();
      }
      if (isInNotesMode) {
          numberButtonsWidget?.currentState?.isInNotesMode = true;
          numberButtonsWidget?.currentState?.switchButtonsColors();
      }
    });
    return Column(
      mainAxisSize: ScreenSizeHelpers.isVerticalOrientation(context) ? MainAxisSize.min : MainAxisSize.max,
      mainAxisAlignment: ScreenSizeHelpers.isVerticalOrientation(context) ? MainAxisAlignment.start : MainAxisAlignment.center,
      children: [
        () {
          gridWidget = SudokuGrid(
            game: problem,
            cellHandleOnTap: (SudokuCell cell) {
              clearHighlightedCells();
              isProblemInInitState = false;
              currentCell?.currentState?.deselect();
              var newCurrentCell = gridWidget?.currentState?.cellWidgets.elementAt(cell.row).children.elementAt(cell.col) as SudokuCellWidget;
              if (currentCell?.rowNo == newCurrentCell.rowNo && currentCell?.cellNo == newCurrentCell.cellNo) {
                currentCell = null;
              } else {
                currentCell = gridWidget?.currentState?.cellWidgets.elementAt(cell.row).children.elementAt(cell.col) as SudokuCellWidget;
                currentCell?.currentState?.selectCurrent();
              }
            },
          );
          problem.checkProblemSolved();
          changesLeft = problem.cellsNeedToBeChanged;
          incorrectChanges = problem.incorrectlyChangedCells;
          return gridWidget!;
        } (),
        Padding(
          padding: const EdgeInsets.all(10),
          child: () {
            numberButtonsWidget = SudokuButtonsPanel(numOnClick: (int val) {
              clearHighlightedCells();
              if (currentCell == null || isProblemSolved) return;
              var boardCell = problem.board.elementAt(currentCell!.rowNo).elementAt(currentCell!.cellNo);
              if (boardCell.editable) {
                if (!isInNotesMode) {
                  boardCell.value = val;
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
                if (problem.checkProblemSolved()) {
                  setState(() {
                    isProblemSolved = true;
                  });
                  showWinAlert();
                }
                setState(() {
                  changesLeft = problem.cellsNeedToBeChanged;
                  incorrectChanges = problem.incorrectlyChangedCells;
                  isProblemInInitState = false;
                });
              }
            },
            notesOnClick: () {
              isInNotesMode = !isInNotesMode;
            },);
            return numberButtonsWidget;
          } ()
        ),
        TextButton(
          onPressed: () {
            currentCell?.currentState?.deselect();
            currentCell = null;
            clearHighlightedCells();
            problem.board = problem.initState.map((r) => r.map((c)
            {
              var result = SudokuCell(c.row, c.col, c.editable, c.value);
              result.candidates = [...c.candidates];
              return result;
            }).toList()).toList();
            problem.checkProblemSolved();
            isProblemSolved = false;
            isCellsHighlightNeeded = true;
            isProblemInInitState = true;
            changesLeft = problem.cellsNeedToBeChanged;
            incorrectChanges = problem.incorrectlyChangedCells;
            setState(() {});
            highlightCells();
          }, 
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.restart_alt, size: 16),
              Padding(padding: const EdgeInsets.only(left: 5), child: Text(AppLocalizations.of(context).reset))
            ]
          )
        )
      ],
    );
  }

  Widget getGameStatsPanel(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            crossAxisAlignment: !ScreenSizeHelpers.isVerticalOrientation(context) ? CrossAxisAlignment.start : CrossAxisAlignment.center,
            children: [
              Text("${AppLocalizations.of(context).problemChangesLeft}${problem.cellsNeedToBeChanged}"),
              problem.incorrectlyChangedCells != 0 ? Text("${AppLocalizations.of(context).problemIncorrectlyChangedCells}${problem.incorrectlyChangedCells}") : const Text(""),
            ]
          ),
        ]
      ),
    );
  }

  void clearHighlightedCells() {
    for (var cell in highlightedCells) {
      cell.currentState?.deselect();
    }
    highlightedCells.clear();
  }

  void highlightCells() {
    if (isCellsHighlightNeeded) {
      if (gridWidget!.currentState == null) {
        return;
      }
      for (var cell in problem.initColoredCells.keys) {
        var cellWidget = gridWidget?.currentState?.cellWidgets.elementAt(cell.row).children.elementAt(cell.col) as SudokuCellWidget;
        highlightedCells.add(cellWidget);
        cellWidget.currentState?.setCellColor(problem.initColoredCells[cell]!);
      }
      isCellsHighlightNeeded = false;
    }
  }

  Future<void> showWinAlert() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context).congratulations),
          content: Text(AppLocalizations.of(context).problemSolved),
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