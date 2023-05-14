import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../game_internals/sudoku_problem.dart';
import '../../pages/technique_page.dart';
import '../sudoku_problem_widget.dart';

class HiddenSingleDescription extends StatefulWidget {
  const HiddenSingleDescription({super.key});
  static const String assetFolderPath = "lib/assets/techniques/hidden_single/";

  @override
  State<HiddenSingleDescription> createState() => _HiddenSingleDescriptionState();
}

class _HiddenSingleDescriptionState extends State<HiddenSingleDescription> {
  final Future<double> img1Future = TechniquePage.getImageHeightAsync(Image.asset("${HiddenSingleDescription.assetFolderPath}hidden_single_1.png"));

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
            TechniquePage.getTechniquePageText(AppLocalizations.of(context).hiddenSingleDescription1),
            TechniquePage.getTechniquePageText(AppLocalizations.of(context).hiddenSingleDescription2),
            TechniquePage.getTechniquePageImage(img1Future, context, Image.asset("${HiddenSingleDescription.assetFolderPath}hidden_single_1.png")),
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
      [[2], [6], [9], [3], [8], [5], [1], [7], [4]],
      [[8], [0, 4, 5], [0, 1, 5, 7], [2], [0, 4, 9], [0, 4, 7], [6], [0, 3, 9], [0, 5, 9]],
      [[0, 3, 7], [0, 4, 5], [0, 1, 5, 7], [0, 1, 9], [0, 4, 6, 9], [0, 4, 7], [0, 3, 8], [2], [0, 5, 9]],
      [[5], [3], [6], [8], [1], [9], [2], [4], [7]],
      [[1], [7], [2], [4], [5], [3], [9], [8], [6]],
      [[4], [9], [8], [6], [7], [2], [5], [1], [3]],
      [[0, 6, 7], [1], [0, 5, 7], [0, 5, 9], [0, 3, 4, 9], [0, 4, 8], [0, 3, 7], [0, 3, 6, 9], [0, 2, 9]],
      [[0, 6, 7], [0, 2, 5], [4], [0, 5, 9], [0, 3, 9], [1], [0, 3, 7], [0, 3, 6, 9], [8]],
      [[9], [8], [3], [7], [2], [6], [4], [5], [1]],
    ],
    [
      [[2], [6], [9], [3], [8], [5], [1], [7], [4]],
      [[8], [0, 4, 5], [1], [2], [0, 4, 9], [0, 4, 7], [6], [0, 3, 9], [0, 5, 9]],
      [[0, 3, 7], [0, 4, 5], [0, 5, 7], [0, 1, 9], [0, 4, 6, 9], [0, 4, 7], [0, 3, 8], [2], [0, 5, 9]],
      [[5], [3], [6], [8], [1], [9], [2], [4], [7]],
      [[1], [7], [2], [4], [5], [3], [9], [8], [6]],
      [[4], [9], [8], [6], [7], [2], [5], [1], [3]],
      [[0, 6, 7], [1], [0, 5, 7], [0, 5, 9], [0, 3, 4, 9], [0, 4, 8], [0, 3, 7], [0, 3, 6, 9], [0, 2, 9]],
      [[0, 6, 7], [0, 2, 5], [4], [0, 5, 9], [0, 3, 9], [1], [0, 3, 7], [0, 3, 6, 9], [8]],
      [[9], [8], [3], [7], [2], [6], [4], [5], [1]],
    ]);
    problem.initColoredCells[problem.board[1][2]] = Theme.of(context).hintColor;
    return problem;
  }
}