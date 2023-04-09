import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sudoku_app/game_internals/generator/sudoku_difficulty_enum.dart';

class SudokuDifficultyNamePicker {
	static String getDifficultyName(BuildContext context, SudokuDifficultyEnum difficulty)
	{
    switch (difficulty) {
      case SudokuDifficultyEnum.easy:
        return AppLocalizations.of(context).easy;
      case SudokuDifficultyEnum.medium:
        return AppLocalizations.of(context).medium;
      case SudokuDifficultyEnum.hard:
        return AppLocalizations.of(context).hard;
      case SudokuDifficultyEnum.veryHard:
        return AppLocalizations.of(context).veryHard;
      default:
        return "Unknown difficulty";
    }
  }
}