import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../game_internals/sudoku_problem.dart';
import '../../pages/technique_page.dart';
import '../sudoku_problem_widget.dart';

class XWingDescription extends StatefulWidget {
  const XWingDescription({super.key});
  static const String assetFolderPath = "lib/assets/techniques/x_wing/";

  @override
  State<XWingDescription> createState() => _XWingDescriptionState();
}

class _XWingDescriptionState extends State<XWingDescription> {
  final Future<double> img1Future = TechniquePage.getImageHeightAsync(Image.asset("${XWingDescription.assetFolderPath}X-Wing.jpeg"));
  final Future<double> img2Future = TechniquePage.getImageHeightAsync(Image.asset("${XWingDescription.assetFolderPath}X-Wing_veerud.jpeg"));

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
            TechniquePage.getTechniquePageText(AppLocalizations.of(context).xWingDescription1),
            TechniquePage.getTechniquePageText(AppLocalizations.of(context).xWingDescription2),
            TechniquePage.getTechniquePageImage(img2Future, context, Image.asset("${XWingDescription.assetFolderPath}X-Wing_veerud.jpeg")),
            TechniquePage.getTechniquePageText(AppLocalizations.of(context).xWingDescription3),
            TechniquePage.getTechniquePageText(AppLocalizations.of(context).xWingDescription4),
          ], 
          context
        ),
        TechniquePage.getTechniquePageSection(
          [
            TechniquePage.getTechniquePageText(AppLocalizations.of(context).xWingDescription5),
            TechniquePage.getTechniquePageImage(img1Future, context, Image.asset("${XWingDescription.assetFolderPath}X-Wing.jpeg")),
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
      [[5], [9], [8], [7], [2], [6], [4], [1], [3]],
      [[1], [7], [6], [0, 4, 8, 9], [0, 3, 4], [0, 3, 9], [5], [0, 8, 9], [2]],
      [[3], [4], [2], [0, 1, 8, 9], [0, 5, 8], [0, 1, 5, 9], [0, 7, 8], [6], [0, 7, 9]],
      [[6], [2], [4], [5], [9], [8], [3], [7], [1]],
      [[9], [1], [3], [6], [7], [4], [2], [5], [8]],
      [[0, 7, 8], [0, 5, 8], [0, 5, 7], [3], [1], [2], [9], [4], [6]],
      [[0, 2, 4], [6], [0, 5, 7], [0, 2, 4, 8], [0, 3, 4], [0, 3, 5], [1], [0, 8, 9], [0, 7, 9]],
      [[0, 2, 7], [0, 5, 8], [1], [0, 2, 9], [0, 5, 8], [0, 7, 9], [6], [3], [4]],
      [[0, 4, 7, 8], [3], [9], [0, 1, 4], [6], [0, 1, 7], [0, 7, 8], [2], [5]],
    ],
    [
      [[5], [9], [8], [7], [2], [6], [4], [1], [3]],
      [[1], [7], [6], [0, 4, 8, 9], [0, 3, 4], [0, 3, 9], [5], [0, 8, 9], [2]],
      [[3], [4], [2], [0, 1, 9], [0, 5, 8], [0, 1, 5, 9], [0, 7, 8], [6], [0, 7, 9]],
      [[6], [2], [4], [5], [9], [8], [3], [7], [1]],
      [[9], [1], [3], [6], [7], [4], [2], [5], [8]],
      [[0, 7, 8], [0, 5, 8], [0, 5, 7], [3], [1], [2], [9], [4], [6]],
      [[0, 2, 4], [6], [0, 5, 7], [0, 2, 4, 8], [0, 3, 4], [0, 3, 5], [1], [0, 8, 9], [0, 7, 9]],
      [[0, 2, 7], [0, 5, 8], [1], [0, 2, 9], [0, 5, 8], [0, 7, 9], [6], [3], [4]],
      [[0, 4, 7, 8], [3], [9], [0, 1, 4], [6], [0, 1, 7], [0, 7, 8], [2], [5]],
    ]);
    problem.initColoredCells[problem.board[1][3]] = Theme.of(context).hintColor;
    problem.initColoredCells[problem.board[1][7]] = Theme.of(context).hintColor;
    problem.initColoredCells[problem.board[6][3]] = Theme.of(context).hintColor;
    problem.initColoredCells[problem.board[6][7]] = Theme.of(context).hintColor;
    return problem;
  }
}