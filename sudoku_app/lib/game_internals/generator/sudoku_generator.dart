import 'dart:math';

import 'package:sudoku_app/game_internals/generator/sudoku_difficulty_enum.dart';
import 'package:sudoku_app/game_internals/solver/techniques_enum.dart';
import 'package:sudoku_app/game_internals/sudoku.dart';

class SudokuGenerator {
  static Sudoku generateSudoku(SudokuDifficultyEnum difficulty) {
    // use only these techniques in solver?
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
    var tmp = {
      {1, 8, 2, 7, 4, 5, 3, 6, 9}.toList(),
      {3, 6, 4, 9, 2, 1, 8, 5, 7}.toList(),
      {5, 9, 7, 8, 3, 6, 1, 2, 4}.toList(),
      {4, 5, 8, 1, 6, 2, 7, 9, 3}.toList(),
      {6, 3, 9, 4, 7, 8, 5, 1, 2}.toList(),
      {7, 2, 1, 5, 9, 3, 6, 4, 8}.toList(),
      {8, 7, 6, 2, 5, 4, 9, 3, 1}.toList(),
      {2, 1, 3, 6, 8, 9, 4, 7, 5}.toList(),
      {9, 4, 5, 3, 1, 7, 2, 8, 6}.toList(),
    };
    var tmp1 = {
      {1, 8, 2, 7, 4, 5, 3, 6, 9}.toList(),
      {3, 6, 4, 9, 2, 1, 8, 5, 7}.toList(),
      {5, 9, 7, 8, 3, 6, 1, 2, 4}.toList(),
      {4, 5, 8, 1, 6, 2, 7, 9, 3}.toList(),
      {6, 3, 9, 4, 7, 8, 5, 1, 2}.toList(),
      {7, 2, 1, 5, 9, 3, 6, 4, 8}.toList(),
      {8, 7, 6, 2, 5, 4, 9, 3, 1}.toList(),
      {2, 1, 3, 6, 8, 9, 4, 7, 5}.toList(),
      {9, 4, 5, 3, 1, 7, 2, 8, 6}.toList(),
    }.toList();
    for (var i = 0; i < (81 - filledCells); i++) {
      var row = Random().nextInt(9);
      var cell = Random().nextInt(9);
      tmp1.elementAt(row).replaceRange(cell, cell + 1, {0});
    }
    return Sudoku.generateSudoku(tmp1, tmp.toList());
  }
}