import 'package:sudoku_app/game_internals/solver/techniques/i_sudoku_technique.dart';
import 'package:sudoku_app/game_internals/solver/techniques/last_possible_number_technique.dart';
import 'package:sudoku_app/game_internals/solver/techniques/last_remaining_cell_technique.dart';
import 'package:sudoku_app/game_internals/solver/techniques/sudoku_rules_technique.dart';
import 'package:sudoku_app/game_internals/solver/techniques_enum.dart';

class TechniquesContainer {
	static Map<SudokuTechniquesEnum, ISudokuTechnique> techniquesMap = const {
		SudokuTechniquesEnum.rules : SudokuRulesTechnique(),
		SudokuTechniquesEnum.lastPossibleNumber : LastPossibleNumberTechnique(),
		SudokuTechniquesEnum.lastRemainingCell : LastRemainingCellTechnique(),
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