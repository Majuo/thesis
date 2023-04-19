import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get colorScheme => 'Color scheme';

  @override
  String get darkTheme => 'Dark';

  @override
  String get lightTheme => 'Light';

  @override
  String get highContrastTheme => 'High contrast';

  @override
  String get language => 'Language';

  @override
  String get sudokuRules => 'Sudoku rules';

  @override
  String get lastRemainingCell => 'Last remaining cell';

  @override
  String get lastPossibleNumber => 'Last possible number';

  @override
  String get hintCanNotBeSolved => 'This Sudoku can\'t be solved with known techniques';

  @override
  String get hintCanBeSolvedUsingSingleCell => 'Technique can be applied to the highlighted cell: ';

  @override
  String get hintCanBeSolvedUsingMultipleCells => 'Technique can be applied to the highlighted cells: ';

  @override
  String get nakedSingle => 'Naked singles';

  @override
  String get nakedPair => 'Naked pairs';

  @override
  String get nakedTriple => 'Naked triples';

  @override
  String get hiddenSingle => 'Hidden singles';

  @override
  String get hiddenPair => 'Hidden pairs';

  @override
  String get hiddenTriple => 'Hidden triples';

  @override
  String get pointingPair => 'Pointing pairs';

  @override
  String get pointingTriple => 'Pointing triples';

  @override
  String get xwing => 'X-wing';

  @override
  String get ywing => 'Y-wing';

  @override
  String get swordfish => 'Swordfish';

  @override
  String get fillCandidates => 'Fill pencil marks';

  @override
  String get newGame => 'New game';

  @override
  String get easy => 'Easy';

  @override
  String get medium => 'Medium';

  @override
  String get hard => 'Hard';

  @override
  String get veryHard => 'Very hard';

  @override
  String get menuItemGame => 'Game';

  @override
  String get menuItemLearning => 'Learning';

  @override
  String get menuItemSettings => 'Settings';

  @override
  String get reset => 'Reset';

  @override
  String get navigationMenuOption => 'Navigation menu';

  @override
  String get adaptive => 'Adaptive';

  @override
  String get bottomNavigationBar => 'Bottom';

  @override
  String get sidebar => 'Sidebar';

  @override
  String get hint => 'Hint';

  @override
  String get pencilMarks => 'Pencil marks';

  @override
  String get basics => 'Basics';

  @override
  String get beginnerTechniques => 'Beginner techniques';

  @override
  String get intermediateTechniques => 'Intermediate techniques';

  @override
  String get advancedTechniques => 'Advanced techniques';

  @override
  String get welcome => 'Welcome!';

  @override
  String get seeBasics => 'Would you like to see Sudoku rules first?';

  @override
  String get yes => 'Yes, please';

  @override
  String get no => 'I know the rules';

  @override
  String get congratulations => 'Congratulations';

  @override
  String get youWon => 'You solved the puzzle!';

  @override
  String get ok => 'OK';

  @override
  String get sudokuRulesDescription1 => 'Sudoku is a logic game that consists of a 9x9 grid divided into 3x3 regions or blocks, where some of the squares are filled with numbers.';

  @override
  String get sudokuRulesDescription2 => 'To solve Sudoku, you have to fill in the empty cells with numbers.';

  @override
  String get sudokuRulesDescription3 => 'Sudoku is considered correctly solved if all the cells are filled in according to the rules. \nThe rules are as follows: \n - all rows, columns and blocks must contain numbers from 1 to 9 \n - numbers cannot be repeated in any row, column or block.';

  @override
  String get sudokuRulesDescription4 => 'Rows, columns and blocks can all be referred to as groups. \nUsing these rules it is possible to find the values of some cells. If there is only one empty cell left in a group, then the only number 1-9 that is not in the group can be placed there immediately.\nFor example, the block below contains all numbers except 7. Therefore, the empty square can be filled with 7.';

  @override
  String get solvePuzzleLearning => 'Now you apply the new knowledge to solve this problem:';

  @override
  String get problemChangesLeft => 'Number of cells that need to be changed: ';

  @override
  String get problemIncorrectlyChangedCells => 'Incorrectly changed cells: ';

  @override
  String get problemSolved => 'You solved the problem!';

  @override
  String get findSolutionForCell => 'Find the value of the highlighted cell';
}
