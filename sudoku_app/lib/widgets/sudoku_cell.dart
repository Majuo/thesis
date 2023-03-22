import 'package:flutter/material.dart';

class SudokuCellWidget extends StatelessWidget {
	SudokuCellWidget({
			super.key,
			required this.getCellContent,
			required this.handleOnTap,
		});
	void switchCurrentCell()
	{
		isCurrentCell = !isCurrentCell;
	}
	double sideSize = 40;
	bool isCurrentCell = false;

	Function handleOnTap;

	Function getCellContent;

	@override
	Widget build(BuildContext context) {
		return GestureDetector(
			onTap: handleOnTap(),
			child: ColoredBox(
				color: isCurrentCell ? Colors.yellow : Colors.white,
				child: SizedBox(
					width: sideSize,
					height: sideSize,
					child: Center(
						child: getCellContent()
					),
				),
			),
		);
	}
}