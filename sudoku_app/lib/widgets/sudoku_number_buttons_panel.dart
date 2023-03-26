import 'package:flutter/material.dart';
import 'package:sudoku_app/widgets/sudoku_cell.dart';
import 'package:sudoku_app/widgets/sudoku_grid.dart';

class SudokuNumberButtonsPanel extends StatelessWidget {
  SudokuNumberButtonsPanel({super.key, required this.onClick});

  Function(int) onClick;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SudokuGrid.gridSize * 1.2,
      height: SudokuCellWidget.cellSize,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: 
          () {
            List<Widget> result = List.empty(growable: true);
            for (var i = 1; i < 11; i++) {
              if (i < 10) {
                result.add(SizedBox(
                  width: SudokuCellWidget.cellSize,
                  height: SudokuCellWidget.cellSize,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3)
                        ),
                      ),
                    ),
                    onPressed: () {
                    onClick(i);
                  },
                    child: Text(i.toString())
                  ),
                ));
                continue;
              }
              result.add(SizedBox(
                width: SudokuCellWidget.cellSize,
                height: SudokuCellWidget.cellSize,
                child: IconButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3)
                      ),
                    ),
                  ),
                  onPressed: () {
                    onClick(0);
                  },
                  icon: const Icon(Icons.clear)
                )
              ));
            }
            return result;
          }(),
      )
    );
  }

}