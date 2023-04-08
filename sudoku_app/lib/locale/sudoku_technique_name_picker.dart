import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sudoku_app/game_internals/solver/techniques/hidden_pair_technique.dart';
import 'package:sudoku_app/game_internals/solver/techniques/hidden_single_technique.dart';
import 'package:sudoku_app/game_internals/solver/techniques/hidden_triple_technique.dart';
import 'package:sudoku_app/game_internals/solver/techniques/last_possible_number_technique.dart';
import 'package:sudoku_app/game_internals/solver/techniques/last_remaining_cell_technique.dart';
import 'package:sudoku_app/game_internals/solver/techniques/naked_pair_technique.dart';
import 'package:sudoku_app/game_internals/solver/techniques/naked_single_technique.dart';
import 'package:sudoku_app/game_internals/solver/techniques/naked_triple_technique.dart';
import 'package:sudoku_app/game_internals/solver/techniques/pointing_pair_technique.dart';
import 'package:sudoku_app/game_internals/solver/techniques/pointing_triple_technique.dart';
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
		case NakedSingleTechnique:
			return AppLocalizations.of(context).nakedSingle;
		case NakedPairTechnique:
			return AppLocalizations.of(context).nakedPair;
		case NakedTripleTechnique:
			return AppLocalizations.of(context).nakedTriple;
		case HiddenSinglerTechnique:
			return AppLocalizations.of(context).hiddenSingle;
		case HiddenPairTechnique:
			return AppLocalizations.of(context).hiddenPair;
		case HiddenTripleTechnique:
			return AppLocalizations.of(context).hiddenTriple;
		case PointingPairTechnique:
			return AppLocalizations.of(context).pointingPair;
		case PointingTripleTechnique:
			return AppLocalizations.of(context).pointingTriple;
		default:
			return "Unknown technique";
		}
	}
}