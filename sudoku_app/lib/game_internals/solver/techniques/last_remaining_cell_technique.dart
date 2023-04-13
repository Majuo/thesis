import 'package:sudoku_app/game_internals/solver/techniques/i_sudoku_technique.dart';
import 'package:sudoku_app/game_internals/sudoku.dart';
import 'package:sudoku_app/game_internals/solver/technique_result.dart';
import 'package:sudoku_app/game_internals/sudoku_cell.dart';

class LastRemainingCellTechnique implements ISudokuTechnique {
	const LastRemainingCellTechnique();
	
	@override
	TechniqueResult? trySolve(Sudoku sudoku, {bool applyResult = false}) {
    Iterable<SudokuCell> unitCells = [];
    TechniqueResult? unitResult;
		for (var i = 0; i < 9; i++) {
			// check rows
			unitCells = sudoku.getRowCells(i);
      unitResult = checkUnitCells(unitCells, sudoku, applyResult);
      if (unitResult != null) return unitResult;
			// check columns
			unitCells = sudoku.getColumnCells(i);
      unitResult = checkUnitCells(unitCells, sudoku, applyResult);
      if (unitResult != null) return unitResult;
		}
		// check blocks
		for (var i = 0; i < 9; i += 3) {
			for (var j = 0; j < 9; j += 3) {
				unitCells = sudoku.getBlockCells(i, j);
        unitResult = checkUnitCells(unitCells, sudoku, applyResult);
        if (unitResult != null) return unitResult;
			}
		}
		return null;
	}

  TechniqueResult? checkUnitCells(Iterable<SudokuCell> unitCells, Sudoku sudoku, bool applyResult) {
    for (var num in Sudoku.numSet.difference(unitCells.map((c) => c.value).toSet()..remove(0))) {
      SudokuCell? fittingCell;
      bool success = true;
      for (var cell in unitCells.where((c) => c.value == 0)) {
        if (!sudoku.getPeerValues(cell.row, cell.col).contains(num)) {
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
          fittingCell.candidates.clear();
          var peerCells = sudoku.getPeerCells(fittingCell.row, fittingCell.col);
          for (var pc in peerCells) {
            pc.candidates.remove(num);
          }
        }
        return TechniqueResult(successful: true, applicableCells: [SudokuCell(fittingCell!.row, fittingCell.col, true, num)], usedTechnique: LastRemainingCellTechnique);
      }
    }
    return null;
  }
}