import 'package:sudoku_app/game_internals/solver/techniques/i_sudoku_technique.dart';
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
	static ISudokuTechnique? solveCellWithTechniques(Sudoku board, Iterable<SudokuTechniquesEnum> techniques, {bool applyResult = false}) {
		for (var technique in TechniquesContainer.getTechniques(techniques)) {
			if (technique.trySolve(board, applyResult: applyResult) != null) return technique;
		}
		return null;
	}
}