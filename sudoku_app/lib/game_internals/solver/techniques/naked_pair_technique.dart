import 'package:flutter/foundation.dart';
import 'package:sudoku_app/game_internals/solver/techniques/i_sudoku_technique.dart';
import 'package:sudoku_app/game_internals/sudoku.dart';
import 'package:sudoku_app/game_internals/solver/technique_result.dart';
import 'package:sudoku_app/game_internals/sudoku_cell.dart';

class NakedPairTechnique implements ISudokuTechnique {
	const NakedPairTechnique();

	@override
	TechniqueResult? trySolve(Sudoku sudoku, {bool applyResult = false}) {
    for (var row in sudoku.board) {
      for (var cell in row) {
        if (cell.value != 0 || cell.candidates.length != 2) continue;
        var peerCells = sudoku.getPeerCells(cell.row, cell.col);
        SudokuCell? secondCell;
        for (var pc in peerCells) {
          if (listEquals(cell.candidates, pc.candidates)) {
            secondCell = pc;
            break;
          }
        }
        if (secondCell == null) continue;
        List<SudokuCell> cellsToRemoveCandidates = List.empty(growable: true);
        bool oneRow = Sudoku.areCellsInOneRow({cell, secondCell});
        bool oneCol = Sudoku.areCellsInOneColumn({cell, secondCell});
        if (oneRow) {
          var rowCells = sudoku.getRowCells(cell.row).where((c) => c.editable && !{cell.col, secondCell!.col}.contains(c.col)).toList();
          cellsToRemoveCandidates.addAll(rowCells);
        }
        if (oneCol) {
          var colCells = sudoku.getColumnCells(cell.col).where((c) => c.editable && !{cell.row, secondCell!.row}.contains(c.row)).toList();
          cellsToRemoveCandidates.addAll(colCells);
        }
        if (Sudoku.areCellsInOneBlock({cell, secondCell})) {
          var blockCells = sudoku.getBlockCells(cell.row, cell.col).where((c) => c.editable).toList();
          if (oneRow) {
            blockCells.removeWhere((bc) => bc.row == cell.row);
          } else if (oneCol) {
            blockCells.removeWhere((bc) => bc.col == cell.col);
          } else {
            blockCells.remove(cell);
            blockCells.remove(secondCell);
          }
          cellsToRemoveCandidates.addAll(blockCells);
        }
        if (!cellsToRemoveCandidates.any((ctr) => ctr.candidates.contains(cell.candidates.first) || ctr.candidates.contains(cell.candidates.elementAt(1)))) {
          continue; // as there will be no effect
        }
        if (applyResult) {
          for (var ctr in cellsToRemoveCandidates) {
            for (var candidate in cell.candidates) {
              ctr.candidates.remove(candidate);
            }
          }
        }
        var resultCells = cellsToRemoveCandidates.map((c) {
          var r = SudokuCell(c.row, c.col, true, 0);
          r.candidates = cell.candidates.map((cc) => cc).toList();
          return r;
        }).toList();
        return TechniqueResult(successful: true, applicableCells: List.from({cell, secondCell}), removedCandidates: resultCells, usedTechnique: NakedPairTechnique);
      }
    }
		return null;
	}
}