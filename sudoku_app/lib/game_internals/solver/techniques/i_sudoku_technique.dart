import 'package:sudoku_app/game_internals/sudoku.dart';

abstract class ISudokuTechnique {
	String name();
	bool trySolve(Sudoku board, int rowNo, int colNo, {bool applyResult = false});
}