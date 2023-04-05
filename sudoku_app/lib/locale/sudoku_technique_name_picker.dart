import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sudoku_app/game_internals/solver/techniques/i_sudoku_technique.dart';
import 'package:sudoku_app/game_internals/solver/techniques/last_possible_number_technique.dart';
import 'package:sudoku_app/game_internals/solver/techniques/last_remaining_cell_technique.dart';
import 'package:sudoku_app/game_internals/solver/techniques/sudoku_rules_technique.dart';

class SudokuTechniqueNamePicker {
	static String getTechniqueName(BuildContext context, Type technique)
	{
		switch (technique) {
		case SudokuRulesTechnique:
			return AppLocalizations.of(context).sudokuRules;
		case LastPossibleNumberTechnique:
			return AppLocalizations.of(context).lastPossibleNumber;
		case LastRemainingCellTechnique:
			return AppLocalizations.of(context).lastRemainingCell;
		default:
			return "Unknown technique";
		}
	}
}