import 'package:sudoku_app/game_internals/solver/techniques/i_sudoku_technique.dart';
import 'package:sudoku_app/game_internals/solver/techniques_container.dart';
import 'package:sudoku_app/game_internals/solver/techniques_enum.dart';
import 'package:sudoku_app/game_internals/sudoku.dart';


void main(List<String> arguments){
	// for testing
	var sample = Sudoku.getSampleSudoku();
	print(sample);
	SudokuSolver.solveCellWithTechniques(sample, 8, 3, {SudokuTechniquesEnum.rules}, applyResult: true);
	print(sample);

}

class SudokuSolver {
	static ISudokuTechnique? solveCellWithTechniques(Sudoku board, int rowNo, int colNo, Iterable<SudokuTechniquesEnum> techniques, {bool applyResult = false}) {
		for (var technique in TechniquesContainer.getTechniques(techniques)) {
			if (technique.trySolve(board, rowNo, colNo, applyResult: applyResult)) return technique;
		}
		return null;
	}
}