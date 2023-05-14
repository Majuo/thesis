import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../game_internals/sudoku_problem.dart';
import '../../pages/technique_page.dart';
import '../sudoku_problem_widget.dart';

class NakedSingleDescription extends StatefulWidget {
  const NakedSingleDescription({super.key});
  static const String assetFolderPath = "lib/assets/techniques/naked_single/";

  @override
  State<NakedSingleDescription> createState() => _NakedSingleDescriptionState();
}

class _NakedSingleDescriptionState extends State<NakedSingleDescription> {
  final Future<double> img1Future = TechniquePage.getImageHeightAsync(Image.asset("${NakedSingleDescription.assetFolderPath}naked_single_1.png"));
  final Future<double> img2Future = TechniquePage.getImageHeightAsync(Image.asset("${NakedSingleDescription.assetFolderPath}naked_single_2.png"));

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TechniquePage.getTechniquePageSection(
          [
            TechniquePage.getTechniquePageText("${AppLocalizations.of(context).techniquePurpose} : ${AppLocalizations.of(context).techniquePurposeCellValueAndRemoveCandidates}"),
          ],
          context
        ),
        TechniquePage.getTechniquePageSection(
          [
            TechniquePage.getTechniquePageText(AppLocalizations.of(context).nakedSingleDescription1),
            TechniquePage.getTechniquePageText(AppLocalizations.of(context).nakedSingleDescription2),
            TechniquePage.getTechniquePageText(AppLocalizations.of(context).nakedSingleDescription3),
            TechniquePage.getTechniquePageText(AppLocalizations.of(context).nakedSingleDescription4),
            TechniquePage.getTechniquePageImage(img1Future, context, Image.asset("${NakedSingleDescription.assetFolderPath}naked_single_1.png")),
            TechniquePage.getTechniquePageText(AppLocalizations.of(context).nakedSingleDescription5),
            TechniquePage.getTechniquePageImage(img2Future, context, Image.asset("${NakedSingleDescription.assetFolderPath}naked_single_2.png")),
          ],
          context
        ),
        TechniquePage.getTechniquePageText(AppLocalizations.of(context).findSolutionForCellRemoveCandidates),
        SudokuProblemWidget(problem: getLastPossibleNumberProblem())
      ]
    );
  }

  SudokuProblem getLastPossibleNumberProblem() {
    var problem = SudokuProblem.getSudokuProblem(
    [
      [[6], [7], [4], [9], [5], [3], [2], [8], [1]],
      [[9], [1], [2], [8], [6], [4], [5], [7], [3]],
      [[8], [5], [3], [2], [7], [1], [6], [9], [4]],
      [[0, 2, 5], [4], [8], [0, 5, 6], [1], [0, 5, 6], [7], [3], [9]],
      [[0, 1, 3, 5], [0, 3], [0, 1], [7], [2], [0, 5, 9], [8], [4], [6]],
      [[7], [6], [9], [4], [3], [8], [1], [5], [2]],
      [[4], [2], [5], [1], [9], [7], [3], [6], [8]],
      [[0, 3], [8], [6], [0, 3, 5], [4], [0, 2, 5], [9], [1], [0, 5, 7]],
      [[0, 1, 3], [0, 3, 9], [0, 1, 7], [0, 3, 5, 6], [8], [0, 5, 6], [4], [2], [0, 5, 7]],
    ],
    [
      [[6], [7], [4], [9], [5], [3], [2], [8], [1]],
      [[9], [1], [2], [8], [6], [4], [5], [7], [3]],
      [[8], [5], [3], [2], [7], [1], [6], [9], [4]],
      [[0, 2, 5], [4], [8], [0, 5, 6], [1], [0, 5, 6], [7], [3], [9]],
      [[0, 3, 5], [0, 3], [1, 1], [7], [2], [0, 5, 9], [8], [4], [6]],
      [[7], [6], [9], [4], [3], [8], [1], [5], [2]],
      [[4], [2], [5], [1], [9], [7], [3], [6], [8]],
      [[0, 3], [8], [6], [0, 3, 5], [4], [0, 2, 5], [9], [1], [0, 5, 7]],
      [[0, 1, 3], [0, 3, 9], [0, 7], [0, 3, 5, 6], [8], [0, 5, 6], [4], [2], [0, 5, 7]],
    ]);
    problem.initColoredCells[problem.board[4][2]] = Theme.of(context).hintColor;
    return problem;
  }
}