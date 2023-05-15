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
  String get findSolutionForCellRemoveCandidates => 'Leia märgitud ruudu väärtust ja eemalda seejärel vajalikud kandidaadid';

  @override
  String get removeCellsCandidates => 'Rakenda märgitud ruutudel tehnikat ja eemalda vajalikke kandidaate';

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
  String get nakedTripleDescription2 => 'Pildil on näidatud üks plokk, kus on olemas alasti kolmikku sisaldavad ruudud. Kandidaadid nendes ruutudes on 2, 4, 5, nad on märgitud rohelisega. Kuna kolmes ruudus saavad olla ainult need kolm numbrit, võib väita, et nad asuvadki nendes ruutudes. Selle pärast võib need numbrid eemaldada plokki teiste ruutude kandidaatide hulgast. Antud näites asub alasti kolmik ruutudes, mis on seotud ainult ühe ühikuga – plokiga, seepärast ei saa näides eemaldada kandidaate väljaspool ploki. Tähelepanu väärib ka see asjaolu, et kõik numbrid ei pea kindlasti sisalduma kõigis kolmes ruudus – näites sisaldab üks ruutudest ainult numbreid 4 ja 5.';

  @override
  String get nakedTripleDescription3 => 'Sama põhimõtet võib rakendada ka suurema ruutude numbri puhul – peaasi, et võimalikke kandidaatide arv langeks kokku ruutude arvuga.';

  @override
  String get hiddenSingleDescription1 => 'Peidetud üksik - kui ühikus on olemas ruut pliiatsimärgiga, mida pole mingis teises ühiku ruudus, siis see number peab olema selles ruudus, kuna see on ainus võimalik koht.';

  @override
  String get hiddenSingleDescription2 => 'Pildil on rohelisega märgitud kandidaat, mis sisaldub alumises plokis ainult ühes ruudus. Teistes ploki ruutudes ei saa 9 olla, sest nendes veergudes on juba olemas 9. Kuna teisi variante ei ole, võib väita, et number 9 asub antud ruudus, seepärast võib sellest ruudust eemaldada teised kandidaadid ning panna lahenduseks 9.';

  @override
  String get hiddenPairDescription1 => 'Peidetud paar on sarnane peidetud üksikuga, kuid sellel juhul on numbrite ja ruutude arv 2. Kui ühikus leiduvad kaks ruutu, kus on 2 pliiatsimärki, mida ei ole üheski teises ruudus, siis võib nendes ruutudes eemaldada kõik muud kandidaadid, kuna nendes ruutudes on 2 antud numbrit.';

  @override
  String get hiddenPairDescription2 => 'Pildil on rohelisega märgitud kandidaadid 3 ja 5, mis sisalduvad antud plokis ainult kahes ruudus. Kuna need numbrid ei saa olla teistes ruutudes, võib väita, et nad sisalduvad antud ruutudes ja neist võib eemaldada kõik muud kandidaadid. Seejärel muutub peidetud paar alasti paariks ning seda võib kasutada edasi teiste kandidaatide eemaldamiseks.';

  @override
  String get hiddenTripleDescription1 => 'Peidetud kolmik – põhimõte sama nagu peidetud paari puhul, ainult numbrite ja ruutude arv on 3. Kui ühikus on olemas kolm ruutu kolme pliiatsimärkidega, mis on ainult nendes ruutudes, siis võib nendes ruutudes eemaldada muud kandidaadid.';

  @override
  String get hiddenTripleDescription2 => 'Pildil võib näha plokki, kus on kolmes ruudus märgitud rohelisega kandidaadid 2, 4 ja 9. Kasutades sama põhimõtet nagu peidetud paari puhul võib nendest ruutudest eemaldada kõik muud kandidaadid.';

  @override
  String get hiddenTripleDescription3 => 'Sama põhimõte töötab ka suurema ruutude arvuga, aga selliseid variante võib kohata harva.';

  @override
  String get pointingPairDescription1 => 'Osutava paari tehnikat saab kasutada, kui mingi pliitasimärk kohtub ühes plokis kaks korda ning mõlemad asukohad on samas reas või veerus. Kuna number peab esinema plokis 1 kord, asub see kindlasti ühes kahest antud ruudust. Seetõttu võib eemaldada see pliitasimärk teistest rea / veeru ruutudest.';

  @override
  String get pointingPairDescription2 => 'Pildil on punase ja rohelisega märgitud ühe veeru kandidaadid. Kuna number 5 peab sisalduma ülemises plokis ja seal on ainult kaks sobivat ruutu, asub ta ühes nendest ruutudest. Sellest võib järeldada, et number 5 ei saa olla punasega märgitud kandidaadi sisaldavas ruudus.';

  @override
  String get pointingTripleDescription1 => 'Osutava kolmiku tehnikal on sama põhimõte nagu osutaval paaril – kui mingi pliaatsimärk kohtub plokis kolm korda ning kõik ruudud asuvad ühes reas või veerus, siis võib see pliiatsimärk eemaldada teistest rea / veeru ruutudest. Osutava kolmiku näidet saab näha pildil.';

  @override
  String get xWingDescription1 => 'X-Wing tehnikat peetakse lihtsaimaks edasijõudnud tehnikate hulgas. ';

  @override
  String get xWingDescription2 => 'Selleks, et rakendada X-Wing tehnikat, on vaja leida kahes reas kaks ruutu (mõlemas reas), kus on olemas kandidaat, mida ei ole teistes ridade ruutudes. Ruudud mõlemas reas peavad olema samades veergudes. ';

  @override
  String get xWingDescription3 => 'Võib kujutada ette, et ruudud moodustavad ristküliku, milles ruudud on ristküliku tipud. Pildil on need ruudud märgitud oranžiga, vaadeldatavaks kandidaadiks on 9.';

  @override
  String get xWingDescription4 => 'Tehnika seisneb selles, et antud 4 ruudus peab kindlasti esinema kandidaat 2 korda – üks kord mõlemas reas ning samas asuvad need numbrid \'ristküliku\' vastastes tipudes ehk ristküliku diagonaalidel, sest muidu rikuksid nad Sudoku põhilist reeglit – numbrid ei saa ühikus korduda. Igal juhul asub mõlemas veerus number 9 ühes oranžiga märgitud ruutudest. Seepärast saab seda kandidaadi eemaldada teistest veergude ruutudest.';

  @override
  String get xWingDescription5 => 'Tehnikat saab kasutada ka teistpidi – kui kandidaadid on valitud kahes veerus ning kandidaatide eemaldamine toimub ridades. Sellise variatsiooni näide on toodud teisel pildil. Tulemusena eemaldatakse ridades 3 ja 9 punasega märgitud kandidaadid.';

  @override
  String get yWingDescription1 => 'Erinevalt X-Wing tehnikast põhineb Y-Wing tehnika kolmel ruudul ja kolmel kandidaadil, neljas ruut on selle tehnika puhul ruut, kus saab eemaldada kandidaadi. See on kõige lihtsam Y-Wingi variant, aga on olemas ka teisi. Tehnika arusaamiseks on mõistlik alustada lihstast variandist.';

  @override
  String get yWingDescription2 => 'Olgu A, B ja C kolm numbrit. Selleks, et saaks rakendada Y-Wing tehnikat, tuleb leida kolm ruudu, mis paiknevad nii, et moodustavad täisnurga (neid võib kujutada ette kui 3 ristküliku tipu). Kõigis kolmes ruudus peab olema täpselt kaks kandidaati. Täisnurga tipus olevas ruudus peavad olema kandidaadid AB, teistes ruutudes peavad olema kandidaadid AC ja BC (ehk number C ja üks numbritest A ja B). Üks võimalik ruutude paiknemise variant on toodud esimesel pildil.';

  @override
  String get yWingDescription3 => 'Kui ruudus AB on number A, siis ruudus AC on number C. Teiseslt poolt, kui ruudus AB on number B, siis ruudus BC on number C. Mõlemal juhul on number C kas ruudus AC või BC. Sellest võib järeldada, et ruudus, millega ristivad ruudud AC ja BC (ristküliku neljandas tipus) ei saa mingil juhul olla number C.';

  @override
  String get yWingDescription4 => 'Teisel pildil on toodud Y-Wing tehnika lihtsa variatsiooni näide. Selles näites eemaldatakse kandidaat 3 ruudust mis asub oranžiga värvitud veergude ristpunktis.';

  @override
  String get yWingDescription5 => 'Y-Wing tehnikal on olemas ka teised variatsioonid. Kõige lihstamas variatsioonis oli üks ruut seotud keskmise (AB) ruuduga rea järgi, teine ruut – veeru järgi, aga see ei pea kindlasti olema nii. On olemas selline variant, kus üks ruutudest on seotud kesmise ruuduga ploki järgi – nad asuvad ühes plokis. Sellist varianti saab näha kolmandal pildil.';

  @override
  String get yWingDescription6 => 'Sellises variatsioonis saab kandidaade eemaldada mitmes ruudus. Ülemises plokis saab punasega märgitud kandidaadi eemaldada, sest ta asub 1. veergu ja ülemise ploki ristimistsoonis. Teisisõnu on mõlemad Y-Wingi ruudud, kus saab olla 4, selle ruudu kaaslased ja üks neist sisaldab kindlasti numbri 4. Sama saab öelda ka alumises plokis asuvate punasega märgitud kandidaatide kohta. Seal ristivad alumine plokk ja 3. veerg.';

  @override
  String get swordfishDescription1 => 'Swordfish tehnika on põhimõtteliselt sarnane X-Wing tehnikaga, selle eesmärk on samuti kandidaatide eemaldamine. X-Wing tehnika puhul moodustasid ruudud 2x2 maatriksit, Swordfish tehnikas on see 3x3 maatriks.';

  @override
  String get swordfishDescription2 => 'Tehnika rakendamiseks tuleb leida 3 rida, kus mingi number saab olla kolmes ruudus ja need ruudud paiknevad samades veergudes. Ruutude paiknemise näidet saab näha esimesel pildil, ruudud on värvitud oranžiga.';

  @override
  String get swordfishDescription3 => 'Kuna antud number peab esinema igas reas ja kolmes reas on ainult kolm veergu, kus see number võib paikneda, võib öelda, et igas veerus asub see number ühes kolmest antud reast. Seepärast võib antud veergudes eemaldada antud number kõikide muude ruutude kandidaadide hulgast – joonisel on need ruudud märgitud punasega.';

  @override
  String get swordfishDescription4 => 'Swordfish tehnikat peetakse X-Wing tehnika laienduseks ning põhjust, miks Swordfish tehnika töötab, saab seletada X-Wing abil. Selleks võib vaadelda näiteks esimesel pildil toodud 3x3 maatriksi alumist rida – seal võib antud number paikneda kolmes ruudus. Kõik paiknemise variandid on näidatud teisel pildil (numbri paiknemise asukoht on märgitud rohelisega).';

  @override
  String get swordfishDescription5 => 'Igas variandis eemaldab pandud number mõned võimalikud asukohad maatriksist ja teistest ruutudest – need on joonisel märgitud punasega. Samas jääb igas variandis maatriksis 4 ruutu (värvitud oranžiga), mis moodustavad X-Wing tehnika jaoks nõutava positsiooni.';

  @override
  String get swordfishDescription6 => 'X-Wing tehnika abil saab eemaldada veel hulk kandidaate – joonisel on nad märgitud sinisega. Kõigis kolmes variandis olid eemaldatud kandiaadid kõikidest ruutudest, mis on esimesel pildil värvitud punasega. Sama olukord tekib ka teistes variantides, kui proovida panna number ülemisse või keskmisse ritta – osa kandidaate on eemaldatud pandud numbri poolt ja kõik muud – X-Wing tehnika abil.';

  @override
  String get swordfishDescription7 => 'Swordfish tehnika töötab ka vastupidi, kui on olemas kolm veergu kolme võimalike numbri asukohaga. Sel juhul eemaldatakse kandidaadid ridadest. Sellise variatsiooni näide on toodud kolmandal pildil. ';

  @override
  String get swordfishDescription8 => 'Samuti võib märgata, et kandidaat 4 ei esine selles näides igas veerus täpselt 3 korda. Tegelikult on Swordfish tehnika rakendamiseks vaja, et kandidaadid esineksid igas veerus (või reas, nagu eelmistel joonistel) vähemalt 2 korda. See ei muuda tehnika põhimõtet ja oranžiga värvitud ruudud on ikka ainsad võimalikud kohad nendes ridades (veergudes), lihtsalt võimalike paiknemise kombinatsioonide arv on väiksem. Sellist Swordfish tehnika variandi nimetatakse 2-3-2 Swordfish – kandidaatide arvu järgi veergudes (ridades). Variatsiooni, mis oli enne, kui kandidaadid esinesid kõikides ridades 3 korda ja moodustasid tervet 3x3 maatriksit, nimetatakse 3-3-3 Swordfish.';
}
