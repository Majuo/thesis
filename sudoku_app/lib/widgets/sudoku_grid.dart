import 'package:flutter/material.dart';
import 'package:sudoku_app/game_internals/sudoku_cell.dart';
import 'package:sudoku_app/widgets/cell_candidates.dart';
import 'package:sudoku_app/widgets/sudoku_cell.dart';

import '../game_internals/sudoku.dart';

class SudokuGrid extends StatefulWidget {
  SudokuGrid({
    super.key,
    required this.game,
    required this.cellHandleOnTap
  });
	Sudoku game;
  Function(SudokuCell) cellHandleOnTap;
  SudokuGridState? currentState;
  static double gridSize = SudokuCellWidget.cellSize * 9 + SudokuCellWidget.outerBorderWidth * 2 + SudokuCellWidget.innerThickBorderWidth * 4 + SudokuCellWidget.defaultBorderWidth * 12;

  @override
  State<SudokuGrid> createState() {
    currentState = SudokuGridState(game: game);
    return currentState!;
    }
}

class SudokuGridState extends State<SudokuGrid> {
  SudokuGridState({
    required this.game
  });
	Sudoku game; 
  List<Row> cellWidgets = List.empty(growable: true);
  @override
  Widget build(BuildContext context) {
    widget.currentState = this;
    cellWidgets.clear();
    return SizedBox(
      width: SudokuGrid.gridSize,
      height: SudokuGrid.gridSize,
      child: Center(
        child: Column(
          children: (() {
            for (var row in game.board) {
              var rowWidget = Row(children: List.empty(growable: true),);
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
                      widget.cellHandleOnTap(cell);
                    },
                    rowNo: cell.row,
                    cellNo: cell.col
                  );
                  rowWidget.children.add(cellWidget);
              }
              cellWidgets.add(rowWidget);
            }
            return cellWidgets;
          })()
        ),
      ),
    );
  }
}