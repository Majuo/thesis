import 'package:flutter/material.dart';

class SudokuCellWidget extends StatefulWidget {
	SudokuCellWidget({
			super.key,
			required this.getCellContent,
			required this.handleOnTap,
		});
	final VoidCallback handleOnTap;
	bool isCurrentCell = false;

	final Function getCellContent;
  SudokuCellWidgetState? currentState;

  @override
  State<SudokuCellWidget> createState() {
    currentState = SudokuCellWidgetState(handleOnTap: handleOnTap);
    return currentState as SudokuCellWidgetState;
  }
}

class SudokuCellWidgetState extends State<SudokuCellWidget> {

	final VoidCallback handleOnTap;
	SudokuCellWidgetState({required this.handleOnTap});
	bool isCurrentCell = false;

  void switchSelection() {
    setState(() {
      isCurrentCell = !isCurrentCell;
    });
  }

	double sideSize = 40;

	@override
	Widget build(BuildContext context) {
		return GestureDetector(
			onTap: widget.handleOnTap,
			child: ColoredBox(
				color: isCurrentCell ? Colors.yellow : Colors.white,
				child: SizedBox(
					width: sideSize,
					height: sideSize,
					child: Center(
						child: widget.getCellContent()
					),
				),
			),
		);
	}
}