import 'package:sudoku_app/game_internals/solver/techniques/i_sudoku_technique.dart';
import 'package:sudoku_app/game_internals/sudoku.dart';
import 'package:sudoku_app/game_internals/solver/technique_result.dart';
import 'package:sudoku_app/game_internals/sudoku_cell.dart';

class HiddenSingleTechnique implements ISudokuTechnique {
	const HiddenSingleTechnique();

	@override
	TechniqueResult? trySolve(Sudoku sudoku, {bool applyResult = false}) {
    Iterable<SudokuCell> emptyUnitCells = {};
    Map<int, int> candidateMap = {};
    TechniqueResult? unitResult;
    for (var i = 0; i < 9; i++) {
      // check rows
      emptyUnitCells = sudoku.getRowCells(i).where((c) => c.value == 0);
      unitResult = trySolveForCells(emptyUnitCells, candidateMap, applyResult, sudoku);
      if (unitResult != null) return unitResult;

      // check columns
      emptyUnitCells = sudoku.getColumnCells(i).where((c) => c.value == 0);
      unitResult = trySolveForCells(emptyUnitCells, candidateMap, applyResult, sudoku);
      if (unitResult != null) return unitResult;
    }
    // check blocks
    for (var i = 0; i < 9; i += 3) {
      for (var j = 0; j < 9; j += 3) {
        emptyUnitCells = sudoku.getBlockCells(i, j).where((c) => c.value == 0);
        unitResult = trySolveForCells(emptyUnitCells, candidateMap, applyResult, sudoku);
        if (unitResult != null) return unitResult;
      }
    }
		return null;
	}

  TechniqueResult? trySolveForCells(Iterable<SudokuCell> cells, Map<int, int> candidateMap, bool applyResult, Sudoku sudoku) {
    candidateMap.clear();
    for (var cell in cells) {
      for (var candidate in cell.candidates) {
        if (candidateMap.containsKey(candidate)) {
          candidateMap[candidate] = candidateMap[candidate]! + 1;
        } else {
          candidateMap[candidate] = 1;
        }
      }
    }
    for (var key in candidateMap.keys) {
      if (candidateMap[key] == 1) {
        var resultCell = cells.firstWhere((c) => c.candidates.contains(key));
        if (applyResult) {
          resultCell.candidates.clear();
          resultCell.value = key;
          var peerCells = sudoku.getPeerCells(resultCell.row, resultCell.col);
          for (var pc in peerCells) {
            pc.candidates.remove(key);
          }
        }
        return TechniqueResult(applicableCells: [resultCell], removedCandidates: [SudokuCell(resultCell.row, resultCell.col, false, resultCell.value)], usedTechnique: HiddenSingleTechnique);
      }
    }
    return null;
  }
}