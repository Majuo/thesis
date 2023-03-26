import 'package:flutter/material.dart';
import 'package:sudoku_app/widgets/sudoku_grid.dart';

class HomePage extends StatefulWidget {
	const HomePage({super.key});

	@override
	State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SudokuGrid grid = const SudokuGrid();

	void _incrementCounter() {
		setState(() {
		});
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: Center(
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: <Widget>[
						grid,
					],
				),
			),
		);
	}
}