import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../game_internals/sudoku_problem.dart';
import '../../pages/technique_page.dart';
import '../sudoku_problem_widget.dart';

class SwordfishDescription extends StatefulWidget {
  const SwordfishDescription({super.key});
  static const String assetFolderPath = "lib/assets/techniques/swordfish/";

  @override
  State<SwordfishDescription> createState() => _SwordfishDescriptionState();
}

class _SwordfishDescriptionState extends State<SwordfishDescription> {
  final Future<double> img1Future = TechniquePage.getImageHeightAsync(Image.asset("${SwordfishDescription.assetFolderPath}last_possible_number.png"));

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
            TechniquePage.getTechniquePageText(AppLocalizations.of(context).lastPossibleNumberDescription1),
            TechniquePage.getTechniquePageImage(img1Future, context, Image.asset("${SwordfishDescription.assetFolderPath}last_possible_number.png")),
            TechniquePage.getTechniquePageText(AppLocalizations.of(context).lastPossibleNumberDescription2),
          ],
          context
        ),
        TechniquePage.getTechniquePageText(AppLocalizations.of(context).findSolutionForCell),
        SudokuProblemWidget(problem: getLastPossibleNumberProblem())
      ]
    );
  }

  SudokuProblem getLastPossibleNumberProblem() {
    var problem = SudokuProblem.getSudokuProblem(
    [
      [[0], [0], [9], [0], [1], [0], [5], [0], [4]],
      [[0], [0], [0], [0], [0], [7], [1], [0], [0]],
      [[0], [5], [0], [0], [8], [4], [2], [6], [0]],
      [[0], [2], [0], [0], [0], [0], [0], [0], [7]],
      [[7], [6], [0], [0], [0], [0], [3], [9], [0]],
      [[0], [0], [0], [7], [0], [0], [0], [0], [0]],
      [[2], [0], [0], [4], [7], [8], [0], [3], [0]],
      [[0], [9], [4], [2], [0], [0], [0], [0], [0]],
      [[0], [0], [0], [0], [9], [0], [4], [0], [5]],
    ],
    [
      [[0], [0], [9], [0], [1], [0], [5], [0], [4]],
      [[0], [0], [0], [0], [0], [7], [1], [8], [0]],
      [[0], [5], [0], [0], [8], [4], [2], [6], [0]],
      [[0], [2], [0], [0], [0], [0], [0], [0], [7]],
      [[7], [6], [0], [0], [0], [0], [3], [9], [0]],
      [[0], [0], [0], [7], [0], [0], [0], [0], [0]],
      [[2], [0], [0], [4], [7], [8], [0], [3], [0]],
      [[0], [9], [4], [2], [0], [0], [0], [0], [0]],
      [[0], [0], [0], [0], [9], [0], [4], [0], [5]],
    ]);
    problem.initColoredCells[problem.board[1][7]] = Theme.of(context).hintColor;
    return problem;
  }
}