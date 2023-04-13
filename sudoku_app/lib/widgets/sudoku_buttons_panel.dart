import 'package:flutter/material.dart';
import 'package:sudoku_app/widgets/sudoku_cell.dart';
import 'package:sudoku_app/widgets/sudoku_grid.dart';

class SudokuButtonsPanel extends StatefulWidget {
  SudokuButtonsPanel({super.key, required this.numOnClick, required this.notesOnClick});
  static const Color lightGreyColor = Color.fromRGBO(200, 200, 200, 1);
  final Function(int) numOnClick;
  final Function() notesOnClick;

  @override
  State<SudokuButtonsPanel> createState() => _SudokuButtonsPanelState();
}

class _SudokuButtonsPanelState extends State<SudokuButtonsPanel> {

  bool isInNotesMode = false;

  Color numBtnColor = Colors.blue;
  Color notesBtnColor = SudokuButtonsPanel.lightGreyColor;

  void switchButtonsColors() {
    if (isInNotesMode) {
      setState(() {
        notesBtnColor = Colors.grey;
        numBtnColor = SudokuButtonsPanel.lightGreyColor;
      });
    } else {
      setState(() {
        notesBtnColor = SudokuButtonsPanel.lightGreyColor;
        numBtnColor = Colors.blue;
      });
    }
  }

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
            for (var i = 1; i < 12; i++) {
              if (i <= 9) {
                result.add(SizedBox(
                  width: SudokuCellWidget.cellSize,
                  height: SudokuCellWidget.cellSize,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(numBtnColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3)
                        ),
                      ),
                    ),
                    onPressed: () {
                    widget.numOnClick(i);
                  },
                    child: Text(i.toString())
                  ),
                ));
                continue;
              } else if (i == 10) {
                result.add(SizedBox(
                  width: SudokuCellWidget.cellSize,
                  height: SudokuCellWidget.cellSize,
                  child: IconButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(numBtnColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3)
                        ),
                      ),
                    ),
                    onPressed: () {
                      widget.numOnClick(0);
                    },
                    icon: const Icon(Icons.clear)
                  )
                ));
              } else if (i == 11) {
                var btn = SizedBox(
                  width: SudokuCellWidget.cellSize,
                  height: SudokuCellWidget.cellSize,
                  child: IconButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(notesBtnColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3)
                        ),
                      ),
                    ),
                    onPressed: () {
                      isInNotesMode = !isInNotesMode;
                      switchButtonsColors();
                      widget.notesOnClick();
                    },
                    icon: const Icon(Icons.edit)
                  )
                );
                result.add(btn);
              }

            }
            return result;
          }(),
      )
    );
  }
}