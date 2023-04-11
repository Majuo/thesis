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