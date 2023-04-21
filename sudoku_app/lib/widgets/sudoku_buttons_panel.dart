import 'package:flutter/material.dart';
import 'package:sudoku_app/widgets/sudoku_cell.dart';
import 'package:sudoku_app/widgets/sudoku_grid.dart';

class SudokuButtonsPanel extends StatefulWidget {
  SudokuButtonsPanel({super.key, required this.numOnClick, required this.notesOnClick});
  static const Color lightGreyColor = Color.fromRGBO(200, 200, 200, 1);
  final Function(int) numOnClick;
  final Function() notesOnClick;
  SudokuButtonsPanelState? currentState;

  @override
  State<SudokuButtonsPanel> createState() {
    currentState = SudokuButtonsPanelState();
    return currentState as SudokuButtonsPanelState;
  }
}

class SudokuButtonsPanelState extends State<SudokuButtonsPanel> {

  bool isInNotesMode = false;

  Color? numBtnColor;
  Color notesBtnColor = SudokuButtonsPanel.lightGreyColor;

  void switchButtonsColors(BuildContext context) {
    if (isInNotesMode) {
      setState(() {
        notesBtnColor = Colors.grey;
        numBtnColor = SudokuButtonsPanel.lightGreyColor;
      });
    } else {
      setState(() {
        notesBtnColor = SudokuButtonsPanel.lightGreyColor;
        numBtnColor = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    widget.currentState = this;
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
                      backgroundColor: numBtnColor == null ? Theme.of(context).textButtonTheme.style!.backgroundColor! : MaterialStateProperty.all(numBtnColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3)
                        ),
                      ),
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                    ),
                    onPressed: () {
                      widget.numOnClick(i);
                    },
                    child: Text(i.toString(), style: TextStyle(fontSize: SudokuCellWidget.cellSize / 1.5))
                  ),
                ));
                continue;
              } else if (i == 10) {
                result.add(SizedBox(
                  width: SudokuCellWidget.cellSize,
                  height: SudokuCellWidget.cellSize,
                  child: IconButton(
                    style: ButtonStyle(
                      backgroundColor: numBtnColor == null ? Theme.of(context).textButtonTheme.style!.backgroundColor! : MaterialStateProperty.all(numBtnColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3)
                        ),
                      ),
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                    ),
                    onPressed: () {
                      widget.numOnClick(0);
                    },
                    icon: Icon(Icons.clear, size: SudokuCellWidget.cellSize / 1.7)
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
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                    ),
                    onPressed: () {
                      isInNotesMode = !isInNotesMode;
                      switchButtonsColors(context);
                      widget.notesOnClick();
                    },
                    icon: Icon(Icons.edit, size: SudokuCellWidget.cellSize / 1.7)
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