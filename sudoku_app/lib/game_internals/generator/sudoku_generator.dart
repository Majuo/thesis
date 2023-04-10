import 'dart:math';

import 'package:sudoku_app/game_internals/generator/sudoku_difficulty_enum.dart';
import 'package:sudoku_app/game_internals/solver/sudoku_solver.dart';
import 'package:sudoku_app/game_internals/solver/techniques_enum.dart';
import 'package:sudoku_app/game_internals/sudoku.dart';

class SudokuGenerator {
  static Sudoku generateSudoku(SudokuDifficultyEnum difficulty) {
    int filledCells = 0;
    List<SudokuTechniquesEnum> usedTechniques = List.empty(growable: true);
    switch (difficulty) {
      case SudokuDifficultyEnum.easy:
        filledCells = 41;
        usedTechniques.addAll(SudokuTechniquesExtension.easyTechniques());
        break;
      case SudokuDifficultyEnum.medium:
        filledCells = 35;
        usedTechniques.addAll(SudokuTechniquesExtension.mediumTechniques());
        break;
      case SudokuDifficultyEnum.hard:
        filledCells = 29;
        usedTechniques.addAll(SudokuTechniquesExtension.hardTechniques());
        break;
      case SudokuDifficultyEnum.veryHard:
        filledCells = 23;
        usedTechniques.addAll(SudokuTechniquesEnum.values);
        break;
      default:
        throw Exception("unknown difficulty");  
    }
    var solution = getRandomSolution();
    var retries = 0;
    var needsRetry = true;
    List<List<int>> initState = [];
    do {
      retries += 1;
      initState = solution.map((r) => [...r]).toList();
      var removeIndices = List<int>.empty(growable: true);
      var removedCells = 0;
      var sameCount = 0;
      for (var i = 0; i < 81 ; i++) {
        removeIndices.add(i);
      }
      do {
        sameCount += 1;
        var index = Random().nextInt(removeIndices.length);
        var cellNo = removeIndices[index];
        var row = cellNo ~/ 9;
        var col = cellNo % 9;
        if (initState[row].where((c) => c == 0).length == 8) {
          // don't allow empty rows
          removeIndices.removeWhere((i) => i ~/ 9 == row);
          continue;
        }
        if (initState.map((r) => r[col]).where((c) => c == 0).length == 8) {
          // don't allow empty columns
          removeIndices.removeWhere((i) => i % 9 == col);
          continue;
        }
        initState[row][col] = 0;
        bool? res = SudokuSolver.solveSudokuWithTechniques(Sudoku.generateSudoku(initState, solution), usedTechniques);
        if (res == null) {
          return Sudoku.generateSudoku(initState, solution);
        }
        if (!res) {
          initState[row][col] = solution[row][col];
          continue;
        }
        removeIndices.removeAt(index);
        removedCells += 1;
        sameCount = 0;
      } while (!(removedCells == 81 - filledCells) && sameCount < 100);
      if (removedCells == 81 - filledCells) {
        needsRetry = false;
      }
    } while (retries < 10 && needsRetry);
    if (retries > 10) {
      throw Exception("Unable to generate new Sudoku with given parameters: difficulty: $difficulty");
    }
    return Sudoku.generateSudoku(initState, solution);
  }

  // solution generation is based on https://www.geeksforgeeks.org/program-sudoku-generator/
  static List<List<int>> getRandomSolution() {
    List<List<int>> result = List.empty(growable: true);
    for (var i = 0; i < 9; i++) {
      result.add(List.empty(growable: true));
      for (var j = 0; j < 9; j++) {
        result.elementAt(i).add(0);
      }
    }
    // fill first 3 diagonal blocks
    for (int i = 0; i < 9; i += 3) {
      int num;
      // fill each block
      for (int j=0; j < 3; j++)
      {
        for (int k=0; k < 3; k++)
        {
            do
            {
                num = Random().nextInt(9) + 1;
            }
            while (!unUsedInBox(result, i, i, num));

            result[i + j][i + k] = num;
        }
      }
    }
    fillRemaining(result, 0, 0);
    return result;
  }

  static bool unUsedInBox(List<List<int>> board, int rowStart, int colStart, int num) {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (board[rowStart+i][colStart+j] == num) return false;
      }
    }
    return true;
  }

  static bool checkIfSafe(List<List<int>> board, int row, int col, int num) {
    // check that number is not used in row / column / block
    return !board[row].contains(num) && board.every((r) => r[col] != num) && unUsedInBox(board, row - row % 3, col - col % 3, num);
  }

  static bool fillRemaining(List<List<int>> board, int row, int col) {
    if (col >= 9) {
      row += 1;
      col = 0;
    }
    // if-else to skip blocks that are already filled
    if (row < 3) {
      if (col < 3) {
        col = 3;
      }
    } else if (row < 6) {
      if (col == 3) {
        col = 6;
      }
    } else {
      if (col == 6) {
        row += 1;
        col = 0;
        if (row >= 9) {
          return true;
        }
      }
    }
    // fill the cells recursively
    for (var num = 1; num < 10; num++) {
      if (checkIfSafe(board, row, col, num)) {
        board[row][col] = num;
        if (fillRemaining(board, row, col + 1)) {
          return true;
        }
        board[row][col] = 0;
      }
    }
    return false;
  }
}