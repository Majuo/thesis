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
}
