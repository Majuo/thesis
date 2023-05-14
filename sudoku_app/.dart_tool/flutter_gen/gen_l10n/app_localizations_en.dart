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
  String get lastRemainingCellDescription3 => 'There are variations of this technique. In the picture below, one column is marked in red. The number 4 is missing in this column, and there is only one suitable place for it - in row 5. The empty cells in rows 2 and 9 are not suitable, because the number 4 already exists in these blocks (colored orange).';

  @override
  String get lastRemainingCellDescription4 => 'The same situation can be seen from the other side - in the picture there is a block marked in red. There is no 4 in this block and it can only be placed in one cell, because the number 4 (colored in red) already exists in the columns of other free cells (colored in orange).';

  @override
  String get nakedSingleDescription1 => 'Starting with this technique, pencil marks must be used to mark cell candidates to apply the techniques.';

  @override
  String get nakedSingleDescription2 => 'Naked candidates include several techniques with the same principle and goal - to remove possible candidates from the cells.';

  @override
  String get nakedSingleDescription3 => 'Naked single - if a cell\'s candidates are filled and there is only one candidate in that cell, then it is the value of that cell. This candidate can be removed from other cells in the same row, column and block.';

  @override
  String get nakedSingleDescription4 => 'In the first picture, you can see that there is only one candidate in the cell marked in blue. This means that the other numbers do not fit into the cell, because that would break the rules.';

  @override
  String get nakedSingleDescription5 => 'Since the number 2 is the only option, it can be put as a cell solution and remove 2 from the candidates of the makred cells\' peers - they are marked in red in the second picture.';

  @override
  String get nakedPairDescription1 => 'Naked pair - if there are two cells that are in the same column, row or block and those cells have only two possible candidates, then those numbers are contained in the given cells and can be removed from the candidates of other cells.';

  @override
  String get nakedPairDescription2 => 'In the first picture, two cells are marked in red - they have two possible candidates, 1 and 2. The cells are in the same block and in the same row, so the naked pair technique can be applied. It can be said that the numbers one and two are contained in the marked cells, as they cannot contain any other number.';

  @override
  String get nakedPairDescription3 => 'Since the numbers cannot be repeated in units, it allows to remove some candidates marked in red in the second picture. Since the cells containing the naked pair are in the same block, candidates 1 and 2 can be removed in all other cells of the block. The same can be done for sixth row, because cells with a naked pair are in the same row.';

  @override
  String get nakedTripleDescription1 => 'Naked triple - the principle is the same as in the case of pairs - if the three connected cells contain only three possible candidates, then these numbers are located in the given cells and cannot be in the companions of the cells - they can be removed from the peers\' candidates.';

  @override
  String get nakedTripleDescription2 => 'The third picture shows one block where there are cells containing naked triple. Candidates in these cells are 2, 4, 5, they are marked in green. Since three cells can only contain these three numbers, it can be said that they are located in these cells. Because of this, these numbers can be removed from among the candidates for the block in other cells. In this example, the naked triple is located in cells that are associated with only one unit - the block, so in the example, candidates outside the block cannot be removed. It is also worth noting that all the numbers do not necessarily have to be contained in all three cells - in the example, one of the cells contains only the numbers 4 and 5.';

  @override
  String get nakedTripleDescription3 => 'The same principle can be applied to a larger number of cells - the main thing is that the number of possible candidates coincides with the number of cells.';

  @override
  String get hiddenSingleDescription1 => 'Hidden Single - If there is a cell in the unit with a pencil mark that is not present in any other cell in the unit, then the number must be in that cell, as that is the only possible place.';

  @override
  String get hiddenSingleDescription2 => 'The picture shows a candidate marked in green, which is contained in only one cell in the lower block. The other cells in the block cannot contain a 9, because there are already 9s in those columns. Since there are no other variants, it can be said that the number 9 is in the given cell , that is why other candidates can be removed from this cell and the solution can be set to 9.';

  @override
  String get hiddenPairDescription1 => 'Hidden pair is similar to hidden single, but in this case the number of candidates and cells is 2. If there are two cells in a unit with 2 pencil marks that are not present in any other cell, then all other candidates in those cells can be removed because the 2 given numbers are in these cells.';

  @override
  String get hiddenPairDescription2 => 'The picture shows candidates 3 and 5 marked in green, which are contained in only two cells in the given block. Since these numbers cannot be in other cells, they can be claimed to be contained in the given cells and all other candidates can be removed from them. This changes a hidden pair into a naked pair and it can be further used to remove other candidates.';

  @override
  String get hiddenTripleDescription1 => 'Hidden triple - the principle is the same as in hidden pair, only the number of candidates and cells is 3. If there are three cells with three pencil marks in a unit, which are only in these cells, then other candidates can be removed in these cells.';

  @override
  String get hiddenTripleDescription2 => 'In the picture you can see a block with candidates 2, 4 and 9 marked in green in three cells. Using the same principle as for the hidden pair, all other candidates can be removed from these cells.';

  @override
  String get hiddenTripleDescription3 => 'The same principle works with a larger number of cells, but such variants are rare.';

  @override
  String get pointingPairDescription1 => 'The pointing pair technique can be used if a candidate occurs twice in one block and both locations are in the same row or column. Since the number must appear 1 time in the block, it must be located in one of the two given cells. Therefore, this candidate can be removed from candidates of other cells in row / column.';

  @override
  String get pointingPairDescription2 => 'The picture shows candidates for one of the columns marked in red and green. Since the number 5 must be contained in the top block and there are only two matching cells, it is located in one of these cells. It can be concluded that the number 5 cannot be in the block containing the candidate marked in red cell.';

  @override
  String get pointingTripleDescription1 => 'The pointing triple technique has the same principle as the pointing pair - if a pencil mark occurs three times in a block and all cells containing it are in one row or column, then this pencil mark can be removed from other cells in the row / column. An example of a pointing triple can be seen in the picture.';
}
