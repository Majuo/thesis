import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../game_internals/sudoku_problem.dart';
import '../../pages/technique_page.dart';
import '../sudoku_problem_widget.dart';

class HiddenTripleDescription extends StatefulWidget {
  const HiddenTripleDescription({super.key});
  static const String assetFolderPath = "lib/assets/techniques/hidden_triple/";

  @override
  State<HiddenTripleDescription> createState() => _HiddenTripleDescriptionState();
}

class _HiddenTripleDescriptionState extends State<HiddenTripleDescription> {
  final Future<double> img1Future = TechniquePage.getImageHeightAsync(Image.asset("${HiddenTripleDescription.assetFolderPath}hidden_triple_1.png"));

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TechniquePage.getTechniquePageSection(
          [
            TechniquePage.getTechniquePageText("${AppLocalizations.of(context).techniquePurpose} : ${AppLocalizations.of(context).techniquePurposeRemoveCandidates}"),
          ],
          context
        ),
        TechniquePage.getTechniquePageSection(
          [
            TechniquePage.getTechniquePageText(AppLocalizations.of(context).hiddenTripleDescription1),
            TechniquePage.getTechniquePageText(AppLocalizations.of(context).hiddenTripleDescription2),
            TechniquePage.getTechniquePageImage(img1Future, context, Image.asset("${HiddenTripleDescription.assetFolderPath}hidden_triple_1.png")),
            TechniquePage.getTechniquePageText(AppLocalizations.of(context).hiddenTripleDescription3),
          ],
          context
        ),
        TechniquePage.getTechniquePageText(AppLocalizations.of(context).removeCellsCandidates),
        SudokuProblemWidget(problem: getLastPossibleNumberProblem())
      ]
    );
  }

  SudokuProblem getLastPossibleNumberProblem() {
    var problem = SudokuProblem.getSudokuProblem(
    [
      [[0, 5, 9], [3], [4], [8], [2], [7], [1], [0, 5, 9], [6]],
      [[0, 5, 9], [8], [7], [4], [1], [6], [0, 5, 9], [2], [3]],
      [[6], [1], [2], [5], [3], [9], [8], [7], [4]],
      [[0, 1, 3, 8], [0, 5, 7], [0, 1, 3, 6], [2], [0, 5, 9], [4], [0, 5, 7, 9], [0, 3, 6], [0, 1, 8]],
      [[0, 1, 4, 7, 8], [0, 4, 5, 7], [9], [3], [6], [0, 1, 8], [2], [0, 1, 5], [0, 1, 5, 7, 8]],
      [[0, 1, 3, 8], [2], [0, 1, 3, 6], [7], [0, 5, 9], [0, 1, 8], [4], [0, 3, 6], [0, 5, 9]],
      [[0, 1, 4, 7], [0, 4, 7, 9], [8], [6], [0, 4, 7], [5], [3], [0, 1, 9], [2]],
      [[0, 1, 3, 7], [6], [0, 1, 3], [9], [8], [2], [0, 5, 7], [4], [0, 1, 5, 7]],
      [[2], [0, 4, 7, 9], [5], [1], [0, 4, 7], [3], [6], [8], [0, 7, 9]],
    ],
    [
      [[0, 5, 9], [3], [4], [8], [2], [7], [1], [0, 5, 9], [6]],
      [[0, 5, 9], [8], [7], [4], [1], [6], [0, 5, 9], [2], [3]],
      [[6], [1], [2], [5], [3], [9], [8], [7], [4]],
      [[0, 1, 3, 8], [0, 5, 7], [0, 1, 3, 6], [2], [0, 5, 9], [4], [0, 5, 7, 9], [0, 3, 6], [0, 1, 8]],
      [[0, 4, 7], [0, 4, 5, 7], [9], [3], [6], [0, 1, 8], [2], [0, 1, 5], [0, 1, 5, 7, 8]],
      [[0, 1, 3, 8], [2], [0, 1, 3, 6], [7], [0, 5, 9], [0, 1, 8], [4], [0, 3, 6], [0, 5, 9]],
      [[0, 1, 4, 7], [0, 4, 7, 9], [8], [6], [0, 4, 7], [5], [3], [0, 1, 9], [2]],
      [[0, 1, 3, 7], [6], [0, 1, 3], [9], [8], [2], [0, 5, 7], [4], [0, 1, 5, 7]],
      [[2], [0, 4, 7, 9], [5], [1], [0, 4, 7], [3], [6], [8], [0, 7, 9]],
    ]);
    problem.initColoredCells[problem.board[3][1]] = Theme.of(context).hintColor;
    problem.initColoredCells[problem.board[4][0]] = Theme.of(context).hintColor;
    problem.initColoredCells[problem.board[4][1]] = Theme.of(context).hintColor;
    return problem;
  }
}