import 'package:sudoku_app/game_internals/solver/techniques/i_sudoku_technique.dart';
import 'package:sudoku_app/game_internals/sudoku.dart';

class LastRemainingCellTechnique implements ISudokuTechnique {
	const LastRemainingCellTechnique();
	
	@override
	bool trySolve(Sudoku board, int rowNo, int colNo, {bool applyResult = false}) {
		return false;
	}

	@override
	String name() {
		return "lastRemainingCell";
	}
}