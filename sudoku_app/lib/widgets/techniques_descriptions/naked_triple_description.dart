import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../game_internals/sudoku_problem.dart';
import '../../pages/technique_page.dart';
import '../sudoku_problem_widget.dart';

class NakedTripleDescription extends StatefulWidget {
  const NakedTripleDescription({super.key});
  static const String assetFolderPath = "lib/assets/techniques/naked_triple/";

  @override
  State<NakedTripleDescription> createState() => _NakedTripleDescriptionState();
}

class _NakedTripleDescriptionState extends State<NakedTripleDescription> {
  final Future<double> img1Future = TechniquePage.getImageHeightAsync(Image.asset("${NakedTripleDescription.assetFolderPath}naked_triple_1.png"));

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
            TechniquePage.getTechniquePageText(AppLocalizations.of(context).nakedTripleDescription1),
            TechniquePage.getTechniquePageText(AppLocalizations.of(context).nakedTripleDescription2),
            TechniquePage.getTechniquePageImage(img1Future, context, Image.asset("${NakedTripleDescription.assetFolderPath}naked_triple_1.png")),
            TechniquePage.getTechniquePageText(AppLocalizations.of(context).nakedTripleDescription3),
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
      [[5], [7], [0, 6, 9], [1], [0, 6, 9], [3], [4], [8], [2]],
      [[1], [2], [3], [4], [7], [8], [5], [6], [9]],
      [[0, 6, 8, 9], [0, 6, 8, 9], [4], [2], [5], [0, 6, 9], [0, 3, 7], [0, 3, 7], [1]],
      [[0, 3, 8], [0, 1, 8], [7], [6], [4], [2], [9], [0, 1, 3], [5]],
      [[0, 2, 3, 6, 9], [0, 4, 6, 9], [0, 6, 9], [5], [8], [1], [0, 3, 7], [0, 2, 3, 4, 7], [0, 4, 6]],
      [[0, 2, 6], [0, 1, 4, 6], [5], [9], [3], [7], [0, 1, 6], [0, 1, 2, 4], [8]],
      [[7], [0, 6, 9], [2], [3], [1], [5], [8], [0, 4, 9], [0, 4, 6]],
      [[4], [3], [1], [8], [0, 6, 9], [0, 6, 9], [2], [5], [7]],
      [[0, 6, 9], [5], [8], [7], [2], [4], [0, 1, 6], [0, 1, 9], [3]],
    ],
    [
      [[5], [7], [0, 6, 9], [1], [0, 6, 9], [3], [4], [8], [2]],
      [[1], [2], [3], [4], [7], [8], [5], [6], [9]],
      [[0, 6, 8, 9], [0, 6, 8, 9], [4], [2], [5], [0, 6, 9], [0, 3, 7], [0, 3, 7], [1]],
      [[0, 3, 8], [0, 1, 8], [7], [6], [4], [2], [9], [0, 1, 3], [5]],
      [[0, 2, 3], [0, 4, 6, 9], [0, 6, 9], [5], [8], [1], [0, 3, 7], [0, 2, 3, 7], [0, 4, 6]],
      [[0, 2, 6], [0, 1, 4, 6], [5], [9], [3], [7], [0, 1, 6], [0, 1, 2, 4], [8]],
      [[7], [0, 6, 9], [2], [3], [1], [5], [8], [0, 4, 9], [0, 4, 6]],
      [[4], [3], [1], [8], [0, 6, 9], [0, 6, 9], [2], [5], [7]],
      [[0, 6, 9], [5], [8], [7], [2], [4], [0, 1, 6], [0, 1, 9], [3]],
    ]);
    problem.initColoredCells[problem.board[4][1]] = Theme.of(context).hintColor;
    problem.initColoredCells[problem.board[4][2]] = Theme.of(context).hintColor;
    problem.initColoredCells[problem.board[4][8]] = Theme.of(context).hintColor;
    return problem;
  }
}