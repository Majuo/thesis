import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../game_internals/sudoku_problem.dart';
import '../../pages/technique_page.dart';
import '../sudoku_problem_widget.dart';

class NakedPairDescription extends StatefulWidget {
  const NakedPairDescription({super.key});
  static const String assetFolderPath = "lib/assets/techniques/naked_pair/";

  @override
  State<NakedPairDescription> createState() => _NakedPairDescriptionState();
}

class _NakedPairDescriptionState extends State<NakedPairDescription> {
  final Future<double> img1Future = TechniquePage.getImageHeightAsync(Image.asset("${NakedPairDescription.assetFolderPath}naked_pair_1.png"));
  final Future<double> img2Future = TechniquePage.getImageHeightAsync(Image.asset("${NakedPairDescription.assetFolderPath}naked_pair_2.png"));

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
            TechniquePage.getTechniquePageText(AppLocalizations.of(context).nakedPairDescription1),
            TechniquePage.getTechniquePageText(AppLocalizations.of(context).nakedPairDescription2),
            TechniquePage.getTechniquePageImage(img1Future, context, Image.asset("${NakedPairDescription.assetFolderPath}naked_pair_1.png")),
            TechniquePage.getTechniquePageText(AppLocalizations.of(context).nakedPairDescription3),
            TechniquePage.getTechniquePageImage(img1Future, context, Image.asset("${NakedPairDescription.assetFolderPath}naked_pair_2.png")),
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
      [[0, 3, 8, 9], [0, 1, 7, 8, 9], [0, 3, 7], [0, 1, 9], [6], [2], [4], [5], [0, 1, 9]],
      [[5], [0, 1, 9], [2], [7], [3], [4], [0, 6, 8], [0, 8, 9], [0, 1, 6, 9]],
      [[0, 6, 9], [0, 1, 6, 9], [4], [0, 1, 9], [8], [5], [3], [2], [7]],
      [[2], [5], [9], [6], [7], [3], [1], [4], [8]],
      [[1], [3], [6], [5], [4], [8], [9], [7], [2]],
      [[7], [4], [8], [2], [9], [1], [5], [6], [3]],
      [[4], [0, 6, 7], [1], [8], [5], [0, 7, 9], [2], [3], [0, 6, 9]],
      [[0, 3, 8, 9], [0, 7, 8, 9], [0, 3, 7], [4], [2], [6], [0, 7, 8], [1], [5]],
      [[0, 6, 8], [2], [5], [3], [1], [0, 7, 9], [0, 6, 7, 8], [0, 8, 9], [4]],
    ],
    [
      [[0, 3, 8], [0, 7, 8], [0, 3, 7], [0, 1, 9], [6], [2], [4], [5], [0, 1, 9]],
      [[5], [0, 1, 9], [2], [7], [3], [4], [0, 6, 8], [0, 8, 9], [0, 1, 6, 9]],
      [[0, 6, 9], [0, 1, 6, 9], [4], [0, 1, 9], [8], [5], [3], [2], [7]],
      [[2], [5], [9], [6], [7], [3], [1], [4], [8]],
      [[1], [3], [6], [5], [4], [8], [9], [7], [2]],
      [[7], [4], [8], [2], [9], [1], [5], [6], [3]],
      [[4], [0, 6, 7], [1], [8], [5], [0, 7, 9], [2], [3], [0, 6, 9]],
      [[0, 3, 8, 9], [0, 7, 8, 9], [0, 3, 7], [4], [2], [6], [0, 7, 8], [1], [5]],
      [[0, 6, 8], [2], [5], [3], [1], [0, 7, 9], [0, 6, 7, 8], [0, 8, 9], [4]],
    ]);
    problem.initColoredCells[problem.board[0][3]] = Theme.of(context).hintColor;
    problem.initColoredCells[problem.board[0][8]] = Theme.of(context).hintColor;
    return problem;
  }
}