import 'dart:collection';

import 'package:sudoku_app/game_internals/solver/techniques/i_sudoku_technique.dart';
import 'package:sudoku_app/game_internals/sudoku.dart';
import 'package:sudoku_app/game_internals/solver/technique_result.dart';
import 'package:sudoku_app/game_internals/sudoku_cell.dart';

class HiddenPairTechnique implements ISudokuTechnique {
	const HiddenPairTechnique();

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
    var suitableCandidates = candidateMap.keys.where((k) => candidateMap[k] == 2);
    if (suitableCandidates.length < 2) return null;
    Map<int, Iterable<SudokuCell>> candidateCellMap = {};
    for (var sc in suitableCandidates) {
      candidateCellMap[sc] = cells.where((c) => c.candidates.contains(sc));
    }
    // check all combinations
    var counter = 1;
    for (var me in candidateCellMap.entries) {
      if (counter == candidateCellMap.entries.length) break;
      for (var me1 in candidateCellMap.entries.skip(counter)) {
        HashSet<SudokuCell> cellSet = HashSet.from(me.value);
        cellSet.addAll(me1.value);
        if (cellSet.length == 2) {
          if (cellSet.every((c) => c.candidates.length == 2)) return null;
          if (applyResult) {
            for (var c in cellSet) {
              c.candidates = [me.key, me1.key];
            }
          }
          var removedCandidatesResult = cellSet.map((c) {
            var r = SudokuCell(c.row, c.col, true, c.value);
            r.candidates = c.candidates.where((c) => c != me.key && c != me1.key).map((cc) => cc).toList();
            return r;
          });
          return TechniqueResult(successful: true, applicableCells: cellSet.toList(), removedCandidates: removedCandidatesResult.toList(), usedTechnique: HiddenPairTechnique);
        }
      }
      counter++;
    }
    return null;
  }
}