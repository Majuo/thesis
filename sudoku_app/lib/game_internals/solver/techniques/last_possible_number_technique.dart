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
			var missingNums = Sudoku.numSet.difference(sudoku.getPeerValues(cell.row, cell.col));
			if (missingNums.length == 1) {
				if (applyResult) {
          cell.candidates.clear();
				  cell.value = missingNums.first;
          var peerCells = sudoku.getPeerCells(cell.row, cell.col);
          for (var pc in peerCells) {
            pc.candidates.remove(missingNums.first);
          }
				}
				return TechniqueResult(successful: true, applicableCells: List.from({SudokuCell(cell.row, cell.col, true, missingNums.first)}), usedTechnique: LastPossibleNumberTechnique);
			}
		}
	}
		return null;
	}
}