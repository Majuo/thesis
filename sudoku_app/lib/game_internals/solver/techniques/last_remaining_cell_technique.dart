import 'dart:collection';

import 'package:sudoku_app/game_internals/solver/techniques/i_sudoku_technique.dart';
import 'package:sudoku_app/game_internals/sudoku.dart';
import 'package:sudoku_app/game_internals/solver/technique_result.dart';
import 'package:sudoku_app/game_internals/sudoku_cell.dart';

class LastRemainingCellTechnique implements ISudokuTechnique {
	const LastRemainingCellTechnique();
	
	@override
	TechniqueResult? trySolve(Sudoku sudoku, {bool applyResult = false}) {
		for (var i = 0; i < 9; i++) {
			// check rows
			var rowCells = sudoku.getRowCells(i);
			var rowSet = HashSet.from(rowCells.map((c) => c.value));
			rowSet.remove(0);
			var missingNums = Sudoku.numSet.difference(rowSet);
			var emptyCells = rowCells.where((c) => c.value == 0);
			for (var num in missingNums) {
				SudokuCell? fittingCell;
				bool success = true;
				for (var cell in emptyCells) {
					if (!sudoku.getColumnValues(cell.col).contains(num) && !sudoku.getBlockValues(cell.row, cell.col).contains(num)) {
						if (fittingCell != null) {
							success = false;
							break;
						}
						fittingCell = cell;
					}
				}
				if (success) {
					if (applyResult) {
					  fittingCell!.value = num;
					}
					return TechniqueResult(successful: true, solvedCell: SudokuCell(fittingCell!.row, fittingCell.col, true, num));
				}
			}
			// check columns
			var colCells = sudoku.getColumnCells(i);
			var colSet = HashSet.from(colCells.map((c) => c.value));
			colSet.remove(0);
			missingNums = Sudoku.numSet.difference(colSet);
			emptyCells = colCells.where((c) => c.value == 0);
			for (var num in missingNums) {
				SudokuCell? fittingCell;
				bool success = true;
				for (var cell in emptyCells) {
					if (!sudoku.getRowValues(cell.row).contains(num) && !sudoku.getBlockValues(cell.row, cell.col).contains(num)) {
						if (fittingCell != null) {
							success = false;
							break;
						}
						fittingCell = cell;
					}
				}
				if (success) {
					if (applyResult) {
					  fittingCell!.value = num;
					}
					return TechniqueResult(successful: true, solvedCell: SudokuCell(fittingCell!.row, fittingCell.col, true, num));
				}
			}
		}
		// check blocks
		for (var i = 0; i < 9; i += 3) {
			for (var j = 0; j < 9; j += 3) {
				var blockCells = sudoku.getBlockCells(i, j);
				var blockSet = HashSet.from(blockCells.map((c) => c.value));
				blockSet.remove(0);
				var missingNums = Sudoku.numSet.difference(blockSet);
				var emptyCells = blockCells.where((c) => c.value == 0);
				for (var num in missingNums) {
					SudokuCell? fittingCell;
					bool success = true;
					for (var cell in emptyCells) {
						if (!sudoku.getRowValues(cell.row).contains(num) && !sudoku.getColumnValues(cell.col).contains(num)) {
							if (fittingCell != null) {
								success = false;
								break;
							}
							fittingCell = cell;
						}
					}
					if (success) {
						if (applyResult) {
						fittingCell!.value = num;
						}
						return TechniqueResult(successful: true, solvedCell: SudokuCell(fittingCell!.row, fittingCell.col, true, num));
					}
				}
			}
		}
		return null;
	}

	@override
	String name() {
		return "lastRemainingCell";
	}
}