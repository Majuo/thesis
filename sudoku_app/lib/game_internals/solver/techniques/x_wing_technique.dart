import 'package:sudoku_app/game_internals/solver/techniques/i_sudoku_technique.dart';
import 'package:sudoku_app/game_internals/sudoku.dart';
import 'package:sudoku_app/game_internals/solver/technique_result.dart';

import '../../sudoku_cell.dart';

class XWingTechnique implements ISudokuTechnique {
	const XWingTechnique();

	@override
	TechniqueResult? trySolve(Sudoku sudoku, {bool applyResult = false}) {
    var matchFound = false;
    var firstMatchingRowCells = List<SudokuCell>.empty(growable: true);
    var secondMatchingRowCells = List<SudokuCell>.empty(growable: true);
    var firstMatchingColCells = List<SudokuCell>.empty(growable: true);
    var secondMatchingColCells = List<SudokuCell>.empty(growable: true);
    int candidateToRemove = 0;
    // loop over all candidates
    for (var i = 1; i < 10; i++) {
      // check rows
      firstMatchingRowCells.clear();
      secondMatchingRowCells.clear();
      List<List<SudokuCell>> twoCandidateRows = List.empty(growable: true);
      for (var j = 0; j < 9; j++) {
        var rowCells = sudoku.getRowCells(j);
        var cellsWithCandidate = rowCells.where((cell) => cell.value == 0 && cell.candidates.contains(i));
        if (cellsWithCandidate.length == 2) {
          var lst = List<SudokuCell>.empty(growable: true);
          lst.addAll(cellsWithCandidate);
          twoCandidateRows.add(lst);
        }
      }
      for (var row in twoCandidateRows) {
        for (var row2 in twoCandidateRows) {
          if (row2.first.row == row.first.row) {
            continue;
          }
          if (row.first.col == row2.first.col && row.skip(1).first.col == row2.skip(1).first.col) {
            firstMatchingRowCells.addAll(row);
            secondMatchingRowCells.addAll(row2);
            break;
          }
        }
        if (firstMatchingRowCells.length == 2 && secondMatchingRowCells.length == 2) {
          matchFound = true;
          candidateToRemove = i;
          break;
        }
      }
      if (matchFound) {
        var cellsToRemoveCandidate = List<SudokuCell>.empty(growable: true);
        var applicableCells = List<SudokuCell>.empty(growable: true);
        // row case - remove candidates in columns
        var rows = [ firstMatchingRowCells.first.row, secondMatchingRowCells.first.row ];
        cellsToRemoveCandidate.addAll(
          sudoku.getColumnCells(firstMatchingRowCells.first.col)
                .where((cell) => !rows.contains(cell.row) && cell.candidates.contains(candidateToRemove)));
        cellsToRemoveCandidate.addAll(
          sudoku.getColumnCells(firstMatchingRowCells.skip(1).first.col)
                .where((cell) => !rows.contains(cell.row) && cell.candidates.contains(candidateToRemove)));
        applicableCells.addAll(firstMatchingRowCells);
        applicableCells.addAll(secondMatchingRowCells);
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
          return TechniqueResult(applicableCells: applicableCells, removedCandidates: resultCells, usedTechnique: XWingTechnique);
        }
      }
      // check columns
      firstMatchingColCells.clear();
      secondMatchingColCells.clear();
      List<List<SudokuCell>> twoCandidateColumns = List.empty(growable: true);
      for (var j = 0; j < 9; j++) {
        var colCells = sudoku.getColumnCells(j);
        var cellsWithCandidate = colCells.where((cell) => cell.value == 0 && cell.candidates.contains(i));
        if (cellsWithCandidate.length == 2) {
          var lst = List<SudokuCell>.empty(growable: true);
          lst.addAll(cellsWithCandidate);
          twoCandidateColumns.add(lst);
        }
      }
      for (var col in twoCandidateColumns) {
        for (var col2 in twoCandidateColumns) {
          if (col2.first.col == col.first.col) {
            continue;
          }
          if (col.first.row == col2.first.row && col.skip(1).first.row == col2.skip(1).first.row) {
            firstMatchingColCells.addAll(col);
            secondMatchingColCells.addAll(col2);
            break;
          }
        }
        if (firstMatchingColCells.length == 2 && secondMatchingColCells.length == 2) {
          matchFound = true;
          candidateToRemove = i;
          break;
        }
      }
      if (matchFound) {
        var cellsToRemoveCandidate = List<SudokuCell>.empty(growable: true);
        var applicableCells = List<SudokuCell>.empty(growable: true);
        // columns case - remove candidates in rows
        var columns = [ firstMatchingColCells.first.col, secondMatchingColCells.first.col ];
        cellsToRemoveCandidate.addAll(
          sudoku.getRowCells(firstMatchingColCells.first.row)
                .where((cell) => !columns.contains(cell.col) && cell.candidates.contains(candidateToRemove)));
        cellsToRemoveCandidate.addAll(
          sudoku.getRowCells(firstMatchingColCells.skip(1).first.row)
                .where((cell) => !columns.contains(cell.col) && cell.candidates.contains(candidateToRemove)));
        applicableCells.addAll(firstMatchingColCells);
        applicableCells.addAll(secondMatchingColCells);
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
          return TechniqueResult(applicableCells: applicableCells, removedCandidates: resultCells, usedTechnique: XWingTechnique);
        }
      }
    }
		return null;
	}
}