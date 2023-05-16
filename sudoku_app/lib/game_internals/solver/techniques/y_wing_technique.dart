import 'package:sudoku_app/game_internals/solver/techniques/i_sudoku_technique.dart';
import 'package:sudoku_app/game_internals/sudoku.dart';
import 'package:sudoku_app/game_internals/solver/technique_result.dart';
import 'package:sudoku_app/game_internals/sudoku_cell.dart';

class YWingTechnique implements ISudokuTechnique {
	const YWingTechnique();

	@override
	TechniqueResult? trySolve(Sudoku sudoku, {bool applyResult = false}) {
    var possiblePivots = List<SudokuCell>.empty(growable: true);
    for (var row in sudoku.board) {
      possiblePivots.addAll(row.where((cell) => cell.candidates.length == 2));
    }
    for (var pivot in possiblePivots) {
      var candidate1 = pivot.candidates.first;
      var candidate2 = pivot.candidates.skip(1).first;
      var possiblePincers = sudoku.getPeerCells(pivot.row, pivot.col)
                                  .where((c) => 
                                    c.value == 0 && c.candidates.length == 2 && 
                                      (c.candidates.contains(candidate1) ^ c.candidates.contains(candidate2)));
      if (possiblePincers.length < 2) {
        continue;
      }
      for (var pincer1 in possiblePincers) {
        for (var pincer2 in possiblePincers) {
          if (pincer1.row == pincer2.row && pincer1.col == pincer2.col) {
            continue;
          }
          var pincer1candidate = pincer1.candidates.where((pc) => !pivot.candidates.contains(pc)).first;
          var pincer2candidate = pincer2.candidates.where((pc) => !pivot.candidates.contains(pc)).first;
          if (pincer1candidate == pincer2candidate) {
            var cellsToRemoveCandidate = List<SudokuCell>.empty(growable: true);
            var pincer1peers = sudoku.getPeerCells(pincer1.row, pincer1.col).where((cell) => cell.value == 0 && cell.candidates.contains(pincer1candidate)).toList();
            pincer1peers.remove(pivot);
            var pincer2peers = sudoku.getPeerCells(pincer2.row, pincer2.col).where((cell) => cell.value == 0 && cell.candidates.contains(pincer1candidate)).toList();
            pincer2peers.remove(pivot);
            for (var pincer1peer in pincer1peers) {
              if (pincer2peers.contains(pincer1peer)) {
                cellsToRemoveCandidate.add(pincer1peer);
              }
            }
            if (cellsToRemoveCandidate.isNotEmpty) {
              if (applyResult) {
                for (var ctr in cellsToRemoveCandidate) {
                  ctr.candidates.remove(pincer1candidate);
                }
              }
              var resultCells = cellsToRemoveCandidate.map((c) {
                var r = SudokuCell(c.row, c.col, true, c.value);
                r.candidates = [ pincer1candidate ];
                return r;
              }).toList();
              return TechniqueResult(applicableCells: [ pivot, pincer1, pincer2 ], removedCandidates: resultCells, usedTechnique: YWingTechnique);
            }
          }
        }
      }
    }
		return null;
	}
}