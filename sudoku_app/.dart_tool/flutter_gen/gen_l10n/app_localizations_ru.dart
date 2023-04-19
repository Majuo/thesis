import 'app_localizations.dart';

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get colorScheme => 'Цветовая схема';

  @override
  String get darkTheme => 'Тёмная';

  @override
  String get lightTheme => 'Светлая';

  @override
  String get highContrastTheme => 'Высококонтрастная';

  @override
  String get language => 'Язык';

  @override
  String get sudokuRules => 'Правила Судоку';

  @override
  String get lastRemainingCell => 'Единственная возможная клетка';

  @override
  String get lastPossibleNumber => 'Единственное возможное число';

  @override
  String get hintCanNotBeSolved => 'Данное Судоку невозможно решить с помощью известных техник решения';

  @override
  String get hintCanBeSolvedUsingSingleCell => 'Для выделенной клетки может быть применена техника: ';

  @override
  String get hintCanBeSolvedUsingMultipleCells => 'Для выделенных клеток может быть применена техника: ';

  @override
  String get nakedSingle => 'Голые единицы';

  @override
  String get nakedPair => 'Голые пары';

  @override
  String get nakedTriple => 'Голые тройки';

  @override
  String get hiddenSingle => 'Скрытые единицы';

  @override
  String get hiddenPair => 'Скрытые пары';

  @override
  String get hiddenTriple => 'Скрытые тройки';

  @override
  String get pointingPair => 'Указывающие пары';

  @override
  String get pointingTriple => 'Указывающие тройки';

  @override
  String get xwing => 'X-крыло';

  @override
  String get ywing => 'Y-крыло';

  @override
  String get swordfish => 'Рыба-меч';

  @override
  String get fillCandidates => 'Заполнить заметки';

  @override
  String get newGame => 'Новая игра';

  @override
  String get easy => 'Легкий';

  @override
  String get medium => 'Средний';

  @override
  String get hard => 'Сложный';

  @override
  String get veryHard => 'Очень сложный';

  @override
  String get menuItemGame => 'Игра';

  @override
  String get menuItemLearning => 'Обучение';

  @override
  String get menuItemSettings => 'Настройки';

  @override
  String get reset => 'Сбросить';

  @override
  String get navigationMenuOption => 'Меню навигации';

  @override
  String get adaptive => 'Адаптивное';

  @override
  String get bottomNavigationBar => 'Снизу';

  @override
  String get sidebar => 'Сбоку';

  @override
  String get hint => 'Подсказка';

  @override
  String get pencilMarks => 'Заметки';

  @override
  String get basics => 'Основы';

  @override
  String get beginnerTechniques => 'Начальные техники';

  @override
  String get intermediateTechniques => 'Более сложные техники';

  @override
  String get advancedTechniques => 'Продвинутые техники';

  @override
  String get welcome => 'Добро пожаловать!';

  @override
  String get seeBasics => 'Хочешь сначала посмотреть правила Судоку?';

  @override
  String get yes => 'Да';

  @override
  String get no => 'Спасибо, я знаю правила';

  @override
  String get congratulations => 'Поздравляем';

  @override
  String get youWon => 'Судоку решено правильно';

  @override
  String get ok => 'Хорошо';

  @override
  String get sudokuRulesDescription1 => 'Sudoku on loogikamäng, mis kujutab endast 9x9 ruudustikku, mis on jagatud omakorda 3x3 regioonideks või plokideks, kus mõned ruudud on täidetud numbritega.';

  @override
  String get sudokuRulesDescription2 => 'Sudoku lahendamiseks tuleb täita vabad ruudud numbritega.';

  @override
  String get sudokuRulesDescription3 => 'Sudoku peetakse korrektselt lahendatuks, kui kõik ruudud on täidetud vastavalt reeglitele. \nReeglid on järgmised: \n - kõik read, veerud ja plokid peavad sisaldama numbreid 1-st 9-ni \n - numbrid ei saa korduda üheski reas, veerus ja plokis.';

  @override
  String get sudokuRulesDescription4 => 'Ridu, veerge ja plokke saab nimetada ühe sõnaga - grupp. \nKasutades neid reegleid on võimalik leida mõnede ruutude väärtusi. Kui mingis grupis on jäänud ainult üks tühi ruut, siis võib sinna kohe panna ainus number 1-9, mida grupis ei ole.\nNäiteks allpool olevas plokis on olemas kõik numbrid peale 7. Seepärast võib tühja ruutu kohe panna 7.';

  @override
  String get solvePuzzleLearning => 'Попробуй решить задачу с помощью полученных знаний:';

  @override
  String get problemChangesLeft => 'Число клеток, которые нужно изменить: ';

  @override
  String get problemIncorrectlyChangedCells => 'Неправильно изменённых клеток: ';

  @override
  String get problemSolved => 'Задача решена правильно!';

  @override
  String get findSolutionForCell => 'Leia märgitud ruudu väärtust';
}
