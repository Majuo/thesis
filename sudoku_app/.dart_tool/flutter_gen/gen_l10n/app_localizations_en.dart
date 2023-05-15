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
  String get findSolutionForCellRemoveCandidates => 'Find the value of the highlighted cell and then remove needed candidates';

  @override
  String get removeCellsCandidates => 'Apply technique to the highlighted cells and removed needed candidates';

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
  String get nakedTripleDescription2 => 'The picture shows one block where there are cells containing naked triple. Candidates in these cells are 2, 4, 5, they are marked in green. Since three cells can only contain these three numbers, it can be said that they are located in these cells. Because of this, these numbers can be removed from among the candidates for the block in other cells. In this example, the naked triple is located in cells that are associated with only one unit - the block, so in the example, candidates outside the block cannot be removed. It is also worth noting that all the numbers do not necessarily have to be contained in all three cells - in the example, one of the cells contains only the numbers 4 and 5.';

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

  @override
  String get xWingDescription1 => 'The X-Wing technique is considered the simplest among advanced techniques.';

  @override
  String get xWingDescription2 => 'In order to apply the X-Wing technique, it is necessary to find two cells in two rows (two in each row) where there is a candidate that is not present in the other cells of the rows. The cells in both rows must be in the same columns.';

  @override
  String get xWingDescription3 => 'One can imagine that the cells form a rectangle, in which the cells are the vertices of the rectangle. In the picture, these cells are marked in orange, the candidate to be considered is 9.';

  @override
  String get xWingDescription4 => 'The technique is based on the fact that the candidate must appear 2 times in the given 4 cells - once in each row, and at the same time these numbers are located at the opposite vertices of the \'rectangle\', i.e. on the diagonals of the rectangle, because otherwise they would violate the basic rule of Sudoku - numbers cannot repeat in the unit. In any case, the number 9 in both columns is located in one of the cells marked in orange. Therefore, this candidate can be removed from the other cells in the columns.';

  @override
  String get xWingDescription5 => 'The technique can also be used the other way around - if the candidates are selected in two columns and the candidates are removed in rows. An example of such a variation is shown in the second picture. As a result, the candidates marked in red in rows 3 and 9 are removed.';

  @override
  String get yWingDescription1 => 'Unlike the X-Wing technique, the Y-Wing technique is based on three cells and three candidates, the fourth cell in this technique is the cell where the candidate can be removed. This is the simplest Y-Wing variant, but there are others. For better understanding, it is reasonable to start with a simple variant.';

  @override
  String get yWingDescription2 => 'Let A, B and C be three numbers. In order to be able to apply the Y-Wing technique, you need to find three cells that are arranged to form a right angle (they can be imagined as 3 vertices of a rectangle). In all three cells there must be exactly two candidates. The cell at the top of the right angle must contain the candidates AB, the other cells must contain the candidates AC and BC (that is, the number C and one of the numbers A and B). One possible variant of the placement of the cells is shown in the first picture.';

  @override
  String get yWingDescription3 => 'If the number A is in the cell AB, then the number C is in the cell AC. On the other hand, if the number B is in the cell AB, then the number C is in the cell BC. In both cases, the number C is either in the cell AC or BC. From this we can conclude , that the cell intersected by the cells AC and BC (at the fourth vertex of the rectangle) cannot under any circumstances contain the number C.';

  @override
  String get yWingDescription4 => 'The second picture shows an example of a simple variation of the Y-Wing technique. In this example, the candidate 3 is removed from the cell located at the intersection of the orange colored row and column.';

  @override
  String get yWingDescription5 => 'There are other variations of the Y-Wing technique. In the simplest variation, one cell was connected to the middle (AB) cell by row, the other cell - by column, but it doesn\'t necessarily have to be like that. There is a variant where one of the cells is connected to the middle cell by the block - they are located in one block. You can see such a variant in the third picture.';

  @override
  String get yWingDescription6 => 'In this variation, candidates can be removed in multiple cells. The candidate marked in red in the upper block can be removed because it is in the cross-zone of column 1 and the upper block. In other words, both cells of the Y-Wing, where there can be 4, are companions of this cell and one among them definitely contains the number 4. The same can be said about the candidates marked in red in the lower block. There, the lower block and the 3rd column intersect.';

  @override
  String get swordfishDescription1 => 'The swordfish technique is basically similar to the X-Wing technique, its purpose is also to eliminate candidates. In the X-Wing technique, the squares formed a 2x2 matrix, in the Swordfish technique it is a 3x3 matrix.';

  @override
  String get swordfishDescription2 => 'To apply the technique, you have to find 3 rows where a number can be in three squares and these squares are located in the same columns. You can see an example of the location of the squares in the first picture, the squares are colored orange.';

  @override
  String get swordfishDescription3 => 'Since a given number must appear in every row, and there are only three columns in three rows where this number can be located, it can be said that in each column this number is located in one of the three given rows. Therefore, in the given columns, the given number can be removed from all other squares from among the candidates - these squares are marked in red in the picture abouve.';

  @override
  String get swordfishDescription4 => 'The Swordfish technique is considered an extension of the X-Wing technique, and the reason why the Swordfish technique works can be explained with the help of X-Wing. For example, you can look at the bottom row of the 3x3 matrix shown in the first picture - there the given number can be located in three squares. The variants are shown in the second picture (the location of the number is marked in green).';

  @override
  String get swordfishDescription5 => 'In each variant, the entered number removes some possible positions from the matrix and other squares - they are marked in red in the figure. However, in each variant, 4 squares remain in the matrix (colored orange), which form the required position for the X-Wing technique.';

  @override
  String get swordfishDescription6 => 'A number of candidates can be removed using the X-Wing technique - they are marked in blue in the figure. In all three variants, candidates were removed from all the squares that are colored red in the first image. The same situation occurs in the other variants if you try to put the number in the upper or in the middle row - some candidates are removed by the given number and all others - using the X-Wing technique.';

  @override
  String get swordfishDescription7 => 'The swordfish technique also works the other way around, when there are three columns with three possible number positions. In this case, candidates are removed from the rows. An example of such a variation is shown in the third image.';

  @override
  String get swordfishDescription8 => 'It can also be noticed that candidate 4 does not appear exactly 3 times in each column in this example. In fact, applying the Swordfish technique requires candidates to appear at least 2 times in each column (or row, as in the previous figures). This does not change the technique principle and the squares colored in orange are still the only possible places in these rows (columns), just the number of possible placement combinations is smaller. Such a variant of the Swordfish technique is called 2-3-2 Swordfish - according to the number of candidates in the columns (rows). The variation that was before, if the candidates appeared 3 times in all rows and formed a complete 3x3 matrix, it is called 3-3-3 Swordfish.';
}
