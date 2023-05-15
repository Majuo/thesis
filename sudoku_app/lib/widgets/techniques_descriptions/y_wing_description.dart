import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../game_internals/sudoku_problem.dart';
import '../../pages/technique_page.dart';
import '../sudoku_problem_widget.dart';

class YWingDescription extends StatefulWidget {
  const YWingDescription({super.key});
  static const String assetFolderPath = "lib/assets/techniques/y_wing/";

  @override
  State<YWingDescription> createState() => _YWingDescriptionState();
}

class _YWingDescriptionState extends State<YWingDescription> {
  final Future<double> img1Future = TechniquePage.getImageHeightAsync(Image.asset("${YWingDescription.assetFolderPath}Y-Wing_tähed.jpeg"));
  final Future<double> img2Future = TechniquePage.getImageHeightAsync(Image.asset("${YWingDescription.assetFolderPath}Y-Wing_rida_ja_veerg.jpeg"));
  final Future<double> img3Future = TechniquePage.getImageHeightAsync(Image.asset("${YWingDescription.assetFolderPath}Y-Wing_veerg_ja_plokk.jpeg"));

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
            TechniquePage.getTechniquePageText(AppLocalizations.of(context).yWingDescription1),
          ],
          context
        ),
        TechniquePage.getTechniquePageSection(
          [
            TechniquePage.getTechniquePageText(AppLocalizations.of(context).yWingDescription2),
            TechniquePage.getTechniquePageImage(img1Future, context, Image.asset("${YWingDescription.assetFolderPath}Y-Wing_tähed.jpeg")),
            TechniquePage.getTechniquePageText(AppLocalizations.of(context).yWingDescription3),
          ],
          context
        ),
        TechniquePage.getTechniquePageSection(
          [
            TechniquePage.getTechniquePageText(AppLocalizations.of(context).yWingDescription4),
            TechniquePage.getTechniquePageImage(img2Future, context, Image.asset("${YWingDescription.assetFolderPath}Y-Wing_rida_ja_veerg.jpeg")),
          ],
          context
        ),
        TechniquePage.getTechniquePageSection(
          [
            TechniquePage.getTechniquePageText(AppLocalizations.of(context).yWingDescription5),
            TechniquePage.getTechniquePageImage(img3Future, context, Image.asset("${YWingDescription.assetFolderPath}Y-Wing_veerg_ja_plokk.jpeg")),
            TechniquePage.getTechniquePageText(AppLocalizations.of(context).yWingDescription6),
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
      [[5], [1], [8], [0, 2, 4, 6], [9], [7], [0, 3, 4, 6], [0, 2, 4, 6], [0, 3, 4, 6]],
      [[0, 4, 6], [3], [2], [0, 4, 6], [5], [1], [8], [0, 7, 9], [0, 7, 9]],
      [[9], [0, 4, 6], [7], [8], [3], [0, 2, 6], [5], [1], [0, 2, 4, 6]],
      [[0, 1, 2], [0, 5, 9], [6], [0, 1, 2], [7], [8], [0, 3, 4], [0, 4, 5, 9], [0, 3, 4, 9]],
      [[3], [7], [4], [9], [6], [5], [2], [8], [1]],
      [[0, 2, 8], [0, 5, 8, 9], [0, 1, 5], [3], [0, 1, 2], [4], [7], [0, 5, 6, 9], [0, 6, 9]],
      [[0, 1, 7], [2], [3], [0, 1, 6], [8], [9], [0, 4, 6], [0, 4, 6, 7], [5]],
      [[0, 7, 8], [0, 6, 8], [9], [5], [4], [0, 2, 6], [1], [3], [0, 2, 6, 7]],
      [[0, 4, 6], [0, 4, 5, 6], [0, 1, 5], [7], [0, 1, 2], [3], [9], [0, 2, 6], [8]],
    ],
    [
      [[5], [1], [8], [0, 2, 4, 6], [9], [7], [0, 3, 4, 6], [0, 2, 4, 6], [0, 3, 4, 6]],
      [[0, 4, 6], [3], [2], [0, 4, 6], [5], [1], [8], [0, 7, 9], [0, 7, 9]],
      [[9], [0, 4, 6], [7], [8], [3], [0, 2, 6], [5], [1], [0, 2, 4, 6]],
      [[0, 1, 2], [0, 5, 9], [6], [0, 1, 2], [7], [8], [0, 3, 4], [0, 4, 5, 9], [0, 3, 4, 9]],
      [[3], [7], [4], [9], [6], [5], [2], [8], [1]],
      [[0, 2, 8], [0, 5, 8, 9], [0, 1, 5], [3], [0, 1, 2], [4], [7], [0, 5, 6, 9], [0, 6, 9]],
      [[0, 1, 7], [2], [3], [0, 1, 6], [8], [9], [0, 4], [0, 4, 7], [5]],
      [[0, 7, 8], [0, 6, 8], [9], [5], [4], [0, 2, 6], [1], [3], [0, 2, 6, 7]],
      [[0, 4, 6], [0, 4, 5, 6], [0, 1, 5], [7], [0, 1, 2], [3], [9], [0, 2, 6], [8]],
    ]);
    problem.initColoredCells[problem.board[6][3]] = Theme.of(context).hintColor;
    problem.initColoredCells[problem.board[8][4]] = Theme.of(context).hintColor;
    problem.initColoredCells[problem.board[8][7]] = Theme.of(context).hintColor;
    return problem;
  }
}