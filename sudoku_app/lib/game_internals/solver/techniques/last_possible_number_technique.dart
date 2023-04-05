import 'dart:collection';

import 'package:sudoku_app/game_internals/solver/techniques/i_sudoku_technique.dart';
import 'package:sudoku_app/game_internals/sudoku.dart';
import 'package:sudoku_app/game_internals/solver/technique_result.dart';
import 'package:sudoku_app/game_internals/sudoku_cell.dart';

class LastPossibleNumberTechnique implements ISudokuTechnique {
	const LastPossibleNumberTechnique();

	@override
	TechniqueResult? trySolve(Sudoku sudoku, {bool applyResult = false}) {
	for (var row in sudoku.board) {
		for (var cell in row.where((c) => c.value == 0)) {
			var peerSet = HashSet.from(sudoku.getRowValues(cell.row));
			peerSet.addAll(HashSet.from(sudoku.getColumnValues(cell.col)));
			peerSet.addAll(HashSet.from(sudoku.getBlockValuesByCell(cell)));
			var missingNums = Sudoku.numSet.difference(peerSet);
			if (missingNums.length == 1) {
				if (applyResult) {
				cell.value = missingNums.first;
				}
				return TechniqueResult(successful: true, solvedCell: SudokuCell(cell.row, cell.col, true, missingNums.first), usedTechnique: LastPossibleNumberTechnique);
			}
		}
	}
		return null;
	}

	@override
	String name() {
		return "lastPossibleNumber";
	}
}