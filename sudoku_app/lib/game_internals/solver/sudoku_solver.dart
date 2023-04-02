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
	static bool solveCellWithTechniques(Sudoku board, int rowNo, int colNo, Iterable<SudokuTechniquesEnum> techniques, {bool applyResult = false}) {
		for (var techinque in TechniquesContainer.getTechniques(techniques)) {
			if (techinque.trySolve(board, rowNo, colNo, applyResult: applyResult)) return true;
		}
		return false;
	}
}