import 'package:flutter/material.dart';
import 'package:sudoku_app/widgets/sudoku_grid.dart';

class SudokuCellWidget extends StatefulWidget {
  static const double defaultBorderWidth = 1;
  static const double outerBorderWidth = 4;
  static const double innerThickBorderWidth = 2;
  static double cellSize = 0;
	SudokuCellWidget({
			super.key,
			required this.getCellContent,
			required this.handleOnTap,
      required this.rowNo,
      required this.cellNo
		});
  final int cellNo;
  final int rowNo;
	final VoidCallback handleOnTap;

	final Function(double) getCellContent;
  SudokuCellWidgetState? currentState;

  @override
  State<SudokuCellWidget> createState() {
    currentState = SudokuCellWidgetState(handleOnTap: handleOnTap);
    return currentState as SudokuCellWidgetState;
  }

  static Border getCellBorder(int row, int cell, BuildContext context)
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
      top: BorderSide(color: Theme.of(context).primaryColorDark, width: topBorderWidth),
      bottom: BorderSide(color: Theme.of(context).primaryColorDark, width: bottomBorderWidth),
      left: BorderSide(color: Theme.of(context).primaryColorDark, width: leftBorderWidth),
      right: BorderSide(color: Theme.of(context).primaryColorDark, width: rightBorderWidth)
    );
  }
}

class SudokuCellWidgetState extends State<SudokuCellWidget> {

  double cellSize = 0;

	final VoidCallback handleOnTap;
	SudokuCellWidgetState({required this.handleOnTap});
  Color? cellColor;

  void triggerRedraw() {
    if (!mounted) return;
    setState(() { });
  }

  void deselect() {
    if (!mounted) return;
    setState(() {
      cellColor = Theme.of(context).primaryColorLight;
    });
  }

  void selectCurrent() {
    if (!mounted) return;
    setState(() {
      cellColor = const Color.fromRGBO(255, 245, 99, 1);
    });
  }

  void highlight() {
    if (!mounted) return;
    setState(() {
      cellColor = Colors.green;
    });
  }

  void highlightError() {
    if (!mounted) return;
    setState(() {
      cellColor = const Color.fromARGB(255, 255, 109, 98);
    });
  }

  void setCellColor(Color color) {
    if (!mounted) return;
    setState(() {
      cellColor = color;
    });
  }

	@override
	Widget build(BuildContext context) {
    setState(() {
      cellSize = (SudokuGrid.gridSize - 2 * SudokuCellWidget.outerBorderWidth - 4 * SudokuCellWidget.innerThickBorderWidth - 12 * SudokuCellWidget.defaultBorderWidth) / 9;
    });
    widget.currentState = this;
		return GestureDetector(
			onTap: widget.handleOnTap,
      child: Container(
        decoration: BoxDecoration(
          border: SudokuCellWidget.getCellBorder(widget.rowNo, widget.cellNo, context),
        ),
        child: ColoredBox(
          color: cellColor ?? Theme.of(context).primaryColorLight,
          child: SizedBox(
            width: cellSize,
            height: cellSize,
            child: Center(
              child: widget.getCellContent(cellSize)
            ),
          ),
        ),
      ),
		);
	}
}