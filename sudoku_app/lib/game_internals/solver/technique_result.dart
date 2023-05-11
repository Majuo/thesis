import 'package:sudoku_app/game_internals/sudoku_cell.dart';

class TechniqueResult {
	TechniqueResult({this.applicableCells, this.removedCandidates, this.usedTechnique});
	List<SudokuCell>? applicableCells;
	List<SudokuCell>? removedCandidates;
	Type? usedTechnique;
}