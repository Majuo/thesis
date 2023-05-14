import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../game_internals/sudoku_problem.dart';
import '../../pages/technique_page.dart';
import '../sudoku_problem_widget.dart';

class PointingPairDescription extends StatefulWidget {
  const PointingPairDescription({super.key});
  static const String assetFolderPath = "lib/assets/techniques/pointing_pair/";

  @override
  State<PointingPairDescription> createState() => _PointingPairDescriptionState();
}

class _PointingPairDescriptionState extends State<PointingPairDescription> {
  final Future<double> img1Future = TechniquePage.getImageHeightAsync(Image.asset("${PointingPairDescription.assetFolderPath}pointing_pair.png"));

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
            TechniquePage.getTechniquePageText(AppLocalizations.of(context).pointingPairDescription1),
            TechniquePage.getTechniquePageText(AppLocalizations.of(context).pointingPairDescription2),
            TechniquePage.getTechniquePageImage(img1Future, context, Image.asset("${PointingPairDescription.assetFolderPath}pointing_pair.png")),
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
      [[4], [0, 5, 6, 9], [0, 6, 8], [2], [7], [0, 3, 6, 8], [0, 1, 3, 5, 9], [0, 1, 3], [0, 3, 5, 9]],
      [[0, 5, 8, 9], [0, 5, 6, 9], [2], [0, 6, 8], [0, 3, 6, 8], [1], [7], [4], [0, 3, 5, 9]],
      [[7], [3], [1], [5], [4], [9], [2], [6], [8]],
      [[2], [8], [5], [9], [1], [4], [0, 3, 6], [7], [0, 3, 6]],
      [[3], [1], [9], [7], [0, 6, 8], [0, 6, 8], [4], [5], [2]],
      [[6], [4], [7], [3], [2], [5], [8], [9], [1]],
      [[1], [2], [3], [4], [9], [7], [0, 5, 6], [8], [0, 5, 6]],
      [[0, 5, 8, 9], [0, 5, 6, 9], [4], [1], [0, 3, 5, 6, 8], [0, 3, 6, 8], [0, 3, 5, 6, 9], [2], [7]],
      [[0, 5, 8, 9], [7], [0, 6, 8], [0, 6, 8], [0, 3, 5, 6, 8], [2], [0, 1, 3, 5, 6, 9], [0, 1, 3], [4]],
    ],
    [
      [[4], [0, 5, 6, 9], [0, 6, 8], [2], [7], [0, 3, 6, 8], [0, 1, 3, 5], [0, 1, 3], [0, 3, 5, 9]],
      [[0, 5, 8, 9], [0, 5, 6, 9], [2], [0, 6, 8], [0, 3, 6, 8], [1], [7], [4], [0, 3, 5, 9]],
      [[7], [3], [1], [5], [4], [9], [2], [6], [8]],
      [[2], [8], [5], [9], [1], [4], [0, 3, 6], [7], [0, 3, 6]],
      [[3], [1], [9], [7], [0, 6, 8], [0, 6, 8], [4], [5], [2]],
      [[6], [4], [7], [3], [2], [5], [8], [9], [1]],
      [[1], [2], [3], [4], [9], [7], [0, 5, 6], [8], [0, 5, 6]],
      [[0, 5, 8, 9], [0, 5, 6, 9], [4], [1], [0, 3, 5, 6, 8], [0, 3, 6, 8], [0, 3, 5, 6, 9], [2], [7]],
      [[0, 5, 8, 9], [7], [0, 6, 8], [0, 6, 8], [0, 3, 5, 6, 8], [2], [0, 1, 3, 5, 6, 9], [0, 1, 3], [4]],
    ]);
    problem.initColoredCells[problem.board[7][6]] = Theme.of(context).hintColor;
    problem.initColoredCells[problem.board[8][6]] = Theme.of(context).hintColor;
    return problem;
  }
}