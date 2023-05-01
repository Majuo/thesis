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
  String get xwing => 'X-tiib';

  @override
  String get ywing => 'Y-tiib';

  @override
  String get swordfish => 'Mõõkkala';

  @override
  String get fillCandidates => 'Täida pliiatsimärgid';

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
  String get textSizeOption => 'Teksti suurus';

  @override
  String get adaptive => 'Adaptiivne';

  @override
  String get bottomNavigationBar => 'Allpool';

  @override
  String get sidebar => 'Külgriba';

  @override
  String get hint => 'Vihje';

  @override
  String get pencilMarks => 'Pliiatsimärgid';

  @override
  String get basics => 'Algteadmised';

  @override
  String get beginnerTechniques => 'Algaja tehnikad';

  @override
  String get intermediateTechniques => 'Kesktaseme tehnikad';

  @override
  String get advancedTechniques => 'Edasijõudnud tehnikad';

  @override
  String get welcome => 'Tere tulemast!';

  @override
  String get seeBasics => 'Kas tahad kõigepealt näha Sudoku reegleid?';

  @override
  String get yes => 'Jah';

  @override
  String get no => 'Ei';

  @override
  String get congratulations => 'Palju õnne';

  @override
  String get youWon => 'Sudoku on lahendatud õigesti!';

  @override
  String get ok => 'OK';

  @override
  String get sudokuRulesDescription1 => 'Sudoku on loogikamäng, mis kujutab endast 9x9 ruudustikku, mis on jagatud omakorda 3x3 regioonideks või plokideks, kus mõned ruudud on täidetud numbritega.';

  @override
  String get sudokuRulesDescription2 => 'Sudoku lahendamiseks tuleb täita vabad ruudud numbritega.';

  @override
  String get sudokuRulesDescription3 => 'Sudoku peetakse korrektselt lahendatuks, kui kõik ruudud on täidetud vastavalt reeglitele. \nReeglid on järgmised: \n - kõik read, veerud ja plokid peavad sisaldama numbreid 1-st 9-ni \n - numbrid ei saa korduda üheski reas, veerus ja plokis.';

  @override
  String get sudokuRulesDescription4 => 'Ridu, veerge ja plokke saab nimetada ühe sõnaga - grupp. \nKasutades neid reegleid on võimalik leida mõnede ruutude väärtusi. Kui mingis grupis on jäänud ainult üks tühi ruut, siis võib sinna kohe panna ainus number 1-9, mida grupis ei ole.\nNäiteks allpool olevas plokis on olemas kõik numbrid peale 7. Seepärast võib tühja ruutu kohe panna 7.';

  @override
  String get solvePuzzleLearning => 'Nüüd on sul võimalus kasutada uusi teadmisi, et lahendada ülesannet:';

  @override
  String get problemChangesLeft => 'Ruutude arv, mida tuleb muuta: ';

  @override
  String get problemIncorrectlyChangedCells => 'Valesti muudetud ruudud: ';

  @override
  String get problemSolved => 'Ülesanne on lahendatud õigesti!';

  @override
  String get findSolutionForCell => 'Leia märgitud ruudu väärtust';

  @override
  String get pencilMarksDescription1 => 'Pliiatsimärke kasutatakse selleks, et märkida numbrid, mis sobivad antud ruutu, kui ruudu väärtust ei ole teada. Sobivaid numbreid nimetatakse teisiti kandidaatideks.';

  @override
  String get pencilMarksDescription2 => 'Alguses lisatakse kõiki numbreid, mida võiks ruutu sisestada, mis ei rikuks reegleid. Pliiatsimärgid aitavad jälgida, ruutude võimalike väärtusi. Samuti põhinevad paljud Sudoku lahendamise tehnikad pliiatsimärkide kasutamisel.\nSelles rakenduses tuleb märkmete sisestamiseks lülitada sisse pliiatsimärkide režiimi. Seda saab teha vajutades pliiatsiga nupu.';

  @override
  String get pencilMarksProblem => 'Täida märgitud ruudu kandidaadid: ';

  @override
  String get lastPossibleNumberDescription1 => 'Üks lihtsamatest tehnikatest on ainus võimalik number, mis sobib mingisse ruutu. Ruutu sobib ainult üks number, sest kõik muud ei saa olla selles ruudus, kuna nad on juba olemas selle ruuduga seotud ühikutes (ruudu kaaslastes).';

  @override
  String get lastPossibleNumberDescription2 => 'Pildil võib näha punasega märgitud ruutu. Antud ruudus saab olla ainult number 7, sest kõik muud numbrid 1-9 on olemas selle ruuduga seotud ühikutes – numbrid 1, 3, 4 ja 5 on samas reas, numbrid 2, 6 (ja ka eelmainitud 3 ja 5) – samas plokis ning numbrid 8 ja 9 (ja 2) – samas veerus. Jääb ainult number 7.';
}
