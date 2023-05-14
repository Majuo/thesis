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
  String get textSizeOption => 'Text size';

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
  String get techniquePurpose => 'Technique purpose';

  @override
  String get techniquePurposeCellValue => 'finding value of a cell';

  @override
  String get techniquePurposeRemoveCandidates => 'removal of candidates from cells';

  @override
  String get techniquePurposeCellValueAndRemoveCandidates => 'finding value of a cell and removal of candidates from cells';

  @override
  String get sudokuRulesDescription1 => 'Sudoku is a logic game that consists of a 9x9 grid divided into 3x3 regions or blocks, where some of the cells are filled with numbers.';

  @override
  String get sudokuRulesDescription2 => 'To solve Sudoku, you have to fill in the empty cells with numbers.';

  @override
  String get sudokuRulesDescription3 => 'Sudoku is considered correctly solved if all the cells are filled in according to the rules. \nThe rules are as follows: \n - all rows, columns and blocks must contain numbers from 1 to 9 \n - numbers cannot be repeated in any row, column or block.';

  @override
  String get sudokuRulesDescription4 => 'Rows, columns and blocks can all be referred to as groups. \nUsing these rules it is possible to find the values of some cells. If there is only one empty cell left in a group, then the only number 1-9 that is not in the group can be placed there immediately.\nFor example, the block below contains all numbers except 7. Therefore, the empty cell can be filled with 7.';

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

  @override
  String get pencilMarksDescription1 => 'Pencil marks are used to mark the numbers that fit a given cell when the value of the cell is not known. Matching numbers are otherwise known as candidates.';

  @override
  String get pencilMarksDescription2 => 'At the beginning, all the numbers that could be entered in the cell that would not break the rules are added. Pencil marks help to keep track of the possible values of the cells. Also, many Sudoku solving techniques are based on the use of pencil marks.\nIn this app, you need to turn on pencil mark mode to enter pencil marks. This can be done by pressing a button with the pencil.';

  @override
  String get pencilMarksProblem => 'Fill in candidates for the highlighted cell: ';

  @override
  String get lastPossibleNumberDescription1 => 'One of the simple techniques is the last possible number that fits into a cell. Only one number fits a cell because all others cannot be in that cell since they already exist in units associated with that cell (peers of the cell).';

  @override
  String get lastPossibleNumberDescription2 => 'In the picture you can see the cell marked in red. Only the number 7 can be in a given cell, because all other numbers 1-9 are present in the units associated with this cell - numbers 1, 3, 4 and 5 are in the same row, numbers 2, 6 (and also the aforementioned 3 and 5) - in the same block, and numbers 8 and 9 (and 2) - in the same column. Only number 7 remains.';

  @override
  String get lastRemainingCellDescription1 => 'Sometimes it happens that there are several free spaces in a block, row or column, but a number can only be placed in one cell because it cannot be placed in any other cell.';

  @override
  String get lastRemainingCellDescription2 => 'In the picture you can see that the column marked in red is missing several numbers, including the number 6. There are 4 empty places in the column, but 6 can only be placed in one of them, because in all other places it violates the Sudoku rules. Therefore, the number 6 is in the sixth row.';

  @override
  String get lastRemainingCellDescription3 => 'There are variations of this technique. In the image below, one column is marked in red. The number 4 is missing in this column, and there is only one suitable place for it - in row 5. The empty cells in rows 2 and 9 are not suitable, because the number 4 already exists in these blocks (colored orange).';

  @override
  String get lastRemainingCellDescription4 => 'The same situation can be seen from the other side - in the picture there is a block marked in red. There is no 4 in this block and it can only be placed in one cell, because the number 4 (colored in red) already exists in the columns of other free cells (colored in orange).';
}
