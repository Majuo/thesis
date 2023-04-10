import 'package:sudoku_app/game_internals/solver/technique_result.dart';
import 'package:sudoku_app/game_internals/solver/techniques_container.dart';
import 'package:sudoku_app/game_internals/solver/techniques_enum.dart';
import 'package:sudoku_app/game_internals/sudoku.dart';


void main(List<String> arguments){
	// for testing
	var sample = Sudoku.getSampleSudoku();
	print(sample);
	SudokuSolver.solveCellWithTechniques(sample, {SudokuTechniquesEnum.rules}, applyResult: true);
	print(sample);

}

class SudokuSolver {
	static TechniqueResult? solveCellWithTechniques(Sudoku game, Iterable<SudokuTechniquesEnum> techniques, {bool applyResult = false}) {
		for (var technique in TechniquesContainer.getTechniques(techniques)) {
			var result = technique.trySolve(game, applyResult: applyResult);
			if (result != null) return result;
		}
		return null;
	}

	static bool solveSudokuWithTechniques(Sudoku game, Iterable<SudokuTechniquesEnum> techniques) {
    game.fillAllNotes();
    while (!game.checkWin()) {
      if (!game.board.any((row) => row.any((cell) => cell.value == 0)) && !game.checkWin()) {
        return false;
      }
      TechniqueResult? techniqueResult;
      for (var technique in TechniquesContainer.getTechniques(techniques)) {
        techniqueResult = technique.trySolve(game, applyResult: true);
        if (techniqueResult != null) {
          print("technique - ${techniqueResult.usedTechnique}");
          // TODO: remove tmp code
          var error = false;
          for (var i = 0; i < 9; i++) {
            // check row number i
            var rowValues = game.getRowValues(i).toList();
            rowValues.removeWhere((e) => e == 0);
            if (rowValues.toSet().length != rowValues.length) error = true;
            // check column number i
            var columnValues = game.getColumnValues(i).toList();
            columnValues.removeWhere((e) => e == 0);
            if (columnValues.length != columnValues.toSet().length) error = true;
          }
          // check blocks
          for (var i = 0; i < 9; i += 3) {
            for (var j = 0; j < 9; j += 3) {
              var blockValues = game.getBlockValues(i, j).toList();
              blockValues.removeWhere((e) => e == 0);
              if (blockValues.length != blockValues.toSet().length) error = true;
            }
          }
          if (error) {
            print("error detected! technique ${techniqueResult.usedTechnique}. row: ${techniqueResult.applicableCells!.first.row}. col: ${techniqueResult.applicableCells!.first.col}.");
          }
          // TODO: tmp code
          break;
        }
      }
      if (techniqueResult == null) {
        return false;
      }
    }
		return true;
	}
}