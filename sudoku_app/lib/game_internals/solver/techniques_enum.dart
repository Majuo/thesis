enum SudokuTechniquesEnum {
	rules,
	lastPossibleNumber,
	lastRemainingCell,
  nakedSingle,
  nakedPair,
  nakedTriple,
  hiddenSingle,
  hiddenPair,
  hiddenTriple,
  pointingPair,
  pointingTriple,
  xwing,
  ywing,
  swordfish
}

extension SudokuTechniquesExtension on SudokuTechniquesEnum {
  static List<SudokuTechniquesEnum> easyTechniques() => [
          SudokuTechniquesEnum.rules,
          SudokuTechniquesEnum.lastPossibleNumber,
          SudokuTechniquesEnum.lastRemainingCell
        ];

  static List<SudokuTechniquesEnum> mediumTechniques() => easyTechniques()..addAll([
          SudokuTechniquesEnum.nakedSingle,
          SudokuTechniquesEnum.nakedPair,
          SudokuTechniquesEnum.hiddenSingle,
          SudokuTechniquesEnum.hiddenPair,
  ]);
  static List<SudokuTechniquesEnum> hardTechniques() => mediumTechniques()..addAll([
          SudokuTechniquesEnum.nakedTriple,
          SudokuTechniquesEnum.hiddenTriple,
          SudokuTechniquesEnum.pointingPair,
          SudokuTechniquesEnum.pointingTriple
  ]);
}