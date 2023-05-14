import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../game_internals/sudoku_problem.dart';
import '../../pages/technique_page.dart';
import '../sudoku_problem_widget.dart';

class HiddenPairDescription extends StatefulWidget {
  const HiddenPairDescription({super.key});
  static const String assetFolderPath = "lib/assets/techniques/hidden_pair/";

  @override
  State<HiddenPairDescription> createState() => _HiddenPairDescriptionState();
}

class _HiddenPairDescriptionState extends State<HiddenPairDescription> {
  final Future<double> img1Future = TechniquePage.getImageHeightAsync(Image.asset("${HiddenPairDescription.assetFolderPath}hidden_pair_1.png"));

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
            TechniquePage.getTechniquePageText(AppLocalizations.of(context).hiddenPairDescription1),
            TechniquePage.getTechniquePageText(AppLocalizations.of(context).hiddenPairDescription2),
            TechniquePage.getTechniquePageImage(img1Future, context, Image.asset("${HiddenPairDescription.assetFolderPath}hidden_pair_1.png")),
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
      [[1], [0, 6, 7], [4], [0, 6, 7], [2], [9], [5], [3], [8]],
      [[9], [8], [2], [0, 1, 3], [0, 4, 5], [0, 3, 5], [0, 1, 7], [0, 1, 4, 6, 7], [0, 4, 6]],
      [[5], [0, 6, 7], [3], [0, 1, 8], [0, 4, 8], [0, 6, 7], [0, 1, 9], [0, 1, 4, 9], [2]],
      [[7], [3], [8], [9], [6], [1], [2], [0, 4, 5], [0, 4, 5]],
      [[4], [0, 1, 9], [5], [2], [3], [8], [0, 1, 7, 9], [0, 1, 6, 7, 9], [0, 6, 9]],
      [[2], [0, 1, 9], [6], [5], [7], [4], [8], [0, 1, 9], [3]],
      [[3], [2], [7], [0, 6, 8], [0, 5, 8, 9], [0, 5, 6], [4], [0, 5, 9], [1]],
      [[8], [4], [1], [0, 3, 7], [0, 5, 9], [0, 3, 7], [6], [2], [0, 5, 9]],
      [[6], [5], [9], [4], [1], [2], [3], [8], [7]],
    ],
    [
      [[1], [0, 6, 7], [4], [0, 6, 7], [2], [9], [5], [3], [8]],
      [[9], [8], [2], [0, 1, 3], [0, 4, 5], [0, 3, 5], [0, 1, 7], [0, 6, 7], [0, 4, 6]],
      [[5], [0, 6, 7], [3], [0, 1, 8], [0, 4, 8], [0, 6, 7], [0, 1, 9], [0, 1, 4, 9], [2]],
      [[7], [3], [8], [9], [6], [1], [2], [0, 4, 5], [0, 4, 5]],
      [[4], [0, 1, 9], [5], [2], [3], [8], [0, 1, 7, 9], [0, 6, 7], [0, 6, 9]],
      [[2], [0, 1, 9], [6], [5], [7], [4], [8], [0, 1, 9], [3]],
      [[3], [2], [7], [0, 6, 8], [0, 5, 8, 9], [0, 5, 6], [4], [0, 5, 9], [1]],
      [[8], [4], [1], [0, 3, 7], [0, 5, 9], [0, 3, 7], [6], [2], [0, 5, 9]],
      [[6], [5], [9], [4], [1], [2], [3], [8], [7]],
    ]);
    problem.initColoredCells[problem.board[1][7]] = Theme.of(context).hintColor;
    problem.initColoredCells[problem.board[4][7]] = Theme.of(context).hintColor;
    return problem;
  }
}