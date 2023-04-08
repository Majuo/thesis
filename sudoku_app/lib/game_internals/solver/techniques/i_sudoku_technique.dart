import 'package:sudoku_app/game_internals/sudoku.dart';
import 'package:sudoku_app/game_internals/solver/technique_result.dart';

abstract class ISudokuTechnique {
	TechniqueResult? trySolve(Sudoku sudoku, {bool applyResult = false});
}