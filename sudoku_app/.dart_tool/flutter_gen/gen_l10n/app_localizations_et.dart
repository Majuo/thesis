import 'app_localizations.dart';

/// The translations for Estonian (`et`).
class AppLocalizationsEt extends AppLocalizations {
  AppLocalizationsEt([String locale = 'et']) : super(locale);

  @override
  String get colorScheme => 'Värviskeem';

  @override
  String get darkTheme => 'Tume';

  @override
  String get lightTheme => 'Hele';

  @override
  String get highContrastTheme => 'Kõrge kontrastsusega';

  @override
  String get language => 'Keel';

  @override
  String get sudokuRules => 'Sudoku reeglid';

  @override
  String get lastRemainingCell => 'Ainus võimalik ruut';

  @override
  String get lastPossibleNumber => 'Ainus võimalik number';

  @override
  String get hintCanNotBeSolved => 'Antud Sudoku ei ole võimalik lahendada teadaolevate tehnikate abil';

  @override
  String get hintCanBeSolvedUsingSingleCell => 'Märgitud ruudul saab rakendada tehnikat: ';

  @override
  String get hintCanBeSolvedUsingMultipleCells => 'Märgitud ruutudel saab rakendada tehnikat: ';

  @override
  String get nakedSingle => 'Alasti üksik';

  @override
  String get nakedPair => 'Alasti paar';

  @override
  String get nakedTriple => 'Alasti kolmik';

  @override
  String get hiddenSingle => 'Peidetud üksik';

  @override
  String get hiddenPair => 'Peidetud paar';

  @override
  String get hiddenTriple => 'Peidetud kolmik';

  @override
  String get pointingPair => 'Osutav paar';

  @override
  String get pointingTriple => 'Osutav kolmik';

  @override
  String get fillCandidates => 'Täida kõik pliiatsimärgid';

  @override
  String get newGame => 'Uus mäng';

  @override
  String get easy => 'Kerge';

  @override
  String get medium => 'Keskmine';

  @override
  String get hard => 'Raske';

  @override
  String get veryHard => 'Väga raske';

  @override
  String get menuItemGame => 'Mäng';

  @override
  String get menuItemLearning => 'Õppimine';

  @override
  String get menuItemSettings => 'Seaded';

  @override
  String get reset => 'Tühista';

  @override
  String get navigationMenuOption => 'Navigeerimismenüü';

  @override
  String get adaptive => 'Adaptiivne';

  @override
  String get bottomNavigationBar => 'Allpool';

  @override
  String get sidebar => 'Külgriba';
}
