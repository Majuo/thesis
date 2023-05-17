import 'package:flutter/foundation.dart';
import 'package:sudoku_app/game_internals/solver/techniques/i_sudoku_technique.dart';
import 'package:sudoku_app/game_internals/sudoku.dart';
import 'package:sudoku_app/game_internals/solver/technique_result.dart';

import '../../sudoku_cell.dart';

class SwordfishTechnique implements ISudokuTechnique {
	const SwordfishTechnique();

	@override
	TechniqueResult? trySolve(Sudoku sudoku, {bool applyResult = false}) {
    var matchFound = false;
    var firstMatchingRowCells = List<SudokuCell>.empty(growable: true);
    var secondMatchingRowCells = List<SudokuCell>.empty(growable: true);
    var thirdMatchingRowCells = List<SudokuCell>.empty(growable: true);
    var firstMatchingColCells = List<SudokuCell>.empty(growable: true);
    var secondMatchingColCells = List<SudokuCell>.empty(growable: true);
    var thirdMatchingColCells = List<SudokuCell>.empty(growable: true);
    int candidateToRemove = 0;
    // loop over all candidates
    for (var i = 1; i < 10; i++) {
      // check rows
      firstMatchingRowCells.clear();
      secondMatchingRowCells.clear();
      thirdMatchingRowCells.clear();
      List<List<SudokuCell>> threeCandidateRows = List.empty(growable: true);
      for (var j = 0; j < 9; j++) {
        var rowCells = sudoku.getRowCells(j);
        var cellsWithCandidate = rowCells.where((cell) => cell.value == 0 && cell.candidates.contains(i));
        if (cellsWithCandidate.length == 3) {
          var lst = List<SudokuCell>.empty(growable: true);
          lst.addAll(cellsWithCandidate);
          threeCandidateRows.add(lst);
        }
      }
      for (var row in threeCandidateRows) {
        for (var row2 in threeCandidateRows) {
          for (var row3 in threeCandidateRows) {
            if ({row.first.row, row2.first.row, row3.first.row}.length != 3) {
              continue;
            }
            var r1columns = row.map((e) => e.col).toList();
            r1columns.sort();
            var r2columns = row2.map((e) => e.col).toList();
            r2columns.sort();
            var r3columns = row3.map((e) => e.col).toList();
            r3columns.sort();
            if (listEquals(r1columns, r2columns) && listEquals(r1columns, r3columns)) {
              firstMatchingRowCells.addAll(row);
              secondMatchingRowCells.addAll(row2);
              thirdMatchingRowCells.addAll(row3);
              matchFound = true;
              candidateToRemove = i;
              break;
            }
          }
          if (matchFound) break;
        }
        if (matchFound) break;
      }
      if (matchFound) {
        var cellsToRemoveCandidate = List<SudokuCell>.empty(growable: true);
        var applicableCells = List<SudokuCell>.empty(growable: true);
        // row case - remove candidates in columns
        var rows = [ firstMatchingRowCells.first.row, secondMatchingRowCells.first.row, thirdMatchingRowCells.first.row ];
        cellsToRemoveCandidate.addAll(
          sudoku.getColumnCells(firstMatchingRowCells.first.col)
                .where((cell) => !rows.contains(cell.row) && cell.candidates.contains(candidateToRemove)));
        cellsToRemoveCandidate.addAll(
          sudoku.getColumnCells(firstMatchingRowCells.skip(1).first.col)
                .where((cell) => !rows.contains(cell.row) && cell.candidates.contains(candidateToRemove)));
        cellsToRemoveCandidate.addAll(
          sudoku.getColumnCells(firstMatchingRowCells.skip(2).first.col)
                .where((cell) => !rows.contains(cell.row) && cell.candidates.contains(candidateToRemove)));
        applicableCells.addAll(firstMatchingRowCells);
        applicableCells.addAll(secondMatchingRowCells);
        applicableCells.addAll(thirdMatchingRowCells);
        if (cellsToRemoveCandidate.isEmpty) {
          matchFound = false;
        } else {
          if (applyResult) {
            for (var ctr in cellsToRemoveCandidate) {
              ctr.candidates.remove(candidateToRemove);
            }
          }
          var resultCells = cellsToRemoveCandidate.map((c) {
            var r = SudokuCell(c.row, c.col, true, c.value);
            r.candidates = [ candidateToRemove ];
            return r;
          }).toList();
          return TechniqueResult(applicableCells: applicableCells, removedCandidates: resultCells, usedTechnique: SwordfishTechnique);
        }
      }
      // check columns
      firstMatchingColCells.clear();
      secondMatchingColCells.clear();
      thirdMatchingColCells.clear();
      List<List<SudokuCell>> threeCandidateColumns = List.empty(growable: true);
      for (var j = 0; j < 9; j++) {
        var colCells = sudoku.getColumnCells(j);
        var cellsWithCandidate = colCells.where((cell) => cell.value == 0 && cell.candidates.contains(i));
        if (cellsWithCandidate.length == 3) {
          var lst = List<SudokuCell>.empty(growable: true);
          lst.addAll(cellsWithCandidate);
          threeCandidateColumns.add(lst);
        }
      }
      for (var col in threeCandidateColumns) {
        for (var col2 in threeCandidateColumns) {
          for (var col3 in threeCandidateColumns) {
            if ({col.first.col, col2.first.col, col3.first.col}.length != 3) {
              continue;
            }
            var c1rows = col.map((e) => e.row).toList();
            c1rows.sort();
            var c2rows = col2.map((e) => e.row).toList();
            c2rows.sort();
            var c3rows = col3.map((e) => e.row).toList();
            c3rows.sort();
            if (listEquals(c1rows, c2rows) && listEquals(c1rows, c3rows)) {
              firstMatchingRowCells.addAll(col);
              secondMatchingRowCells.addAll(col2);
              thirdMatchingRowCells.addAll(col3);
              matchFound = true;
              candidateToRemove = i;
              break;
            }
          }
          if (matchFound) break;
        }
        if (matchFound) break;
      }
      if (matchFound) {
        var cellsToRemoveCandidate = List<SudokuCell>.empty(growable: true);
        var applicableCells = List<SudokuCell>.empty(growable: true);
        // columns case - remove candidates in rows
        var columns = [ firstMatchingColCells.first.col, secondMatchingColCells.first.col, thirdMatchingColCells.first.col ];
        cellsToRemoveCandidate.addAll(
          sudoku.getRowCells(firstMatchingColCells.first.row)
                .where((cell) => !columns.contains(cell.col) && cell.candidates.contains(candidateToRemove)));
        cellsToRemoveCandidate.addAll(
          sudoku.getRowCells(firstMatchingColCells.skip(1).first.row)
                .where((cell) => !columns.contains(cell.col) && cell.candidates.contains(candidateToRemove)));
        cellsToRemoveCandidate.addAll(
          sudoku.getRowCells(firstMatchingColCells.skip(2).first.row)
                .where((cell) => !columns.contains(cell.col) && cell.candidates.contains(candidateToRemove)));
        applicableCells.addAll(firstMatchingColCells);
        applicableCells.addAll(secondMatchingColCells);
        applicableCells.addAll(thirdMatchingColCells);
        if (cellsToRemoveCandidate.isEmpty) {
          matchFound = false;
        } else {
          if (applyResult) {
            for (var ctr in cellsToRemoveCandidate) {
              ctr.candidates.remove(candidateToRemove);
            }
          }
          var resultCells = cellsToRemoveCandidate.map((c) {
            var r = SudokuCell(c.row, c.col, true, c.value);
            r.candidates = [ candidateToRemove ];
            return r;
          }).toList();
          return TechniqueResult(applicableCells: applicableCells, removedCandidates: resultCells, usedTechnique: SwordfishTechnique);
        }
      }
    }
		return null;
	}
}