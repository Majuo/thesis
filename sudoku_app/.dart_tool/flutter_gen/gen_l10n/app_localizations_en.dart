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
  String get hintCanNotBeSolved => 'Selected cell can not be currently solved with any techniques';

  @override
  String get hintCanBeSolvedUsing => 'Technique can be applied to the selected cell: ';

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
}
