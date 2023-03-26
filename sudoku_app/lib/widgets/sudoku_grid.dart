import 'package:flutter/material.dart';
import 'package:sudoku_app/game_internals/sudoku.dart';

import 'package:sudoku_app/widgets/sudoku_cell.dart';

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

  @override
	Widget build(BuildContext context) {
		return SizedBox(
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
                        return Text(cell.value.toString(), style: TextStyle(fontWeight: cell.editable ? FontWeight.normal : FontWeight.bold),);
                      }
                      else {
                        // replace later
                        return Text(cell.candidates.join(","));
                      }
                    },
                    handleOnTap: () {
                      var newCurrentCell = cellWidgets.elementAt(cell.row).elementAt(cell.col);
                      if (currentCell == newCurrentCell) {
                        currentCell?.currentState?.switchSelection();
                        currentCell = null;
                      }
                      else {
                        currentCell?.currentState?.switchSelection();
                        currentCell = cellWidgets.elementAt(cell.row).elementAt(cell.col);
                        currentCell?.currentState?.switchSelection();
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
    );
	}
}