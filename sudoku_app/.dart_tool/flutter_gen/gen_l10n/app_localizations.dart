import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_et.dart';
import 'app_localizations_ru.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('et'),
    Locale('ru')
  ];

  /// No description provided for @colorScheme.
  ///
  /// In en, this message translates to:
  /// **'Color scheme'**
  String get colorScheme;

  /// No description provided for @darkTheme.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get darkTheme;

  /// No description provided for @lightTheme.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get lightTheme;

  /// No description provided for @highContrastTheme.
  ///
  /// In en, this message translates to:
  /// **'High contrast'**
  String get highContrastTheme;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @sudokuRules.
  ///
  /// In en, this message translates to:
  /// **'Sudoku rules'**
  String get sudokuRules;

  /// No description provided for @lastRemainingCell.
  ///
  /// In en, this message translates to:
  /// **'Last remaining cell'**
  String get lastRemainingCell;

  /// No description provided for @lastPossibleNumber.
  ///
  /// In en, this message translates to:
  /// **'Last possible number'**
  String get lastPossibleNumber;

  /// No description provided for @hintCanNotBeSolved.
  ///
  /// In en, this message translates to:
  /// **'This Sudoku can\'t be solved with known techniques'**
  String get hintCanNotBeSolved;

  /// No description provided for @hintCanBeSolvedUsingSingleCell.
  ///
  /// In en, this message translates to:
  /// **'Technique can be applied to the highlighted cell: '**
  String get hintCanBeSolvedUsingSingleCell;

  /// No description provided for @hintCanBeSolvedUsingMultipleCells.
  ///
  /// In en, this message translates to:
  /// **'Technique can be applied to the highlighted cells: '**
  String get hintCanBeSolvedUsingMultipleCells;

  /// No description provided for @nakedSingle.
  ///
  /// In en, this message translates to:
  /// **'Naked singles'**
  String get nakedSingle;

  /// No description provided for @nakedPair.
  ///
  /// In en, this message translates to:
  /// **'Naked pairs'**
  String get nakedPair;

  /// No description provided for @nakedTriple.
  ///
  /// In en, this message translates to:
  /// **'Naked triples'**
  String get nakedTriple;

  /// No description provided for @hiddenSingle.
  ///
  /// In en, this message translates to:
  /// **'Hidden singles'**
  String get hiddenSingle;

  /// No description provided for @hiddenPair.
  ///
  /// In en, this message translates to:
  /// **'Hidden pairs'**
  String get hiddenPair;

  /// No description provided for @hiddenTriple.
  ///
  /// In en, this message translates to:
  /// **'Hidden triples'**
  String get hiddenTriple;

  /// No description provided for @pointingPair.
  ///
  /// In en, this message translates to:
  /// **'Pointing pairs'**
  String get pointingPair;

  /// No description provided for @pointingTriple.
  ///
  /// In en, this message translates to:
  /// **'Pointing triples'**
  String get pointingTriple;

  /// No description provided for @xwing.
  ///
  /// In en, this message translates to:
  /// **'X-wing'**
  String get xwing;

  /// No description provided for @ywing.
  ///
  /// In en, this message translates to:
  /// **'Y-wing'**
  String get ywing;

  /// No description provided for @swordfish.
  ///
  /// In en, this message translates to:
  /// **'Swordfish'**
  String get swordfish;

  /// No description provided for @fillCandidates.
  ///
  /// In en, this message translates to:
  /// **'Fill pencil marks'**
  String get fillCandidates;

  /// No description provided for @newGame.
  ///
  /// In en, this message translates to:
  /// **'New game'**
  String get newGame;

  /// No description provided for @easy.
  ///
  /// In en, this message translates to:
  /// **'Easy'**
  String get easy;

  /// No description provided for @medium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get medium;

  /// No description provided for @hard.
  ///
  /// In en, this message translates to:
  /// **'Hard'**
  String get hard;

  /// No description provided for @veryHard.
  ///
  /// In en, this message translates to:
  /// **'Very hard'**
  String get veryHard;

  /// No description provided for @menuItemGame.
  ///
  /// In en, this message translates to:
  /// **'Game'**
  String get menuItemGame;

  /// No description provided for @menuItemLearning.
  ///
  /// In en, this message translates to:
  /// **'Learning'**
  String get menuItemLearning;

  /// No description provided for @menuItemSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get menuItemSettings;

  /// No description provided for @reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// No description provided for @navigationMenuOption.
  ///
  /// In en, this message translates to:
  /// **'Navigation menu'**
  String get navigationMenuOption;

  /// No description provided for @textSizeOption.
  ///
  /// In en, this message translates to:
  /// **'Text size'**
  String get textSizeOption;

  /// No description provided for @adaptive.
  ///
  /// In en, this message translates to:
  /// **'Adaptive'**
  String get adaptive;

  /// No description provided for @bottomNavigationBar.
  ///
  /// In en, this message translates to:
  /// **'Bottom'**
  String get bottomNavigationBar;

  /// No description provided for @sidebar.
  ///
  /// In en, this message translates to:
  /// **'Sidebar'**
  String get sidebar;

  /// No description provided for @hint.
  ///
  /// In en, this message translates to:
  /// **'Hint'**
  String get hint;

  /// No description provided for @pencilMarks.
  ///
  /// In en, this message translates to:
  /// **'Pencil marks'**
  String get pencilMarks;

  /// No description provided for @basics.
  ///
  /// In en, this message translates to:
  /// **'Basics'**
  String get basics;

  /// No description provided for @beginnerTechniques.
  ///
  /// In en, this message translates to:
  /// **'Beginner techniques'**
  String get beginnerTechniques;

  /// No description provided for @intermediateTechniques.
  ///
  /// In en, this message translates to:
  /// **'Intermediate techniques'**
  String get intermediateTechniques;

  /// No description provided for @advancedTechniques.
  ///
  /// In en, this message translates to:
  /// **'Advanced techniques'**
  String get advancedTechniques;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome!'**
  String get welcome;

  /// No description provided for @seeBasics.
  ///
  /// In en, this message translates to:
  /// **'Would you like to see Sudoku rules first?'**
  String get seeBasics;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes, please'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'I know the rules'**
  String get no;

  /// No description provided for @congratulations.
  ///
  /// In en, this message translates to:
  /// **'Congratulations'**
  String get congratulations;

  /// No description provided for @youWon.
  ///
  /// In en, this message translates to:
  /// **'You solved the puzzle!'**
  String get youWon;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @techniquePurpose.
  ///
  /// In en, this message translates to:
  /// **'Technique purpose'**
  String get techniquePurpose;

  /// No description provided for @techniquePurposeCellValue.
  ///
  /// In en, this message translates to:
  /// **'finding value of a cell'**
  String get techniquePurposeCellValue;

  /// No description provided for @techniquePurposeRemoveCandidates.
  ///
  /// In en, this message translates to:
  /// **'removal of candidates from cells'**
  String get techniquePurposeRemoveCandidates;

  /// No description provided for @techniquePurposeCellValueAndRemoveCandidates.
  ///
  /// In en, this message translates to:
  /// **'finding value of a cell and removal of candidates from cells'**
  String get techniquePurposeCellValueAndRemoveCandidates;

  /// No description provided for @sudokuRulesDescription1.
  ///
  /// In en, this message translates to:
  /// **'Sudoku is a logic game that consists of a 9x9 grid divided into 3x3 regions or blocks, where some of the cells are filled with numbers.'**
  String get sudokuRulesDescription1;

  /// No description provided for @sudokuRulesDescription2.
  ///
  /// In en, this message translates to:
  /// **'To solve Sudoku, you have to fill in the empty cells with numbers.'**
  String get sudokuRulesDescription2;

  /// No description provided for @sudokuRulesDescription3.
  ///
  /// In en, this message translates to:
  /// **'Sudoku is considered correctly solved if all the cells are filled in according to the rules. \nThe rules are as follows: \n - all rows, columns and blocks must contain numbers from 1 to 9 \n - numbers cannot be repeated in any row, column or block.'**
  String get sudokuRulesDescription3;

  /// No description provided for @sudokuRulesDescription4.
  ///
  /// In en, this message translates to:
  /// **'Rows, columns and blocks can all be referred to as groups. \nUsing these rules it is possible to find the values of some cells. If there is only one empty cell left in a group, then the only number 1-9 that is not in the group can be placed there immediately.\nFor example, the block below contains all numbers except 7. Therefore, the empty cell can be filled with 7.'**
  String get sudokuRulesDescription4;

  /// No description provided for @solvePuzzleLearning.
  ///
  /// In en, this message translates to:
  /// **'Now you apply the new knowledge to solve this problem:'**
  String get solvePuzzleLearning;

  /// No description provided for @problemChangesLeft.
  ///
  /// In en, this message translates to:
  /// **'Number of cells that need to be changed: '**
  String get problemChangesLeft;

  /// No description provided for @problemIncorrectlyChangedCells.
  ///
  /// In en, this message translates to:
  /// **'Incorrectly changed cells: '**
  String get problemIncorrectlyChangedCells;

  /// No description provided for @problemSolved.
  ///
  /// In en, this message translates to:
  /// **'You solved the problem!'**
  String get problemSolved;

  /// No description provided for @findSolutionForCell.
  ///
  /// In en, this message translates to:
  /// **'Find the value of the highlighted cell'**
  String get findSolutionForCell;

  /// No description provided for @findSolutionForCellRemoveCandidates.
  ///
  /// In en, this message translates to:
  /// **'Find the value of the highlighted cell and then remove needed candidates'**
  String get findSolutionForCellRemoveCandidates;

  /// No description provided for @removeCellsCandidates.
  ///
  /// In en, this message translates to:
  /// **'Apply technique to the highlighted cells and removed needed candidates'**
  String get removeCellsCandidates;

  /// No description provided for @pencilMarksDescription1.
  ///
  /// In en, this message translates to:
  /// **'Pencil marks are used to mark the numbers that fit a given cell when the value of the cell is not known. Matching numbers are otherwise known as candidates.'**
  String get pencilMarksDescription1;

  /// No description provided for @pencilMarksDescription2.
  ///
  /// In en, this message translates to:
  /// **'At the beginning, all the numbers that could be entered in the cell that would not break the rules are added. Pencil marks help to keep track of the possible values of the cells. Also, many Sudoku solving techniques are based on the use of pencil marks.\nIn this app, you need to turn on pencil mark mode to enter pencil marks. This can be done by pressing a button with the pencil.'**
  String get pencilMarksDescription2;

  /// No description provided for @pencilMarksProblem.
  ///
  /// In en, this message translates to:
  /// **'Fill in candidates for the highlighted cell: '**
  String get pencilMarksProblem;

  /// No description provided for @lastPossibleNumberDescription1.
  ///
  /// In en, this message translates to:
  /// **'One of the simple techniques is the last possible number that fits into a cell. Only one number fits a cell because all others cannot be in that cell since they already exist in units associated with that cell (peers of the cell).'**
  String get lastPossibleNumberDescription1;

  /// No description provided for @lastPossibleNumberDescription2.
  ///
  /// In en, this message translates to:
  /// **'In the picture you can see the cell marked in red. Only the number 7 can be in a given cell, because all other numbers 1-9 are present in the units associated with this cell - numbers 1, 3, 4 and 5 are in the same row, numbers 2, 6 (and also the aforementioned 3 and 5) - in the same block, and numbers 8 and 9 (and 2) - in the same column. Only number 7 remains.'**
  String get lastPossibleNumberDescription2;

  /// No description provided for @lastRemainingCellDescription1.
  ///
  /// In en, this message translates to:
  /// **'Sometimes it happens that there are several free spaces in a block, row or column, but a number can only be placed in one cell because it cannot be placed in any other cell.'**
  String get lastRemainingCellDescription1;

  /// No description provided for @lastRemainingCellDescription2.
  ///
  /// In en, this message translates to:
  /// **'In the picture you can see that the column marked in red is missing several numbers, including the number 6. There are 4 empty places in the column, but 6 can only be placed in one of them, because in all other places it violates the Sudoku rules. Therefore, the number 6 is in the sixth row.'**
  String get lastRemainingCellDescription2;

  /// No description provided for @lastRemainingCellDescription3.
  ///
  /// In en, this message translates to:
  /// **'There are variations of this technique. In the picture below, one column is marked in red. The number 4 is missing in this column, and there is only one suitable place for it - in row 5. The empty cells in rows 2 and 9 are not suitable, because the number 4 already exists in these blocks (colored orange).'**
  String get lastRemainingCellDescription3;

  /// No description provided for @lastRemainingCellDescription4.
  ///
  /// In en, this message translates to:
  /// **'The same situation can be seen from the other side - in the picture there is a block marked in red. There is no 4 in this block and it can only be placed in one cell, because the number 4 (colored in red) already exists in the columns of other free cells (colored in orange).'**
  String get lastRemainingCellDescription4;

  /// No description provided for @nakedSingleDescription1.
  ///
  /// In en, this message translates to:
  /// **'Starting with this technique, pencil marks must be used to mark cell candidates to apply the techniques.'**
  String get nakedSingleDescription1;

  /// No description provided for @nakedSingleDescription2.
  ///
  /// In en, this message translates to:
  /// **'Naked candidates include several techniques with the same principle and goal - to remove possible candidates from the cells.'**
  String get nakedSingleDescription2;

  /// No description provided for @nakedSingleDescription3.
  ///
  /// In en, this message translates to:
  /// **'Naked single - if a cell\'s candidates are filled and there is only one candidate in that cell, then it is the value of that cell. This candidate can be removed from other cells in the same row, column and block.'**
  String get nakedSingleDescription3;

  /// No description provided for @nakedSingleDescription4.
  ///
  /// In en, this message translates to:
  /// **'In the first picture, you can see that there is only one candidate in the cell marked in blue. This means that the other numbers do not fit into the cell, because that would break the rules.'**
  String get nakedSingleDescription4;

  /// No description provided for @nakedSingleDescription5.
  ///
  /// In en, this message translates to:
  /// **'Since the number 2 is the only option, it can be put as a cell solution and remove 2 from the candidates of the makred cells\' peers - they are marked in red in the second picture.'**
  String get nakedSingleDescription5;

  /// No description provided for @nakedPairDescription1.
  ///
  /// In en, this message translates to:
  /// **'Naked pair - if there are two cells that are in the same column, row or block and those cells have only two possible candidates, then those numbers are contained in the given cells and can be removed from the candidates of other cells.'**
  String get nakedPairDescription1;

  /// No description provided for @nakedPairDescription2.
  ///
  /// In en, this message translates to:
  /// **'In the first picture, two cells are marked in red - they have two possible candidates, 1 and 2. The cells are in the same block and in the same row, so the naked pair technique can be applied. It can be said that the numbers one and two are contained in the marked cells, as they cannot contain any other number.'**
  String get nakedPairDescription2;

  /// No description provided for @nakedPairDescription3.
  ///
  /// In en, this message translates to:
  /// **'Since the numbers cannot be repeated in units, it allows to remove some candidates marked in red in the second picture. Since the cells containing the naked pair are in the same block, candidates 1 and 2 can be removed in all other cells of the block. The same can be done for sixth row, because cells with a naked pair are in the same row.'**
  String get nakedPairDescription3;

  /// No description provided for @nakedTripleDescription1.
  ///
  /// In en, this message translates to:
  /// **'Naked triple - the principle is the same as in the case of pairs - if the three connected cells contain only three possible candidates, then these numbers are located in the given cells and cannot be in the companions of the cells - they can be removed from the peers\' candidates.'**
  String get nakedTripleDescription1;

  /// No description provided for @nakedTripleDescription2.
  ///
  /// In en, this message translates to:
  /// **'The picture shows one block where there are cells containing naked triple. Candidates in these cells are 2, 4, 5, they are marked in green. Since three cells can only contain these three numbers, it can be said that they are located in these cells. Because of this, these numbers can be removed from among the candidates for the block in other cells. In this example, the naked triple is located in cells that are associated with only one unit - the block, so in the example, candidates outside the block cannot be removed. It is also worth noting that all the numbers do not necessarily have to be contained in all three cells - in the example, one of the cells contains only the numbers 4 and 5.'**
  String get nakedTripleDescription2;

  /// No description provided for @nakedTripleDescription3.
  ///
  /// In en, this message translates to:
  /// **'The same principle can be applied to a larger number of cells - the main thing is that the number of possible candidates coincides with the number of cells.'**
  String get nakedTripleDescription3;

  /// No description provided for @hiddenSingleDescription1.
  ///
  /// In en, this message translates to:
  /// **'Hidden Single - If there is a cell in the unit with a pencil mark that is not present in any other cell in the unit, then the number must be in that cell, as that is the only possible place.'**
  String get hiddenSingleDescription1;

  /// No description provided for @hiddenSingleDescription2.
  ///
  /// In en, this message translates to:
  /// **'The picture shows a candidate marked in green, which is contained in only one cell in the lower block. The other cells in the block cannot contain a 9, because there are already 9s in those columns. Since there are no other variants, it can be said that the number 9 is in the given cell , that is why other candidates can be removed from this cell and the solution can be set to 9.'**
  String get hiddenSingleDescription2;

  /// No description provided for @hiddenPairDescription1.
  ///
  /// In en, this message translates to:
  /// **'Hidden pair is similar to hidden single, but in this case the number of candidates and cells is 2. If there are two cells in a unit with 2 pencil marks that are not present in any other cell, then all other candidates in those cells can be removed because the 2 given numbers are in these cells.'**
  String get hiddenPairDescription1;

  /// No description provided for @hiddenPairDescription2.
  ///
  /// In en, this message translates to:
  /// **'The picture shows candidates 3 and 5 marked in green, which are contained in only two cells in the given block. Since these numbers cannot be in other cells, they can be claimed to be contained in the given cells and all other candidates can be removed from them. This changes a hidden pair into a naked pair and it can be further used to remove other candidates.'**
  String get hiddenPairDescription2;

  /// No description provided for @hiddenTripleDescription1.
  ///
  /// In en, this message translates to:
  /// **'Hidden triple - the principle is the same as in hidden pair, only the number of candidates and cells is 3. If there are three cells with three pencil marks in a unit, which are only in these cells, then other candidates can be removed in these cells.'**
  String get hiddenTripleDescription1;

  /// No description provided for @hiddenTripleDescription2.
  ///
  /// In en, this message translates to:
  /// **'In the picture you can see a block with candidates 2, 4 and 9 marked in green in three cells. Using the same principle as for the hidden pair, all other candidates can be removed from these cells.'**
  String get hiddenTripleDescription2;

  /// No description provided for @hiddenTripleDescription3.
  ///
  /// In en, this message translates to:
  /// **'The same principle works with a larger number of cells, but such variants are rare.'**
  String get hiddenTripleDescription3;

  /// No description provided for @pointingPairDescription1.
  ///
  /// In en, this message translates to:
  /// **'The pointing pair technique can be used if a candidate occurs twice in one block and both locations are in the same row or column. Since the number must appear 1 time in the block, it must be located in one of the two given cells. Therefore, this candidate can be removed from candidates of other cells in row / column.'**
  String get pointingPairDescription1;

  /// No description provided for @pointingPairDescription2.
  ///
  /// In en, this message translates to:
  /// **'The picture shows candidates for one of the columns marked in red and green. Since the number 5 must be contained in the top block and there are only two matching cells, it is located in one of these cells. It can be concluded that the number 5 cannot be in the block containing the candidate marked in red cell.'**
  String get pointingPairDescription2;

  /// No description provided for @pointingTripleDescription1.
  ///
  /// In en, this message translates to:
  /// **'The pointing triple technique has the same principle as the pointing pair - if a pencil mark occurs three times in a block and all cells containing it are in one row or column, then this pencil mark can be removed from other cells in the row / column. An example of a pointing triple can be seen in the picture.'**
  String get pointingTripleDescription1;

  /// No description provided for @xWingDescription1.
  ///
  /// In en, this message translates to:
  /// **'The X-Wing technique is considered the simplest among advanced techniques.'**
  String get xWingDescription1;

  /// No description provided for @xWingDescription2.
  ///
  /// In en, this message translates to:
  /// **'In order to apply the X-Wing technique, it is necessary to find two cells in two rows (two in each row) where there is a candidate that is not present in the other cells of the rows. The cells in both rows must be in the same columns.'**
  String get xWingDescription2;

  /// No description provided for @xWingDescription3.
  ///
  /// In en, this message translates to:
  /// **'One can imagine that the cells form a rectangle, in which the cells are the vertices of the rectangle. In the picture, these cells are marked in orange, the candidate to be considered is 9.'**
  String get xWingDescription3;

  /// No description provided for @xWingDescription4.
  ///
  /// In en, this message translates to:
  /// **'The technique is based on the fact that the candidate must appear 2 times in the given 4 cells - once in each row, and at the same time these numbers are located at the opposite vertices of the \'rectangle\', i.e. on the diagonals of the rectangle, because otherwise they would violate the basic rule of Sudoku - numbers cannot repeat in the unit. In any case, the number 9 in both columns is located in one of the cells marked in orange. Therefore, this candidate can be removed from the other cells in the columns.'**
  String get xWingDescription4;

  /// No description provided for @xWingDescription5.
  ///
  /// In en, this message translates to:
  /// **'The technique can also be used the other way around - if the candidates are selected in two columns and the candidates are removed in rows. An example of such a variation is shown in the second picture. As a result, the candidates marked in red in rows 3 and 9 are removed.'**
  String get xWingDescription5;

  /// No description provided for @yWingDescription1.
  ///
  /// In en, this message translates to:
  /// **'Unlike the X-Wing technique, the Y-Wing technique is based on three cells and three candidates, the fourth cell in this technique is the cell where the candidate can be removed. This is the simplest Y-Wing variant, but there are others. For better understanding, it is reasonable to start with a simple variant.'**
  String get yWingDescription1;

  /// No description provided for @yWingDescription2.
  ///
  /// In en, this message translates to:
  /// **'Let A, B and C be three numbers. In order to be able to apply the Y-Wing technique, you need to find three cells that are arranged to form a right angle (they can be imagined as 3 vertices of a rectangle). In all three cells there must be exactly two candidates. The cell at the top of the right angle must contain the candidates AB, the other cells must contain the candidates AC and BC (that is, the number C and one of the numbers A and B). One possible variant of the placement of the cells is shown in the first picture.'**
  String get yWingDescription2;

  /// No description provided for @yWingDescription3.
  ///
  /// In en, this message translates to:
  /// **'If the number A is in the cell AB, then the number C is in the cell AC. On the other hand, if the number B is in the cell AB, then the number C is in the cell BC. In both cases, the number C is either in the cell AC or BC. From this we can conclude , that the cell intersected by the cells AC and BC (at the fourth vertex of the rectangle) cannot under any circumstances contain the number C.'**
  String get yWingDescription3;

  /// No description provided for @yWingDescription4.
  ///
  /// In en, this message translates to:
  /// **'The second picture shows an example of a simple variation of the Y-Wing technique. In this example, the candidate 3 is removed from the cell located at the intersection of the orange colored row and column.'**
  String get yWingDescription4;

  /// No description provided for @yWingDescription5.
  ///
  /// In en, this message translates to:
  /// **'There are other variations of the Y-Wing technique. In the simplest variation, one cell was connected to the middle (AB) cell by row, the other cell - by column, but it doesn\'t necessarily have to be like that. There is a variant where one of the cells is connected to the middle cell by the block - they are located in one block. You can see such a variant in the third picture.'**
  String get yWingDescription5;

  /// No description provided for @yWingDescription6.
  ///
  /// In en, this message translates to:
  /// **'In this variation, candidates can be removed in multiple cells. The candidate marked in red in the upper block can be removed because it is in the cross-zone of column 1 and the upper block. In other words, both cells of the Y-Wing, where there can be 4, are companions of this cell and one among them definitely contains the number 4. The same can be said about the candidates marked in red in the lower block. There, the lower block and the 3rd column intersect.'**
  String get yWingDescription6;

  /// No description provided for @swordfishDescription1.
  ///
  /// In en, this message translates to:
  /// **'The swordfish technique is basically similar to the X-Wing technique, its purpose is also to eliminate candidates. In the X-Wing technique, the squares formed a 2x2 matrix, in the Swordfish technique it is a 3x3 matrix.'**
  String get swordfishDescription1;

  /// No description provided for @swordfishDescription2.
  ///
  /// In en, this message translates to:
  /// **'To apply the technique, you have to find 3 rows where a number can be in three squares and these squares are located in the same columns. You can see an example of the location of the squares in the first picture, the squares are colored orange.'**
  String get swordfishDescription2;

  /// No description provided for @swordfishDescription3.
  ///
  /// In en, this message translates to:
  /// **'Since a given number must appear in every row, and there are only three columns in three rows where this number can be located, it can be said that in each column this number is located in one of the three given rows. Therefore, in the given columns, the given number can be removed from all other squares from among the candidates - these squares are marked in red in the picture abouve.'**
  String get swordfishDescription3;

  /// No description provided for @swordfishDescription4.
  ///
  /// In en, this message translates to:
  /// **'The Swordfish technique is considered an extension of the X-Wing technique, and the reason why the Swordfish technique works can be explained with the help of X-Wing. For example, you can look at the bottom row of the 3x3 matrix shown in the first picture - there the given number can be located in three squares. The variants are shown in the second picture (the location of the number is marked in green).'**
  String get swordfishDescription4;

  /// No description provided for @swordfishDescription5.
  ///
  /// In en, this message translates to:
  /// **'In each variant, the entered number removes some possible positions from the matrix and other squares - they are marked in red in the figure. However, in each variant, 4 squares remain in the matrix (colored orange), which form the required position for the X-Wing technique.'**
  String get swordfishDescription5;

  /// No description provided for @swordfishDescription6.
  ///
  /// In en, this message translates to:
  /// **'A number of candidates can be removed using the X-Wing technique - they are marked in blue in the figure. In all three variants, candidates were removed from all the squares that are colored red in the first image. The same situation occurs in the other variants if you try to put the number in the upper or in the middle row - some candidates are removed by the given number and all others - using the X-Wing technique.'**
  String get swordfishDescription6;

  /// No description provided for @swordfishDescription7.
  ///
  /// In en, this message translates to:
  /// **'The swordfish technique also works the other way around, when there are three columns with three possible number positions. In this case, candidates are removed from the rows. An example of such a variation is shown in the third image.'**
  String get swordfishDescription7;

  /// No description provided for @swordfishDescription8.
  ///
  /// In en, this message translates to:
  /// **'It can also be noticed that candidate 4 does not appear exactly 3 times in each column in this example. In fact, applying the Swordfish technique requires candidates to appear at least 2 times in each column (or row, as in the previous figures). This does not change the technique principle and the squares colored in orange are still the only possible places in these rows (columns), just the number of possible placement combinations is smaller. Such a variant of the Swordfish technique is called 2-3-2 Swordfish - according to the number of candidates in the columns (rows). The variation that was before, if the candidates appeared 3 times in all rows and formed a complete 3x3 matrix, it is called 3-3-3 Swordfish.'**
  String get swordfishDescription8;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'et', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'et': return AppLocalizationsEt();
    case 'ru': return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
