import 'package:sudoku_app/game_internals/solver/techniques/i_sudoku_technique.dart';
import 'package:sudoku_app/game_internals/sudoku.dart';
import 'package:sudoku_app/game_internals/solver/technique_result.dart';

class YWingTechnique implements ISudokuTechnique {
	const YWingTechnique();

	@override
	TechniqueResult? trySolve(Sudoku sudoku, {bool applyResult = false}) {
		return null;
	}
}