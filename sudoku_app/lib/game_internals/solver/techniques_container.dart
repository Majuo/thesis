import 'package:sudoku_app/game_internals/solver/techniques/hidden_pair_technique.dart';
import 'package:sudoku_app/game_internals/solver/techniques/hidden_single_technique.dart';
import 'package:sudoku_app/game_internals/solver/techniques/hidden_triple_technique.dart';
import 'package:sudoku_app/game_internals/solver/techniques/i_sudoku_technique.dart';
import 'package:sudoku_app/game_internals/solver/techniques/last_possible_number_technique.dart';
import 'package:sudoku_app/game_internals/solver/techniques/last_remaining_cell_technique.dart';
import 'package:sudoku_app/game_internals/solver/techniques/naked_pair_technique.dart';
import 'package:sudoku_app/game_internals/solver/techniques/naked_single_technique.dart';
import 'package:sudoku_app/game_internals/solver/techniques/naked_triple_technique.dart';
import 'package:sudoku_app/game_internals/solver/techniques/pointing_pair_technique.dart';
import 'package:sudoku_app/game_internals/solver/techniques/pointing_triple_technique.dart';
import 'package:sudoku_app/game_internals/solver/techniques/sudoku_rules_technique.dart';
import 'package:sudoku_app/game_internals/solver/techniques_enum.dart';

class TechniquesContainer {
	static Map<SudokuTechniquesEnum, ISudokuTechnique> techniquesMap = const {
		SudokuTechniquesEnum.rules : SudokuRulesTechnique(),
		SudokuTechniquesEnum.lastPossibleNumber : LastPossibleNumberTechnique(),
		SudokuTechniquesEnum.lastRemainingCell : LastRemainingCellTechnique(),
		SudokuTechniquesEnum.nakedSingle : NakedSingleTechnique(),
		SudokuTechniquesEnum.nakedPair : NakedPairTechnique(),
		SudokuTechniquesEnum.nakedTriple : NakedTripleTechnique(),
		SudokuTechniquesEnum.hiddenSingle : HiddenSingleTechnique(),
		SudokuTechniquesEnum.hiddenPair : HiddenPairTechnique(),
		SudokuTechniquesEnum.hiddenTriple : HiddenTripleTechnique(),
		SudokuTechniquesEnum.pointingPair : PointingPairTechnique(),
		SudokuTechniquesEnum.pointingTriple : PointingTripleTechnique(),
	};

	static List<ISudokuTechnique> getTechniques(Iterable<SudokuTechniquesEnum> techniques) {
		if (techniques.isEmpty) return List.empty();
		var result = List<ISudokuTechnique>.empty(growable: true);
		for (var technique in techniques) {
			if (techniquesMap.containsKey(technique)) {
				result.add(techniquesMap[technique]!);
			}
		}
		return result;
	}
}