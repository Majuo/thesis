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
  String get textSizeOption => 'Размер текста';

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
  String get techniquePurpose => 'Tehnika eesmärk';

  @override
  String get techniquePurposeCellValue => 'ruudu väärtuse leidmine';

  @override
  String get techniquePurposeRemoveCandidates => 'kandidaatide eemaldamine ruutudest';

  @override
  String get techniquePurposeCellValueAndRemoveCandidates => 'ruudu väärtuse leidmine ja kandidaatide eemaldamine ruutudest';

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

  @override
  String get lastRemainingCellDescription1 => 'Mõnikord juhtub nii, et plokis, reas või veerus on mitu vaba kohta, kuid mingi numbri saab panna ainult ühte ruutu, kuna ta ei saa olla üheski teises ruudus.';

  @override
  String get lastRemainingCellDescription2 => 'Pildil võib näha, et punasega märgitud veerus on puudu mitu numbrit, sealhulgas number 6. Veerus on 4 tühja kohta, kuid 6 saab panna ainult ühte nendest, sest kõikides teistes kohtades rikub see Sudoku reegleid. Seetõttu asub number 6 kuuendas reas.';

  @override
  String get lastRemainingCellDescription3 => 'Sellel tehnikal on olemas variatsioonid. Allpool oleval pidil on üks veerg märgitud punase värviga. Selles veerus puudub number 4 ning selle jaoks on ainult üks sobiv koht – 5. reas. Vabad ruudud 2. ja 9. reas ei sobi, kuna nendes plokkides (värvitud oranžiga) on juba olemas number 4.';

  @override
  String get lastRemainingCellDescription4 => 'Sama olukorda võib vaadelda teisest küljest – pildil on punasega märgitud plokk. Selles plokis ei ole 4 ja seda saab panna ainult ühte ruutu, sest muude vabade ruutude veergudes (värvitud oranžiga) on juba olemas number 4 (värvitud punasega).';

  @override
  String get nakedSingleDescription1 => 'Alates sellest tehnikast tuleb tehnikate rakendamiseks kasutada pliiatsimärke, et märkida ruutude kandiaate.';

  @override
  String get nakedSingleDescription2 => 'Alasti kandidaadid (neid nimetatakse ka paljasteks ja ilmseteks) hõlmavad kohe mitu tehnikat, millel on sama põhimõte ning eesmärk – eemaldada ruutudest võimalikud kandidaadid.';

  @override
  String get nakedSingleDescription3 => 'Alasti üksik – kui ruudus on täidetud kandidaadid ning selles ruudus on ainult üks kandidaat, siis ta ongi selle ruudu väärtus. Seda kandidaati saab eemaldada teistest ruutudest samas reas, veerus ja plokis.';

  @override
  String get nakedSingleDescription4 => 'Esimesel pildil võib näha, et sinisega märgitud ruudus on ainult üks kandidaat. See tähendab, et teised numbrid ruutu ei sobi, sest see rikuks reegleid.';

  @override
  String get nakedSingleDescription5 => 'Kuna number 2 on ainus variant, võib seda panna kui ruudu lahendus ning eemaldada 2 märgitud ruudu kaaslaste kandidaatide hulgast – need on märgitud teisel pildil pildil punasega.';

  @override
  String get nakedPairDescription1 => 'Alasti paar – kui on olemas kaks ruutu, mis asuvad ühes veerus, reas või plokis ning nendel ruutudel on ainult kaks võimalikku kandidaati, siis need numbrid sisalduvad antud ruutudes ning neid võib eemaldada teiste ruutude kandidaatide hulgast.';

  @override
  String get nakedPairDescription2 => 'Esimesel pildil on märgitud punasega kaks ruutu – nendel on kaks võimalikku kandidaati, 1 ja 2. Ruudud asuvad samas plokis ja samas reas, seepärast saab rakendada alasti paari tehnikat. Võib väita, et numbrid üks ja kaks sisalduvad märgitud ruutudes, kuna nendes ei saa olla ükski teine number.';

  @override
  String get nakedPairDescription3 => 'Kuna numbrid ei saa korduda ühikutes, võimaldab see eemaldada mõned kandidaadid, mis on märgitud punasega teisel pildil. Kuna alasti paari sisaldavad ruudud asuvad ühes plokis, saab eemaldada kõikides muudes ploki ruutudes kandidaadid 1 ja 2. Sama võib teha 6. rea ruutudega, sest alasti paariga ruudud asuvad samas reas.';

  @override
  String get nakedTripleDescription1 => 'Alasti kolmik – põhimõte on sama kui paari juhul – kui kolm seotud ruutu sisaldavad ainult kolm võimalikku kandiaati, siis need numbrid asuvad antud ruutudes ning ei saa olla ruutude kaaslastes – neid võib eemaldada kaaslaste kandidaatide hulgast.';

  @override
  String get nakedTripleDescription2 => 'Kolmandal pildil on näidatud üks plokk, kus on olemas alasti kolmikku sisaldavad ruudud. Kandidaadid nendes ruutudes on 2, 4, 5, nad on märgitud rohelisega. Kuna kolmes ruudus saavad olla ainult need kolm numbrit, võib väita, et nad asuvadki nendes ruutudes. Selle pärast võib need numbrid eemaldada plokki teiste ruutude kandidaatide hulgast. Antud näides asub alasti kolmik ruutudes, mis on seotud ainult ühe ühikuga – plokiga, seepärast ei saa näides eemaldada kandidaate väljaspool ploki. Tähelepanu väärib ka see asjaolu, et kõik numbrid ei pea kindlasti sisalduma kõigis kolmes ruudus – näides sisaldab üks ruutudest ainult numbreid 4 ja 5.';

  @override
  String get nakedTripleDescription3 => 'Sama põhimõtet võib rakendada ka suurema ruutude numbri puhul – peaasi, et võimalikke kandidaatide arv langeks kokku ruutude arvuga.';

  @override
  String get hiddenSingleDescription1 => 'Peidetud üksik - kui ühikus on olemas ruut pliiatsimärgiga, mida pole mingis teises ühiku ruudus, siis see number peab olema selles ruudus, kuna see on ainus võimalik koht.';

  @override
  String get hiddenSingleDescription2 => 'Pildil on rohelisega märgitud kandidaat, mis sisaldub alumises plokis ainult ühes ruudus. Teistes ploki ruutudes ei saa 9 olla, sest nendes veergudes on juba olemas 9. Kuna teisi variante ei ole, võib väita, et number 9 asub antud ruudus, seepärast võib sellest ruudust eemaldada teised kandidaadid ning panna lahenduseks 9.';

  @override
  String get hiddenPairDescription1 => 'Peidetud paar on sarnane peidetud üksikuga, kuid sellel juhul on numbrite ja ruutude arv 2. Kui ühikus leiduvad kaks ruutu, kus on 2 pliiatsimärki, mida ei ole üheski teises ruudus, siis võib nendes ruutudes eemaldada kõik muud kandidaadid, kuna nendes ruutudes on 2 antud numbrit.';

  @override
  String get hiddenPairDescription2 => 'Teisel pildil on rohelisega märgitud kandidaadid 3 ja 5, mis sisalduvad antud plokis ainult kahes ruudus. Kuna need numbrid ei saa olla teistes ruutudes, võib väita, et nad sisalduvad antud ruutudes ja neist võib eemaldada kõik muud kandidaadid. Seejärel muutub peidetud paar alasti paariks ning seda võib kasutada edasi teiste kandidaatide eemaldamiseks.';

  @override
  String get hiddenTripleDescription1 => 'Peidetud kolmik – põhimõte sama nagu peidetud paari puhul, ainult numbrite ja ruutude arv on 3. Kui ühikus on olemas kolm ruutu kolme pliiatsimärkidega, mis on ainult nendes ruutudes, siis võib nendes ruutudes eemaldada muud kandidaadid.';

  @override
  String get hiddenTripleDescription2 => 'Pildil võib näha plokki, kus on kolmes ruudus märgitud rohelisega kandidaadid 2, 4 ja 9. Kasutades sama põhimõtet nagu peidetud paari puhul võib nendest ruutudest eemaldada kõik muud kandidaadid.';

  @override
  String get hiddenTripleDescription3 => 'Sama põhimõte töötab ka suurema ruutude arvuga, aga selliseid variante võib kohata harva.';
}
