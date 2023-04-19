import 'package:flutter/material.dart';
import 'package:sudoku_app/game_internals/i_have_sudoku_board.dart';
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
	IHaveSudokuBoard game;
  Function(SudokuCell) cellHandleOnTap;
  SudokuGridState? currentState;
  static double gridSize = 0;

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
  double gridSize = 0;
	IHaveSudokuBoard game;
  List<Row> cellWidgets = List.empty(growable: true);
  @override
  Widget build(BuildContext context) {
    setState(() {
      gridSize = SudokuGrid.gridSize;
    });
    widget.currentState = this;
    cellWidgets.clear();
    return SizedBox(
      width: gridSize,
      height: gridSize,
      child: Center(
        child: Column(
          children: (() {
            for (var row in game.board) {
              var rowWidget = Row(children: List.empty(growable: true),);
              for (var cell in row) {
                var cellWidget = SudokuCellWidget(
                  getCellContent: (double cellSize) {
                    if (cell.value > 0) {
                      return Text(cell.value.toString(), style: TextStyle(fontWeight: cell.editable ? FontWeight.normal : FontWeight.bold, fontSize: cellSize * 0.7),);
                    }
                    else {
                      return CellCandidates(candidates: cell.candidates, cellSize: cellSize,);
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