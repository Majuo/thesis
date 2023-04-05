import 'package:sudoku_app/game_internals/sudoku_cell.dart';

class TechniqueResult {
	TechniqueResult({required this.successful, this.solvedCell, this.removedCandidates, this.usedTechnique});
	bool successful = false;
	SudokuCell? solvedCell;
	List<SudokuCell>? removedCandidates;
	Type? usedTechnique;
}