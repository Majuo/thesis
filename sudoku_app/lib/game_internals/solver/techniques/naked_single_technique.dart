import 'package:sudoku_app/game_internals/solver/techniques/i_sudoku_technique.dart';
import 'package:sudoku_app/game_internals/sudoku.dart';
import 'package:sudoku_app/game_internals/solver/technique_result.dart';
import 'package:sudoku_app/game_internals/sudoku_cell.dart';

class NakedSingleTechnique implements ISudokuTechnique {
	const NakedSingleTechnique();

	@override
	TechniqueResult? trySolve(Sudoku sudoku, {bool applyResult = false}) {
    for (var row in sudoku.board) {
      for (var cell in row) {
        if (cell.value == 0 && cell.candidates.isNotEmpty && cell.candidates.length == 1) {
          var candidate = cell.candidates.first;
          if (applyResult) {
            cell.value = cell.candidates.first;
            cell.candidates.clear();
            var peerCells = sudoku.getPeerCells(cell.row, cell.col);
            for (var pc in peerCells) {
              pc.candidates.remove(candidate);
            }
          }
          return TechniqueResult(successful: true, applicableCells: List.from({SudokuCell(cell.row, cell.col, true, candidate)}), usedTechnique: NakedSingleTechnique);
        }
      }
    }
		return null;
	}
}