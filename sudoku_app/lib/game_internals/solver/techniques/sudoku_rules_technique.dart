import 'dart:collection';

import 'package:sudoku_app/game_internals/solver/techniques/i_sudoku_technique.dart';
import 'package:sudoku_app/game_internals/sudoku.dart';

class SudokuRulesTechnique implements ISudokuTechnique {
	const SudokuRulesTechnique();

	@override
	bool trySolve(Sudoku sudoku, int rowNo, int colNo, {bool applyResult = false}) {
		int solution = 0;
		var numSet = HashSet.from({1, 2, 3, 4, 5, 6, 7, 8, 9});
		// solve by row
		var rowSet = HashSet.from(sudoku.getRowValues(rowNo));
		rowSet.remove(0);
		if (rowSet.length == 8) {
			solution = numSet.difference(rowSet).single as int;
			if (applyResult)
			{
				sudoku.board.elementAt(rowNo).elementAt(colNo).value = solution;
			}
			return true;
		}
		// solve by column
		var colSet = HashSet.from(sudoku.getColumnValues(colNo));
		colSet.remove(0);
		if (colSet.length == 8) {
			solution = numSet.difference(colSet).single as int;
			if (applyResult)
			{
				sudoku.board.elementAt(rowNo).elementAt(colNo).value = solution;
			}
			return true;
		}
		// solve by block
		var blockSet = HashSet.from(sudoku.getBlockValues(rowNo, colNo));
		blockSet.remove(0);
		if (blockSet.length == 8) {
			solution = numSet.difference(blockSet).single as int;
			if (applyResult)
			{
				sudoku.board.elementAt(rowNo).elementAt(colNo).value = solution;
			}
			return true;
		}
		return false;
	}

	@override
	String name() {
		return "sudokuRules";
	}
}