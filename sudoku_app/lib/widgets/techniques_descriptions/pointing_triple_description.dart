import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../game_internals/sudoku_problem.dart';
import '../../pages/technique_page.dart';
import '../sudoku_problem_widget.dart';

class PointingTripleDescription extends StatefulWidget {
  const PointingTripleDescription({super.key});
  static const String assetFolderPath = "lib/assets/techniques/pointing_triple/";

  @override
  State<PointingTripleDescription> createState() => _PointingTripleDescriptionState();
}

class _PointingTripleDescriptionState extends State<PointingTripleDescription> {
  final Future<double> img1Future = TechniquePage.getImageHeightAsync(Image.asset("${PointingTripleDescription.assetFolderPath}pointing_triple.png"));

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
            TechniquePage.getTechniquePageText(AppLocalizations.of(context).pointingTripleDescription1),
            TechniquePage.getTechniquePageImage(img1Future, context, Image.asset("${PointingTripleDescription.assetFolderPath}pointing_triple.png")),
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
      [[0, 5, 6, 7], [8], [0, 6, 7], [9], [3], [1], [4], [0, 5, 6], [2]],
      [[0, 1, 2, 5, 6], [4], [0, 1, 2, 6], [0, 2, 5], [8], [0, 2, 6], [9], [3], [7]],
      [[0, 2, 3, 5, 6, 7], [9], [0, 2, 3, 6, 7], [0, 2, 4, 5, 7], [0, 2, 5, 6, 7], [0, 2, 4, 6, 7], [1], [0, 5, 6], [8]],
      [[0, 2, 4], [3], [8], [6], [1], [0, 2, 4], [7], [9], [5]],
      [[0, 1, 2, 6, 7], [0, 1, 6, 7], [9], [3], [0, 2, 7], [5], [8], [4], [0, 1, 6]],
      [[0, 1, 4, 6, 7], [5], [0, 1, 6, 7], [0, 4, 7], [9], [8], [0, 3, 6], [2], [0, 1, 3, 6]],
      [[9], [0, 6, 7], [0, 3, 6, 7], [1], [0, 2, 5, 6, 7], [0, 2, 3, 6, 7], [0, 3, 5, 6], [8], [4]],
      [[8], [2], [4], [0, 5, 7], [0, 5, 6, 7], [0, 3, 6, 7], [0, 3, 5, 6], [1], [9]],
      [[0, 1, 3, 6], [0, 1, 6], [5], [8], [4], [9], [2], [7], [0, 3, 6]],
    ],
    [
      [[0, 5, 6, 7], [8], [0, 6, 7], [9], [3], [1], [4], [0, 5, 6], [2]],
      [[0, 1, 2, 5, 6], [4], [0, 1, 2, 6], [0, 2, 5], [8], [0, 2, 6], [9], [3], [7]],
      [[0, 2, 3, 5, 6], [9], [0, 2, 3, 6], [0, 2, 4, 5, 7], [0, 2, 5, 6, 7], [0, 2, 4, 6, 7], [1], [0, 5, 6], [8]],
      [[0, 2, 4], [3], [8], [6], [1], [0, 2, 4], [7], [9], [5]],
      [[0, 1, 2, 6, 7], [0, 1, 6, 7], [9], [3], [0, 2, 7], [5], [8], [4], [0, 1, 6]],
      [[0, 1, 4, 6, 7], [5], [0, 1, 6, 7], [0, 4, 7], [9], [8], [0, 3, 6], [2], [0, 1, 3, 6]],
      [[9], [0, 6, 7], [0, 3, 6, 7], [1], [0, 2, 5, 6, 7], [0, 2, 3, 6, 7], [0, 3, 5, 6], [8], [4]],
      [[8], [2], [4], [0, 5, 7], [0, 5, 6, 7], [0, 3, 6, 7], [0, 3, 5, 6], [1], [9]],
      [[0, 1, 3, 6], [0, 1, 6], [5], [8], [4], [9], [2], [7], [0, 3, 6]],
    ]);
    problem.initColoredCells[problem.board[2][3]] = Theme.of(context).hintColor;
    problem.initColoredCells[problem.board[2][4]] = Theme.of(context).hintColor;
    problem.initColoredCells[problem.board[2][5]] = Theme.of(context).hintColor;
    return problem;
  }
}