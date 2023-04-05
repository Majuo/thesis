import 'package:sudoku_app/game_internals/sudoku_cell.dart';
import 'dart:math' as math;

class Sudoku {
	List<List<SudokuCell>> board = List.empty(growable: true);
	List<List<int>> solution = List.empty(growable: true);
	List<List<int>> initState = List.empty(growable: true);
	SudokuCell? currentCell;

  bool checkWin() {
    if (board.any((row) => row.any((cell) => cell.value == 0))) return false;
    // TODO: add check for errors
    if (solution.isNotEmpty) {
      for (var row in board) {
        for (var cell in row) {
          if (cell.value != solution.elementAt(cell.row).elementAt(cell.col)) return false;
        }
      }
      return true;
    } else {
      for (var i = 0; i < 9; i++) {
        // check row number i
        var rowValues = getRowValues(i);
        if (rowValues.toSet().length != rowValues.length) return false;
        // check column number i
        var columnValues = getColumnValues(i);
        if (columnValues.length != columnValues.toSet().length) return false;
      }
      // check blocks
      for (var i = 0; i < 9; i += 3) {
        for (var j = 0; j < 9; j += 3) {
          var blockValues = getBlockValues(i, j);
          if (blockValues.length != blockValues.toSet().length) return false;
        }
      }
      return true;
    }
  }

  Iterable<int> getRowValues(int rowNo) {
    return getRowCells(rowNo).map((cell) => cell.value);
  }

  Iterable<SudokuCell> getRowCells(int rowNo) {
    return board.elementAt(rowNo);
  }

  Iterable<int> getColumnValues(int columnNo) {
    return getColumnCells(columnNo).map((cell) => cell.value);
  }

  Iterable<SudokuCell> getColumnCells(int columnNo) {
    return board.map((row) => row.elementAt(columnNo));
  }

  Iterable<int> getBlockValuesByCell(SudokuCell cell) {
    return getBlockValues(cell.row, cell.col);
  }

  Iterable<int> getBlockValues(int rowNo, int columnNo) {
    return getBlockCells(rowNo, columnNo).map((cell) => cell.value);
  }

  Iterable<SudokuCell> getBlockCells(int rowNo, int columnNo) {
    var result = List<SudokuCell>.empty(growable: true);
    var blockStartY = rowNo - rowNo % 3;
    var blockStartX = columnNo - columnNo % 3;
    for (var i = 0; i < 3; i++) {
      for (var j = 0; j < 3; j++) {
        result.add(board.elementAt(blockStartY + i).elementAt(blockStartX + j));
      }
    }
    return result;
  }

  static Sudoku getSampleSudoku() {
    List<List<int>> initState = [
      [7, 0, 8, 0, 0, 0, 4, 0, 2],
      [3, 0, 0, 0, 8, 0, 0, 0, 9],
      [0, 0, 2, 4, 0, 3, 1, 0, 0],
      //---------------------------
      [0, 1, 0, 6, 0, 2, 0, 4, 0],
      [0, 0, 0, 0, 5, 0, 0, 0, 0],
      [0, 5, 0, 1, 0, 9, 0, 7, 0],
      //---------------------------
      [0, 0, 3, 5, 0, 6, 7, 0, 0],
      [1, 0, 0, 0, 7, 0, 0, 0, 6],
      [6, 0, 4, 0, 0, 0, 2, 0, 8],
    ];
    List<List<int>> initStateEz = [
      [7, 6, 8, 9, 1, 5, 4, 3, 2],
      [3, 4, 1, 2, 8, 7, 5, 6, 9],
      [5, 9, 2, 4, 6, 3, 1, 8, 7],
      //---------------------------
      [8, 1, 7, 6, 3, 2, 9, 4, 5],
      [4, 3, 9, 7, 5, 8, 6, 2, 1],
      [2, 5, 6, 1, 4, 9, 8, 7, 3],
      //---------------------------
      [9, 8, 3, 5, 2, 6, 7, 1, 4],
      [1, 2, 5, 8, 7, 4, 3, 9, 6],
      [6, 7, 4, 0, 0, 1, 2, 5, 8],
    ];
    List<List<int>> solution = [
      [7, 6, 8, 9, 1, 5, 4, 3, 2],
      [3, 4, 1, 2, 8, 7, 5, 6, 9],
      [5, 9, 2, 4, 6, 3, 1, 8, 7],
      //---------------------------
      [8, 1, 7, 6, 3, 2, 9, 4, 5],
      [4, 3, 9, 7, 5, 8, 6, 2, 1],
      [2, 5, 6, 1, 4, 9, 8, 7, 3],
      //---------------------------
      [9, 8, 3, 5, 2, 6, 7, 1, 4],
      [1, 2, 5, 8, 7, 4, 3, 9, 6],
      [6, 7, 4, 3, 9, 1, 2, 5, 8],
    ];
    return generateSudoku(initStateEz, solution);
  }

	static Sudoku generateSudoku(List<List<int>>? srcInitState, List<List<int>>? srcSolution) {
    var isRandom = srcInitState == null || srcSolution == null;
		var result = Sudoku();
		for (var i = 0; i < 9; i++) {
			var solutionRow = List<int>.empty(growable: true);
			var initStateRow = List<int>.empty(growable: true);
			var boardRow = List<SudokuCell>.empty(growable: true);
			for (var j = 0; j < 9; j++) {
				var cellValue = isRandom ? math.Random().nextInt(10) : srcInitState.elementAt(i).elementAt(j);
				var editable = isRandom ? math.Random().nextBool() : cellValue == 0;
        if (isRandom && cellValue == 0 && !editable)
        {
          do {
            cellValue = math.Random().nextInt(10);
          } while (cellValue == 0);
        }
				solutionRow.add(isRandom ? cellValue : srcSolution.elementAt(i).elementAt(j));
				initStateRow.add(editable ? 0 : cellValue);
        var sudokuCell = SudokuCell(i, j, editable, editable ? 0 : cellValue);
        if (isRandom && editable && math.Random().nextBool())
        {
          for (var i = 0; i < 5; i++) {
            var candidate = math.Random().nextInt(9) + 1;
            if (!sudokuCell.candidates.contains(candidate))
            {
              sudokuCell.candidates.add(candidate);
            }
          }
        }
				boardRow.add(sudokuCell);
			}
			result.solution.add(solutionRow);
			result.initState.add(initStateRow);
			result.board.add(boardRow);
		}
		return result;
	}

  @override String toString() {
    var result = "";
    for (var row in board) {
      result += "\n";
      for (var cell in row) {
        if (cell.col == 0 && (cell.row == 3 || cell.row == 6)) {
          result += "---------------\n";
        }
        if ({3, 6}.contains(cell.col)) {
          result += " | ";
        }
        result += cell.value.toString();
      }
    }
    return result;
  }
}