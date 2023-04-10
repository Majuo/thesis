import 'dart:collection';

import 'package:sudoku_app/game_internals/solver/technique_result.dart';
import 'package:sudoku_app/game_internals/solver/techniques/i_sudoku_technique.dart';
import 'package:sudoku_app/game_internals/sudoku.dart';
import 'package:sudoku_app/game_internals/sudoku_cell.dart';

class SudokuRulesTechnique implements ISudokuTechnique {
	const SudokuRulesTechnique();

	@override
	TechniqueResult? trySolve(Sudoku sudoku, {bool applyResult = false}) {
		int solution = 0;
		int rowNo = 0;
		int colNo = 0;
		for (var i = 0; i < 9; i++) {
			// check rows
			var rowSet = HashSet.from(sudoku.getRowValues(i));
			rowSet.remove(0);
			if (rowSet.length == 8) {
				solution = Sudoku.numSet.difference(rowSet).single;
				colNo = sudoku.getRowCells(i).firstWhere((c) => c.value == 0).col;
				if (applyResult)
				{
          var cell = sudoku.board.elementAt(i).elementAt(colNo);
				  cell.value = solution;
          cell.candidates.clear();
          var peerCells = sudoku.getPeerCells(i, colNo);
          for (var pc in peerCells) {
            pc.candidates.remove(solution);
          }
				}
				return TechniqueResult(successful: true, applicableCells: List.from({SudokuCell(i, colNo, true, solution)}), usedTechnique: SudokuRulesTechnique);
			}
			// check columns
			var colSet = HashSet.from(sudoku.getColumnValues(i));
			colSet.remove(0);
			if (colSet.length == 8) {
				solution = Sudoku.numSet.difference(colSet).single;
				rowNo = sudoku.getColumnCells(i).firstWhere((c) => c.value == 0).row;
				if (applyResult)
				{
          var cell = sudoku.board.elementAt(rowNo).elementAt(i);
          cell.value = solution;
          cell.candidates.clear();
          var peerCells = sudoku.getPeerCells(rowNo, i);
          for (var pc in peerCells) {
            pc.candidates.remove(solution);
          }
				}
				return TechniqueResult(successful: true, applicableCells: List.from({SudokuCell(rowNo, i, true, solution)}), usedTechnique: SudokuRulesTechnique);
			}
		}
		// check blocks
		for (var i = 0; i < 9; i += 3) {
			for (var j = 0; j < 9; j += 3) {
				var blockCells = sudoku.getBlockCells(i, j);
				var blockSet = HashSet.from(blockCells.map((c) => c.value));
				blockSet.remove(0);
				if (blockSet.length == 8) {
					solution = Sudoku.numSet.difference(blockSet).single;
					var cell = blockCells.firstWhere((c) => c.value == 0);
					if (applyResult)
					{
					  cell.value = solution;
            cell.candidates.clear();
            var peerCells = sudoku.getPeerCells(cell.row, cell.col);
            for (var pc in peerCells) {
              pc.candidates.remove(solution);
            }
					}
					return TechniqueResult(successful: true, applicableCells: List.from({SudokuCell(cell.row, cell.col, true, solution)}), usedTechnique: SudokuRulesTechnique);
				}
			}
		}
		return null;
	}
}