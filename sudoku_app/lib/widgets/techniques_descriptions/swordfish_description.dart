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
  final Future<double> img1Future = TechniquePage.getImageHeightAsync(Image.asset("${SwordfishDescription.assetFolderPath}Swordfish_tähed.jpeg"));
  final Future<double> img2Future = TechniquePage.getImageHeightAsync(Image.asset("${SwordfishDescription.assetFolderPath}Swordfish_X-Wing_seletus.jpeg"));
  final Future<double> img3Future = TechniquePage.getImageHeightAsync(Image.asset("${SwordfishDescription.assetFolderPath}Swordfish_näide.jpeg"));

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
            TechniquePage.getTechniquePageText(AppLocalizations.of(context).swordfishDescription1),
          ],
          context
        ),
        TechniquePage.getTechniquePageSection(
          [
            TechniquePage.getTechniquePageText(AppLocalizations.of(context).swordfishDescription2),
            TechniquePage.getTechniquePageImage(img1Future, context, Image.asset("${SwordfishDescription.assetFolderPath}Swordfish_tähed.jpeg")),
            TechniquePage.getTechniquePageText(AppLocalizations.of(context).swordfishDescription3),
          ],
          context
        ),
        TechniquePage.getTechniquePageSection(
          [
            TechniquePage.getTechniquePageText(AppLocalizations.of(context).swordfishDescription4),
            TechniquePage.getTechniquePageImage(img1Future, context, Image.asset("${SwordfishDescription.assetFolderPath}Swordfish_X-Wing_seletus.jpeg")),
            TechniquePage.getTechniquePageText(AppLocalizations.of(context).swordfishDescription5),
            TechniquePage.getTechniquePageText(AppLocalizations.of(context).swordfishDescription6),
          ],
          context
        ),
        TechniquePage.getTechniquePageSection(
          [
            TechniquePage.getTechniquePageText(AppLocalizations.of(context).swordfishDescription7),
            TechniquePage.getTechniquePageImage(img1Future, context, Image.asset("${SwordfishDescription.assetFolderPath}Swordfish_näide.jpeg")),
            TechniquePage.getTechniquePageText(AppLocalizations.of(context).swordfishDescription8),
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
      [[0, 4, 6], [8], [0, 1, 6], [0, 2, 6, 9], [0, 2, 3, 4, 9], [0, 1, 6, 9], [0, 1, 3, 4, 9], [7], [5]],
      [[9], [7], [2], [0, 1, 6], [0, 3, 4, 5], [0, 1, 5], [0, 1, 3, 4, 8], [0, 4, 8], [0, 1, 3, 6]],
      [[0, 1, 4, 6], [3], [5], [7], [0, 4, 6, 9], [8], [2], [0, 4, 9], [0, 1, 6]],
      [[5], [2], [0, 6, 7], [4], [0, 8, 9], [0, 6, 7, 9], [0, 1, 3], [0, 6, 8], [0, 1, 3]],
      [[0, 6, 8], [4], [9], [5], [1], [3], [0, 6, 8], [2], [7]],
      [[0, 3, 6, 8], [1], [0, 3, 7], [0, 6, 8], [0, 6, 7, 8], [2], [0, 4, 5], [0, 4, 5], [9]],
      [[7], [0, 5, 9], [8], [3], [0, 5, 6, 9], [4], [0, 5, 6, 9], [1], [2]],
      [[0, 1, 3], [0, 5, 9], [0, 1, 3], [0, 2, 8], [0, 2, 8], [0, 5, 6, 9], [7], [0, 5, 6, 9], [4]],
      [[2], [6], [4], [0, 1, 9], [0, 5, 7, 9], [0, 1, 7], [0, 5, 9], [3], [8]],
    ],
    [
      [[0, 4], [8], [0, 1, 6], [0, 2, 9], [0, 2, 3, 4, 9], [0, 1, 6, 9], [0, 1, 3, 4, 9], [7], [5]],
      [[9], [7], [2], [0, 1, 6], [0, 3, 4, 5], [0, 1, 5], [0, 1, 3, 4, 8], [0, 4, 8], [0, 1, 3, 6]],
      [[0, 1, 4, 6], [3], [5], [7], [0, 4, 6, 9], [8], [2], [0, 4, 9], [0, 1, 6]],
      [[5], [2], [0, 6, 7], [4], [0, 8, 9], [0, 6, 7, 9], [0, 1, 3], [0, 6, 8], [0, 1, 3]],
      [[0, 6, 8], [4], [9], [5], [1], [3], [0, 6, 8], [2], [7]],
      [[0, 3, 6, 8], [1], [0, 3, 7], [0, 6, 8], [0, 6, 7, 8], [2], [0, 4, 5], [0, 4, 5], [9]],
      [[7], [0, 5, 9], [8], [3], [0, 5, 6, 9], [4], [0, 5, 6, 9], [1], [2]],
      [[0, 1, 3], [0, 5, 9], [0, 1, 3], [0, 2, 8], [0, 2, 8], [0, 5, 6, 9], [7], [0, 5, 6, 9], [4]],
      [[2], [6], [4], [0, 1, 9], [0, 5, 7, 9], [0, 1, 7], [0, 5, 9], [3], [8]],
    ]);
    problem.initColoredCells[problem.board[0][2]] = Theme.of(context).hintColor;
    problem.initColoredCells[problem.board[0][5]] = Theme.of(context).hintColor;
    problem.initColoredCells[problem.board[3][2]] = Theme.of(context).hintColor;
    problem.initColoredCells[problem.board[3][5]] = Theme.of(context).hintColor;
    problem.initColoredCells[problem.board[3][7]] = Theme.of(context).hintColor;
    problem.initColoredCells[problem.board[7][5]] = Theme.of(context).hintColor;
    problem.initColoredCells[problem.board[7][7]] = Theme.of(context).hintColor;
    return problem;
  }
}