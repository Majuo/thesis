import 'package:flutter/material.dart';
import 'package:sudoku_app/widgets/sudoku_cell.dart';

class CellCandidates extends StatelessWidget {
  CellCandidates({super.key, required this.candidates});
  final List<int> candidates;

  double getFontSize() {
    double result = SudokuCellWidget.cellSize ~/ 3 - 2;
    return result > 8 ? result : 8;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SudokuCellWidget.cellSize,
      height: SudokuCellWidget.cellSize,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: () {
          List<Widget> rows = List.empty(growable: true);
          for (var i = 0; i < 3; i++) {
            var row = Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: List.empty(growable: true),);
            for (var j = 1; j < 4; j++) {
              int candidate = i * 3 + j;
              row.children.add(
                SizedBox(
                  height: SudokuCellWidget.cellSize / 3,
                  width: SudokuCellWidget.cellSize / 3,
                  child: Center(
                    child: Text(
                      candidates.contains(candidate) ? candidate.toString() : " ",
                      style: TextStyle(fontSize: getFontSize()),
                    ),
                  ),
                ));
            }
            rows.add(row);
          }
          return rows;
        }()
      ),
    );
  }
}