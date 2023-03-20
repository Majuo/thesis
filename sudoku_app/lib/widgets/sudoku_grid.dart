import 'package:flutter/material.dart';
import 'dart:math' as math;

class SudokuGrid extends StatefulWidget {
	const SudokuGrid({super.key});

	@override
	State<SudokuGrid> createState() => _SudokuGridState();
}

class _SudokuGridState extends State<SudokuGrid> {
  Color cellColor = Colors.green;
	List<Widget> cells = List.empty();

  @override
  void initState() {
    super.initState();
  }

  void changeCellColor() {
    setState(() {
      cellColor = Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    });
  }

  @override
	Widget build(BuildContext context) {
		return SizedBox(
      width: 360,
      height: 360,
      child: Center(
        child: Wrap(
          children: List.filled(
            81,
            GestureDetector(
              onTap: () {
                changeCellColor();
              },
              child: SizedBox(
                width: 40,
                height: 40,
                child: ColoredBox(
                  color: cellColor,
                ),
              )
            )
          ),
        ),
      ),
    );
	}
}