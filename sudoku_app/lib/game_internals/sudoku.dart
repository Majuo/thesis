import 'package:sudoku_app/game_internals/sudoku_cell.dart';
import 'dart:math' as math;

class Sudoku {
	List<List<SudokuCell>> board = List.empty(growable: true);
	List<List<int>> solution = List.empty(growable: true);
	List<List<int>> initState = List.empty(growable: true);
	SudokuCell? currentCell;

	static Sudoku getSampleSudoku()
	{
		var result = Sudoku();
		for (var i = 0; i < 9; i++) {
			var solutionRow = List<int>.empty(growable: true);
			var initStateRow = List<int>.empty(growable: true);
			var boardRow = List<SudokuCell>.empty(growable: true);
			for (var j = 0; j < 9; j++) {
				var cellValue = math.Random().nextInt(10);
				var editable = math.Random().nextBool();
        if (cellValue == 0 && !editable)
        {
          do {
            cellValue = math.Random().nextInt(10);
          } while (cellValue == 0);
        }
				solutionRow.add(cellValue);
				initStateRow.add(editable ? 0 : cellValue);
				boardRow.add(SudokuCell(i, j, editable, editable ? 0 : cellValue));
			}
			result.solution.add(solutionRow);
			result.initState.add(initStateRow);
			result.board.add(boardRow);
		}
		return result;
	}
}