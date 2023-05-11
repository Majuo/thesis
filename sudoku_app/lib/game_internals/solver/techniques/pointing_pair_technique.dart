import 'package:sudoku_app/game_internals/solver/techniques/i_sudoku_technique.dart';
import 'package:sudoku_app/game_internals/sudoku.dart';
import 'package:sudoku_app/game_internals/solver/technique_result.dart';
import 'package:sudoku_app/game_internals/sudoku_cell.dart';

class PointingPairTechnique implements ISudokuTechnique {
	const PointingPairTechnique();

	@override
	TechniqueResult? trySolve(Sudoku sudoku, {bool applyResult = false}) {
    for (var i = 0; i < 9; i += 3) {
      for (var j = 0; j < 9; j += 3) {
        var emptyBlockCells = sudoku.getBlockCells(i, j).where((cell) => cell.value == 0);
        Map<int, int> candidateCountMap = {};
        for (var cell in emptyBlockCells) {
          for (var cellCandidate in cell.candidates) {
            if (candidateCountMap.containsKey(cellCandidate)) {
              candidateCountMap[cellCandidate] = candidateCountMap[cellCandidate]! + 1;
            } else {
              candidateCountMap[cellCandidate] = 1;
            }
          }
        }
        var suitableCandidates = candidateCountMap.keys.where((k) => candidateCountMap[k] == 2);
        for (var sc in suitableCandidates) {
          var candidateCells = emptyBlockCells.where((bc) => bc.candidates.contains(sc));
          Iterable<SudokuCell> cellsToRemoveCandidate;
          if (Sudoku.areCellsInOneRow(candidateCells)) {
            cellsToRemoveCandidate = sudoku.getRowCells(candidateCells.first.row).where((c) => c.candidates.contains(sc) && !candidateCells.map((cc) => cc.col).contains(c.col));
          } else if (Sudoku.areCellsInOneColumn(candidateCells)) {
            cellsToRemoveCandidate = sudoku.getColumnCells(candidateCells.first.col).where((c) => c.candidates.contains(sc) && !candidateCells.map((cc) => cc.row).contains(c.row));
          } else {
            continue;
          }
          if (cellsToRemoveCandidate.isEmpty) continue;
          if (applyResult) {
            for (var cell in cellsToRemoveCandidate) {
              cell.candidates.remove(sc);
            }
          }
          var resultCells = cellsToRemoveCandidate.map((c) {
            var r = SudokuCell(c.row, c.col, true, c.value);
            r.candidates = {sc}.toList();
            return r;
          }).toList();
          return TechniqueResult(applicableCells: candidateCells.toList(), removedCandidates: resultCells, usedTechnique: PointingPairTechnique);
        }
      }
    }
		return null;
	}
}