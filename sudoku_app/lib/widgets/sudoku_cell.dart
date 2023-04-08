import 'package:flutter/material.dart';

class SudokuCellWidget extends StatefulWidget {
  static const double defaultBorderWidth = 1;
  static const double outerBorderWidth = 4;
  static const double innerThickBorderWidth = 2;
  static double cellSize = 40;
  static const Color borderColor = Colors.black;
	SudokuCellWidget({
			super.key,
			required this.getCellContent,
			required this.handleOnTap,
      required this.rowNo,
      required this.cellNo
		});
  int cellNo;
  int rowNo;
	final VoidCallback handleOnTap;
	bool isCurrentCell = false;

	final Function getCellContent;
  SudokuCellWidgetState? currentState;

  @override
  State<SudokuCellWidget> createState() {
    currentState = SudokuCellWidgetState(handleOnTap: handleOnTap);
    return currentState as SudokuCellWidgetState;
  }

  static Border getCellBorder(int row, int cell)
  {
    int rowModulo = row % 3;
    int cellModulo = cell % 3;
    double topBorderWidth;
    double bottomBorderWidth;
    double leftBorderWidth;
    double rightBorderWidth;
    if (rowModulo == 0 && row == 0) {
      topBorderWidth = SudokuCellWidget.outerBorderWidth;
    } else if (rowModulo == 0) {
      topBorderWidth = SudokuCellWidget.innerThickBorderWidth;
    } else {
      topBorderWidth = SudokuCellWidget.defaultBorderWidth;
    }
    if (rowModulo == 2 && row == 8) {
      bottomBorderWidth = SudokuCellWidget.outerBorderWidth;
    } else if (rowModulo == 2) {
      bottomBorderWidth = SudokuCellWidget.innerThickBorderWidth;
    } else {
      bottomBorderWidth = SudokuCellWidget.defaultBorderWidth;
    }
    if (cellModulo == 0 && cell == 0) {
      leftBorderWidth = SudokuCellWidget.outerBorderWidth;
    } else if (cellModulo == 0) {
      leftBorderWidth = SudokuCellWidget.innerThickBorderWidth;
    } else {
      leftBorderWidth = SudokuCellWidget.defaultBorderWidth;
    }
    if (cellModulo == 2 && cell == 8) {
      rightBorderWidth = SudokuCellWidget.outerBorderWidth;
    } else if (cellModulo == 2) {
      rightBorderWidth = SudokuCellWidget.innerThickBorderWidth;
    } else {
      rightBorderWidth = SudokuCellWidget.defaultBorderWidth;
    }
    return Border(
      top: BorderSide(color: SudokuCellWidget.borderColor, width: topBorderWidth),
      bottom: BorderSide(color: SudokuCellWidget.borderColor, width: bottomBorderWidth),
      left: BorderSide(color: SudokuCellWidget.borderColor, width: leftBorderWidth),
      right: BorderSide(color: SudokuCellWidget.borderColor, width: rightBorderWidth)
    );
  }
}

class SudokuCellWidgetState extends State<SudokuCellWidget> {

	final VoidCallback handleOnTap;
	SudokuCellWidgetState({required this.handleOnTap});
  Color cellColor = Colors.white;

  void triggerRedraw() {
    setState(() { });
  }

  void deselect() {
    setState(() {
      cellColor = Colors.white;
    });
  }

  void selectCurrent() {
    setState(() {
      cellColor = Colors.yellow;
    });
  }

  void highlight() {
    setState(() {
      cellColor = Colors.green;
    });
  }

	@override
	Widget build(BuildContext context) {
		return GestureDetector(
			onTap: widget.handleOnTap,
      child: Container(
        decoration: BoxDecoration(
          border: SudokuCellWidget.getCellBorder(widget.rowNo, widget.cellNo)
        ),
        child: ColoredBox(
          color: cellColor,
          child: SizedBox(
            width: SudokuCellWidget.cellSize,
            height: SudokuCellWidget.cellSize,
            child: Center(
              child: widget.getCellContent()
            ),
          ),
        ),
      ),
		);
	}
}