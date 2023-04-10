import 'dart:math';

import 'package:sudoku_app/game_internals/generator/sudoku_difficulty_enum.dart';
import 'package:sudoku_app/game_internals/solver/techniques_enum.dart';
import 'package:sudoku_app/game_internals/sudoku.dart';

class SudokuGenerator {
  static Sudoku generateSudoku(SudokuDifficultyEnum difficulty) {
    int filledCells = 0;
    List<SudokuTechniquesEnum> usedTechniques = List.empty(growable: true);
    switch (difficulty) {
      case SudokuDifficultyEnum.easy:
        filledCells = 41;
        usedTechniques.addAll({
          SudokuTechniquesEnum.rules,
          SudokuTechniquesEnum.lastPossibleNumber,
          SudokuTechniquesEnum.lastRemainingCell
        });
        break;
      case SudokuDifficultyEnum.medium:
        filledCells = 34;
        usedTechniques.addAll({
          SudokuTechniquesEnum.rules,
          SudokuTechniquesEnum.lastPossibleNumber,
          SudokuTechniquesEnum.lastRemainingCell,
          SudokuTechniquesEnum.nakedSingle,
          SudokuTechniquesEnum.nakedPair,
          SudokuTechniquesEnum.hiddenSingle,
          SudokuTechniquesEnum.hiddenPair,
        });
        break;
      case SudokuDifficultyEnum.hard:
        filledCells = 27;
        usedTechniques.addAll({
          SudokuTechniquesEnum.rules,
          SudokuTechniquesEnum.lastPossibleNumber,
          SudokuTechniquesEnum.lastRemainingCell,
          SudokuTechniquesEnum.nakedSingle,
          SudokuTechniquesEnum.nakedPair,
          SudokuTechniquesEnum.hiddenSingle,
          SudokuTechniquesEnum.hiddenPair,
          SudokuTechniquesEnum.nakedTriple,
          SudokuTechniquesEnum.hiddenTriple,
          SudokuTechniquesEnum.pointingPair,
          SudokuTechniquesEnum.pointingTriple
        });
        break;
      case SudokuDifficultyEnum.veryHard:
        filledCells = 20;
        usedTechniques.addAll(SudokuTechniquesEnum.values);
        break;
      default:
        throw Exception("unknown difficulty");  
    }
    var solution = getRandomSolution();
    var initState = solution.map((r) => [...r]).toList();
    for (var i = 0; i < (81 - filledCells); i++) {
      var row = Random().nextInt(9);
      var cell = Random().nextInt(9);
      initState.elementAt(row).replaceRange(cell, cell + 1, {0});
    }
    solution[0][0] = 69;
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