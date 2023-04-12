import 'package:flutter/material.dart';
import 'package:sudoku_app/widgets/sudoku_game.dart';

class GamePage extends StatefulWidget {
	const GamePage({super.key});

	@override
	State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  SudokuGame grid = const SudokuGame();

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