import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sudoku_app/game_internals/i_have_sudoku_board.dart';
import 'package:sudoku_app/game_internals/sudoku_cell.dart';

class SudokuProblem implements IHaveSudokuBoard {
  @override
  List<List<SudokuCell>> board = List.empty(growable: true);
  List<List<SudokuCell>> initState = List.empty(growable: true);
  List<List<SudokuCell>> solution = List.empty(growable: true);
  Map<SudokuCell, Color> initColoredCells = {};
  int cellsNeedToBeChanged = 0;
  int incorrectlyChangedCells = 0;

  static SudokuProblem getSudokuProblem(List<List<List<int>>> initState, List<List<List<int>>> solution) {
		var result = SudokuProblem();
		for (var i = 0; i < 9; i++) {
			var solutionRow = List<SudokuCell>.empty(growable: true);
			var initStateRow = List<SudokuCell>.empty(growable: true);
			var boardRow = List<SudokuCell>.empty(growable: true);
			for (var j = 0; j < 9; j++) {
				var cellValue = initState.elementAt(i).elementAt(j).first;
				var editable = cellValue == 0;
        var initStateCell = SudokuCell(i, j, editable, editable ? 0 : cellValue);
        initStateCell.candidates = initState.elementAt(i).elementAt(j).skip(1).toList();
        var solutionCell = SudokuCell(i, j, false, solution.elementAt(i).elementAt(j).first);
        solutionCell.candidates = solution.elementAt(i).elementAt(j).skip(1).toList();
        var boardCell = SudokuCell(i, j, editable, editable ? 0 : cellValue);
        boardCell.candidates = [...initStateCell.candidates];
				solutionRow.add(solutionCell);
				initStateRow.add(initStateCell);
				boardRow.add(boardCell);
			}
			result.solution.add(solutionRow);
			result.initState.add(initStateRow);
			result.board.add(boardRow);
		}
		return result;
	}

  bool checkProblemSolved() {
    var incorrectCount = 0;
    var changesLeft = 0;
    for (var i = 0; i < 9; i++) {
      for (var j = 0; j < 9; j++) {
        var initStateCell = initState.elementAt(i).elementAt(j);
        var boardCell = board.elementAt(i).elementAt(j);
        var solutionCell = solution.elementAt(i).elementAt(j);
        if (initStateCell.value != boardCell.value || !listEquals(initStateCell.candidates, boardCell.candidates)) {
          if (solutionCell.value != boardCell.value || !listEquals(solutionCell.candidates, boardCell.candidates)) {
            incorrectCount += 1;
          }
        } else {
          if (solutionCell.value != boardCell.value || !listEquals(solutionCell.candidates, boardCell.candidates)) {
            changesLeft += 1;
          }
        }
      }
    }
    cellsNeedToBeChanged = changesLeft;
    incorrectlyChangedCells = incorrectCount;
    return incorrectCount == 0 && changesLeft == 0;
  }
}