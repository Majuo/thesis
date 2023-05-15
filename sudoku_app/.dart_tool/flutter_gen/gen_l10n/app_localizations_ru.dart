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
  String get techniquePurpose => 'Цель техники';

  @override
  String get techniquePurposeCellValue => 'нахождение значения клетки';

  @override
  String get techniquePurposeRemoveCandidates => 'удаление кандидатов из клеток';

  @override
  String get techniquePurposeCellValueAndRemoveCandidates => 'нахождение значения клетки и удаление кандидатов из клеток';

  @override
  String get sudokuRulesDescription1 => 'Судоку — это логическая игра, состоящая из сетки 9x9, разделенной, в свою очередь, на области или блоки 3x3, где некоторые клетки заполнены числами.';

  @override
  String get sudokuRulesDescription2 => 'Чтобы решить Судоку, надо заполнить пустые клетки цифрами.';

  @override
  String get sudokuRulesDescription3 => 'Судоку считается правильно решенным, если все клетки заполнены по правилам. \nПравила следующие: \n - все строки, столбцы и блоки должны содержать числа от 1 до 9 \n - числа не могут повторяться ни в одной строке, столбце и блоке.';

  @override
  String get sudokuRulesDescription4 => 'Строки, столбцы и блоки можно называть одним словом - группа. \nИспользуя эти правила, можно найти значения некоторых клеток. Если в группе остался только одна пустая клетка, то туда можно сразу поставить единственное число 1-9, которого нет в группе.\nНапример, в блоке ниже есть все числа, кроме 7. Поэтому в пустую клетку можно сразу поставить 7.';

  @override
  String get solvePuzzleLearning => 'Попробуй решить задачу с помощью полученных знаний:';

  @override
  String get problemChangesLeft => 'Число клеток, которые нужно изменить: ';

  @override
  String get problemIncorrectlyChangedCells => 'Неправильно изменённых клеток: ';

  @override
  String get problemSolved => 'Задача решена правильно!';

  @override
  String get findSolutionForCell => 'Найди значение отмеченной клетки';

  @override
  String get findSolutionForCellRemoveCandidates => 'Найди значение отмеченной клетки и убери нужные кандидаты';

  @override
  String get removeCellsCandidates => 'Примени технику и убери нужные кандидаты';

  @override
  String get pencilMarksDescription1 => 'Заметки используются для того, что отмечать числа, которые подходят в клетку, когда значение клетки еще неизвестно. Подходящие числа также известны как кандидаты.';

  @override
  String get pencilMarksDescription2 => 'В начале вносятся все числа, которые можно поставить в клетку, не нарушая правила. Заметки помогают отслеживать возможные значения клеток. Кроме того, многие техники решения Судоку основаны на использовании заметок.\nВ этом приложении, чтобы вводить заметки, нужно включить режим заметок. Это можно сделать, нажав кнопку с карандашом.';

  @override
  String get pencilMarksProblem => 'Заполни кандидаты в отмеченной клетке: ';

  @override
  String get lastPossibleNumberDescription1 => 'Одна из самых простых техник - это единственное возможное число, которое подходит в клетку. В клетку подходит только одно число, потому что все остальные числа не могут быть в этой клетке, так как они уже есть в группах, связанных с этой клеткой (все клетки, связанные с данной клеткой какими-либо группами, также можно назвать клетками-компаньонами данной клетки)';

  @override
  String get lastPossibleNumberDescription2 => 'На картинке можно увидеть клетку, отмеченную красным. Эта клетка может содержать только число 7, потому что все остальные числа 1-9 уже есть в группах, связанных с этой клеткой - числа 1, 3, 4 и 5 находятся в том же ряду, числа 2, 6 (а также вышеупомянутые 3 и 5) - в том же блоке, а числа 8 и 9 (и 2) - в том же столбце. Остается только число 7.';

  @override
  String get lastRemainingCellDescription1 => 'Иногда бывает так, что в блоке, строке или столбце есть несколько свободных мест, но число можно поставить только в одну клетку, потому что оно не может быть ни в одной другой клетке.';

  @override
  String get lastRemainingCellDescription2 => 'На картинке видно, что в столбце, отмеченном красным, отсутствуют несколько чисел, в том числе 6. В столбце 4 пустых места, но 6 можно разместить только в одном из них, потому что во всех в других местах она будет нарушать правила Судоку. Следовательно, число 6 находится в шестом ряду.';

  @override
  String get lastRemainingCellDescription3 => 'Существуют вариации этой техники. На картинке ниже один столбец выделен красным цветом. В этом столбце отсутствует цифра 4, и для нее есть только одно подходящее место — в пятом ряду. Свободные клетки в рядах 2 и 9 не подходят, потому что в этих блоках уже есть число 4 (выделено оранжевым цветом).';

  @override
  String get lastRemainingCellDescription4 => 'На ту же ситуацию можно посмотреть и с другой стороны — на картинке блок отмечен красным. В этом блоке нет 4, и его можно разместить только в одной клетке, потому что столбцы других свободных клеток (оранжевого цвета) уже содержат число 4 (отмечены красным).';

  @override
  String get nakedSingleDescription1 => 'Начиная с этой техники, для применения техник необходимо использовать заметки, чтобы отмечать кандидаты клеток.';

  @override
  String get nakedSingleDescription2 => 'Голые кандидаты (также могут называться очевидными) включают в себя сразу несколько техник с одними принципом и целью - удаление кандидатов из клеток.';

  @override
  String get nakedSingleDescription3 => 'Голые единицы - если клетка заполнен кандидатами и в этой клетке есть только один кандидат, то этот кандидат является значением данной клетки. Этот кандидат может быть удален из других клеток в той же строке, столбце и блоке.';

  @override
  String get nakedSingleDescription4 => 'На первой картинке можно увидеть, что в клетке, отмеченной синим, есть только один кандидат. Это означает, что другие числа не подходят в клетку, потому что это нарушило бы правила.';

  @override
  String get nakedSingleDescription5 => 'Поскольку число 2 является единственным вариантом, её можно поставить как значение клетки и удалить 2 из кандидатов клеток-компаньонов - они отмечены красным на второй картинке.';

  @override
  String get nakedPairDescription1 => 'Голая пара - если есть две клетки, которые находятся в одном столбце, строке или блоке, и у этих клеток есть только два возможных кандидата, то эти числа точно содержатся в данных клетках и ​​могут быть удалены из кандидатов других клеток.';

  @override
  String get nakedPairDescription2 => 'На первой кратинке две клетки отмечены красным — у них есть два возможных кандидата, 1 и 2. Клетки находятся в одном блоке и в одной строке, поэтому можно применить технику голых пар. Можно точно сказать, что числа 1 и 2 содержатся в отмеченных клетках, так как они не могут содержать никаких других чисел.';

  @override
  String get nakedPairDescription3 => 'Поскольку числа не могут повторяться в группах, это позволяет удалить некоторые кандидаты, которые отмечены красным на второй картинке. Поскольку клетки, содержащие голую пару, находятся в одном блоке, кандидаты 1 и 2 могут быть удалены во всех других клетках блока. То же самое можно сделать для с клетками в 6 ряду, потому что клетки с голой парой находятся так же в одном ряду.';

  @override
  String get nakedTripleDescription1 => 'Голая тройка - принцип такой же, как и в случае с парами - если три клетки в группе содержат только три возможных кандидата, то эти числа точно находятся в данных клетках и ​​не могут быть в клетках-компаньонах данных клеток, поэтому они могут быть удалены из клеток-компаньонов.';

  @override
  String get nakedTripleDescription2 => 'На картинке показан блок, где есть клетки, содержащие голые тройки. Кандидаты в этих клетках - 2, 4, 5, они отмечены зеленым цветом. Поскольку три клетки могут содержать только эти три числа, можно утверждать что эти числа точно находятся в данных клетках. Поэтому эти числа могут быть удалены из кандидатов других клеток в блоке. В данном примере голая тройка находится в клетках, которые связаны только с одной группой - блоком, поэтому в примере можно удалять кандидаты только внутри блока. Также стоит отметить, что не все числа должны обязательно содержаться во всех трех клетках - в примере одна из клеток содержит только числа 4 и 5.';

  @override
  String get nakedTripleDescription3 => 'Тот же принцип можно применить и к большему количеству клеток - главное, чтобы количество возможных кандидатов совпадало с количеством клеток.';

  @override
  String get hiddenSingleDescription1 => 'Скрытые единицы — если в группе есть клетка с кандидатом, которого нет ни в одной другой клетке группы, то число должно быть в этой клетке, так как это единственно возможное место.';

  @override
  String get hiddenSingleDescription2 => 'На картинке показан кандидат, отмеченный зеленым, который содержится только в одной клетке в нижнем блоке. Другие клетки в блоке не могут содержать 9, потому что в этих столбцах уже есть 9. Так как нет других вариантов, можно утверждать, что число 9 находится в данной клетке, поэтому из этой клетки можно убрать другие кандидаты и поставить туда 9.';

  @override
  String get hiddenPairDescription1 => 'Скрытая пара похожа на скрытые единицы, но в данном случае количество чисел и клеток равно 2. Если в блоке есть две клетки с двумя кандидатами, которых нет ни в одной другой клетке, то все остальные кандидаты в этих клетках можно убрать, потому что в этих клетках находятся 2 этих числа.';

  @override
  String get hiddenPairDescription2 => 'На картинке показаны кандидаты 3 и 5, отмеченные зеленым цветом, которые содержатся только в двух клетках в данном блоке. Поскольку эти числа не могут быть в других клетках, можно утверждать, что они содержатся именно в этих клетках и все остальные кандидаты можно из этих клеток убрать. Затем скрытая пара меняется на голую пару и может дальше использоваться для удаления других кандидатов.';

  @override
  String get hiddenTripleDescription1 => 'Скрытая тройка - принцип такой же, как и со скрытой парой, только количество кандидатов и клеток равно 3. Если в блоке есть три клетки с тремя кандидатами, которые находятся только в этих клетках, то другие кандидаты можно в этих клетках убрать.';

  @override
  String get hiddenTripleDescription2 => 'На картинке показан блок с кандидатами 2, 4 и 9, отмеченными зеленым цветом в трех клетках. Используя тот же принцип, что и для скрытой пары, можно убрать все остальные кандидаты из этих клеток.';

  @override
  String get hiddenTripleDescription3 => 'Тот же принцип работает и с большим количеством клеток, но такие варианты встречаются редко.';

  @override
  String get pointingPairDescription1 => 'Технику указывающих пар можно использовать, если кандидат встречается дважды в одном блоке и обе клетки находятся в одной строке или столбце. Поскольку число должно содержаться в этом блоке, оно должно находиться в одном из двух заданных клеток. Следовательно, этот кандидат может быть удален из других клеток в строке/столбце.';

  @override
  String get pointingPairDescription2 => 'На картинке показаны кандидаты в одном из столбцов, отмеченные красным и зеленым цветами. Поскольку число 5 должно содержаться в верхнем блоке, а подходящих клетки всего две, оно находится в одной из этих клеток. Из этого можно сделать вывод, что число 5 не может быть в других клетках столбца, поэтому её можно убрать из клетки в нижнем блоке.';

  @override
  String get pointingTripleDescription1 => 'Техника указывающих троек имеет тот же принцип, что и указывающие пары - если кандидат встречается в блоке три раза и все клетки с ним находятся в одной строке или столбце, то это число можно удалить из других клеток в группе. Пример указывающей тройки можно увидеть на картинке.';

  @override
  String get xWingDescription1 => 'Техника X-крыло считается самой простой среди продвинутых техник. ';

  @override
  String get xWingDescription2 => 'Чтобы применить технику X-крыло, необходимо найти две клетки в двух рядах (в каждом ряду), где есть кандидат, которого нет в других клетках этих рядов. Клетки в обоих рядах должны также находиться в одних и тех же столбцах.';

  @override
  String get xWingDescription3 => 'Можно представить, что клетки образуют прямоугольник, в котором клетки являются вершинами прямоугольника. На картинке эти клетки отмечены оранжевым цветом, рассматриваемый кандидат - 9.';

  @override
  String get xWingDescription4 => 'Техника заключается в том, что кандидат должен появиться 2 раза в заданных 4-х клетках - по одному разу в каждом ряду, и при этом эти числа расположены в противоположных вершинах \'прямоугольника\', т.е. на диагоналях прямоугольника, так как в противном случае они нарушили бы основное правило судоку - числа не могут повторяться в группе. В любом случае число 9 в обоих столбцах расположено в одной из клеток, отмеченных оранжевым цветом. Следовательно, этот кандидат может быть удален из других клеток в столбцах.';

  @override
  String get xWingDescription5 => 'Технику можно использовать и наоборот - если кандидаты выбираются в двух столбцах, а удаляются в рядах. Пример такой вариации показан на второй картинке. В результате кандидаты, отмеченные красным в рядах 3 и 9, удаляются.';

  @override
  String get yWingDescription1 => 'В отличие от техники X-крыла, техника Y-крыло основана на трех клетках и ​​трех кандидатах, четвертая клетка в этой технике — это клетка, из которой можно удалить кандидата. Это самый простой вариант Y-крыла, но есть и другие. Для понимания техники разумно начать с простого варианта.';

  @override
  String get yWingDescription2 => 'Пусть A, B и C будут тремя числами. Чтобы иметь возможность применить технику Y-крыла, нужно найти три клетки, образующих прямой угол (их можно представить как 3 вершины прямоугольника). Во всех трех клетках должно быть ровно два кандидата. Клетка, находящаяся в вершине угла, должна содержать кандидаты AB, остальные клетки должны содержать кандидаты AC и BC (то есть число C и одно из чисел А и В). Один из возможных вариантов размещения клеток показан на первом рисунке.';

  @override
  String get yWingDescription3 => 'Если число A находится в клетке AB, то число C находится в клетке AC. С другой стороны, если число B находится в клетке AB, то число C находится в клетке BC. В обоих случаях число С находится либо в клетке АС, либо в клетке ВС. Отсюда можно сделать вывод, что клетка, пересекающаяся с клетками АС и ВС (в четвертой вершине прямоугольника), ни при каких условиях не может содержать число С.';

  @override
  String get yWingDescription4 => 'На второй картинке показан пример простого варианта техники Y-крыла. В этом примере кандидат 3 удаляется из клетки, расположенной на пересечении оранжевого ряда и оранжевого столбца.';

  @override
  String get yWingDescription5 => 'Есть и другие вариации техники Y-крыла. В самой простой вариации один клетка соединена со средней (AB) клеткой по ряду, другая клетка - по столбцу, но это не обязательно должно быть так. Есть вариант, когда одна из клеток соединяется со средней клеткой по блоку - они расположены в одном блоке. Такой вариант можно увидеть на третьей картинке.';

  @override
  String get yWingDescription6 => 'В этом варианте кандидаты могут быть удалены в нескольких клетках. Кандидат, отмеченный красным в верхнем блоке, может быть удален, поскольку он находится в зоне пересечения столбца 1 и верхнего блока. Другими словами, обе клетки Y-крыла, где может быть 4, являются клетками-компаньонами этой клетки и одна из них обязательно содержит число 4. То же самое можно сказать и о кандидатах, отмеченных красным в нижнем блоке. Здесь пересекаются нижний блок и 3-й столбец.';

  @override
  String get swordfishDescription1 => 'Техника Рыба-меч в основном аналогична технике X-крыла, ее цель также состоит в том, чтобы убирать кандидаты. В технике X-крыла клетки образовывали матрицу 2x2, в технике Рыба-меч они образовывают матрицу 3x3.';

  @override
  String get swordfishDescription2 => 'Чтобы применить технику, нужно найти 3 ряда, где число может быть в трех клетках и все ​​эти клетки расположены в трех столбцах. Вы можете увидеть пример расположения клеток на первой картинке, клетки окрашены в оранжевый цвет.';

  @override
  String get swordfishDescription3 => 'Поскольку данное число должно присутствовать в каждом ряду, а в трех рядах есть только три столбца, где может находиться это число, можно сказать, что в каждом столбце это число находится в одном из трех заданных рядов. Поэтому в данных столбцах это число может быть удалено из всех остальных клеток - эти клетки отмечены на рисунке красным цветом.';

  @override
  String get swordfishDescription4 => 'Техника Рыба-меч считается расширением техники X-крыла, и причину, по которой работает техника Рыба-меч, можно объяснить с помощью X-крыла. Например, можно посмотреть на нижний ряд матрицы 3х3, показанной на первой картинке - там заданное число может располагаться в трех клетках, варианты показаны на второй картинке (расположение числа отмечено зеленым цветом).';

  @override
  String get swordfishDescription5 => 'В каждом варианте введенное число удаляет некоторые возможные позиции из матрицы и других клеток - они отмечены на рисунке красным цветом. Однако в каждом варианте в матрице остается 4 клетки (окрашены оранжевым цветом), которые формируют нужную позицию для техники X-крыла.';

  @override
  String get swordfishDescription6 => 'Еще несколько кандидатов можно удалить с помощью техники X-крыла — они отмечены синим цветом на рисунке. Во всех трех вариантах были удалены кандидаты из всех клеток, окрашенных в красный цвет на первой картинке. Такая же ситуация возникает и в других вариантах, если попытаться поставить число в верхний или средний ряд - некоторые кандидаты удаляются поставленным числом, а все остальные - с помощью техники X-крыла.';

  @override
  String get swordfishDescription7 => 'Техника Рыбы-меч работает и наоборот, когда есть три столбца с тремя возможными позициями чисел. В этом случае кандидаты удаляются из рядов. Пример такой вариации показан на третьей картинке.';

  @override
  String get swordfishDescription8 => 'Также можно заметить, что в этом примере кандидат 4 не появляется ровно 3 раза в каждом столбце. На самом деле, применение техники Рыба-меч требует, чтобы кандидаты появлялись как минимум 2 раза в каждом столбце (или ряду, как на предыдущей картинке). Это не меняет принципа техники, и клетки, окрашенные в оранжевый цвет, по-прежнему являются единственно возможными местами в этих рядах (столбцах), просто количество возможных комбинаций размещения меньше. Этот вариант техники Рыба-меч называется Рыба-меч 2-3-2 — по количеству кандидатов в столбцах (рядах). Предыдущий вариант, где кандидаты появлялись 3 раза во всех рядах и образовывали полную матрицу 3x3, называется Рыба-меч 3-3-3.';
}
