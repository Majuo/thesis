import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/services.dart' show rootBundle;

import 'package:sudoku_app/game_internals/generator/sudoku_difficulty_enum.dart';
import 'package:sudoku_app/game_internals/generator/sudoku_template.dart';
import 'package:sudoku_app/game_internals/solver/sudoku_solver.dart';
import 'package:sudoku_app/game_internals/solver/techniques_enum.dart';
import 'package:sudoku_app/game_internals/sudoku.dart';

void main(List<String> arguments) {
  // for adding new templates
  SudokuGenerator.generateSudokuTemplate(SudokuDifficultyEnum.easy);
}

class SudokuGenerator {


  static Map<int, String> intToStrMap = {
    1 : "a",
    2 : "b",
    3 : "c",
    4 : "d",
    5 : "e",
    6 : "f",
    7 : "g",
    8 : "h",
    9 : "i",
    0 : "-",
  };

  static Map<SudokuDifficultyEnum, String> fileNamePartMap = {
    SudokuDifficultyEnum.easy : "easy",
    SudokuDifficultyEnum.medium : "medium",
    SudokuDifficultyEnum.hard : "hard",
    SudokuDifficultyEnum.veryHard : "very_hard"
  };

  static String templateDirectoryPath = "lib\\game_internals\\generator\\generated_templates\\";
  static String templateDirectoryAssetPath = "lib/game_internals/generator/generated_templates/";

  static Future<Sudoku> generateSudoku(SudokuDifficultyEnum difficulty) async {
    String fileNamePart = fileNamePartMap[difficulty] ?? "easy";
    var jsonString = await rootBundle.loadString("$templateDirectoryAssetPath$fileNamePart.json");
    List<dynamic> templatesJson = jsonDecode(jsonString);
    var template = SudokuTemplate.fromJson(templatesJson[Random().nextInt(templatesJson.length)]);
    return permutate(template);
  }

  static Sudoku permutate(SudokuTemplate template) {
    List<List<int>> initStateResult = List.empty(growable: true);
    List<List<int>> solutionResult = List.empty(growable: true);

    var mirrorHorizontally = Random().nextBool();
    var mirrorVertically = Random().nextBool();
    var rotateTimes = Random().nextInt(4);

    // permutation 1 - mirror
    if (mirrorVertically) {
      template.initState = template.initState.reversed.toList();
      template.solution = template.solution.reversed.toList();
    }
    if (mirrorHorizontally) {
      for (var i = 0; i < 9; i++) {
        template.initState[i] = template.initState[i].reversed.toList();
        template.solution[i] = template.solution[i].reversed.toList();
      }
    }
    // permutation 2 - rotate
    var initStateTemp = template.initState.map((r) => [...r]).toList();
    var solutionTemp = template.solution.map((r) => [...r]).toList();
    for (var i = 0; i < rotateTimes; i++) {
      // swap 90 degrees clockwise x rotateTimes
      for (int i = 0; i < 9 / 2; i++) {
        for (int j = i; j < 9 - i - 1; j++) {
          String temp = initStateTemp[i][j];
          initStateTemp[i][j] = initStateTemp[9 - 1 - j][i];
          initStateTemp[9 - 1 - j][i] = initStateTemp[9 - 1 - i][9 - 1 - j];
          initStateTemp[9 - 1 - i][9 - 1 - j] = initStateTemp[j][9 - 1 - i];
          initStateTemp[j][9 - 1 - i] = temp;

          temp = solutionTemp[i][j];
          solutionTemp[i][j] = solutionTemp[9 - 1 - j][i];
          solutionTemp[9 - 1 - j][i] = solutionTemp[9 - 1 - i][9 - 1 - j];
          solutionTemp[9 - 1 - i][9 - 1 - j] = solutionTemp[j][9 - 1 - i];
          solutionTemp[j][9 - 1 - i] = temp;
        }
      }
      template.initState = initStateTemp.map((r) => [...r]).toList();
      template.solution = solutionTemp.map((r) => [...r]).toList();
    }

    // permutation 3 - replace chars with numbers
    Map<String, int> strToIntMap = {};
    List<String> strings = ["a", "b", "c", "d", "e", "f", "g", "h", "i"];
    List<int> nums = [1, 2, 3, 4, 5, 6, 7, 8, 9]..shuffle();
    for (var i = 0; i < 9; i++) {
      strToIntMap[strings[i]] = nums[i];
    }
    strToIntMap["-"] = 0;
    for (var i = 0; i < 9; i++) {
      initStateResult.add(List.empty(growable: true));
      solutionResult.add(List.empty(growable: true));
      for (var j = 0; j < 9; j++) {
        initStateResult.elementAt(i).add(0);
        solutionResult.elementAt(i).add(0);
      }
    }
    for (var i = 0; i < 9; i++) {
      for (var j = 0; j < 9; j++) {
        initStateResult[i][j] = strToIntMap[template.initState[i][j]] ?? 0;
        solutionResult[i][j] = strToIntMap[template.solution[i][j]] ?? 0;
      }
    }
    return Sudoku.generateSudoku(initStateResult, solutionResult);
  }

  static void generateSudokuTemplate(SudokuDifficultyEnum difficulty) {
    int filledCells = 0;
    List<SudokuTechniquesEnum> usedTechniques = List.empty(growable: true);
    String fileNamePart = fileNamePartMap[difficulty] ?? "easy";
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
        if (!SudokuSolver.solveSudokuWithTechniques(Sudoku.generateSudoku(initState, solution), usedTechniques)) {
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

    SudokuTemplate newTemplate = SudokuTemplate();
    newTemplate.initState = initState.map((r) => r.map((c) => intToStrMap[c]!).toList()).toList();
    newTemplate.solution = solution.map((r) => r.map((c) => intToStrMap[c]!).toList()).toList();

    var file = File("$templateDirectoryPath$fileNamePart.json");
    List<dynamic> templates = jsonDecode(file.readAsStringSync());
    templates.add(newTemplate.toJson());
    var encoder = const JsonEncoder.withIndent("  ");
    file.writeAsStringSync(encoder.convert(templates));
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