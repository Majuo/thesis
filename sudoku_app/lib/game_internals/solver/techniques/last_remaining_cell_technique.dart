import 'package:sudoku_app/game_internals/solver/techniques/i_sudoku_technique.dart';
import 'package:sudoku_app/game_internals/sudoku.dart';
import 'package:sudoku_app/game_internals/solver/technique_result.dart';

class LastRemainingCellTechnique implements ISudokuTechnique {
	const LastRemainingCellTechnique();
	
	@override
	TechniqueResult? trySolve(Sudoku sudoku, {bool applyResult = false}) {
		return null;
	}

	@override
	String name() {
		return "lastRemainingCell";
	}
}