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