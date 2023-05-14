import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../game_internals/sudoku_problem.dart';
import '../../pages/technique_page.dart';
import '../sudoku_problem_widget.dart';

class LastRemainingCellDescription extends StatefulWidget {
  const LastRemainingCellDescription({super.key});
  static const String assetFolderPath = "lib/assets/techniques/last_remaining_cell/";

  @override
  State<LastRemainingCellDescription> createState() => _LastRemainingCellDescriptionState();
}

class _LastRemainingCellDescriptionState extends State<LastRemainingCellDescription> {
  final Future<double> img1Future = TechniquePage.getImageHeightAsync(Image.asset("${LastRemainingCellDescription.assetFolderPath}last_remaining_cell_1.png"));
  final Future<double> img2Future = TechniquePage.getImageHeightAsync(Image.asset("${LastRemainingCellDescription.assetFolderPath}last_remaining_cell_2.png"));
  final Future<double> img3Future = TechniquePage.getImageHeightAsync(Image.asset("${LastRemainingCellDescription.assetFolderPath}last_remaining_cell_variation_1.png"));
  final Future<double> img4Future = TechniquePage.getImageHeightAsync(Image.asset("${LastRemainingCellDescription.assetFolderPath}last_remaining_cell_variation_2.png"));

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TechniquePage.getTechniquePageSection(
          [
            TechniquePage.getTechniquePageText("${AppLocalizations.of(context).techniquePurpose} : ${AppLocalizations.of(context).techniquePurposeCellValue}"),
          ],
          context
        ),
        TechniquePage.getTechniquePageSection(
          [
            TechniquePage.getTechniquePageText(AppLocalizations.of(context).lastRemainingCellDescription1),
            TechniquePage.getTechniquePageText(AppLocalizations.of(context).lastRemainingCellDescription2),
            TechniquePage.getTechniquePageImage(img1Future, context, Image.asset("${LastRemainingCellDescription.assetFolderPath}last_remaining_cell_1.png")),
            TechniquePage.getTechniquePageImage(img1Future, context, Image.asset("${LastRemainingCellDescription.assetFolderPath}last_remaining_cell_2.png")),
            TechniquePage.getTechniquePageText(AppLocalizations.of(context).lastRemainingCellDescription3),
            TechniquePage.getTechniquePageImage(img1Future, context, Image.asset("${LastRemainingCellDescription.assetFolderPath}last_remaining_cell_variation_1.png")),
            TechniquePage.getTechniquePageText(AppLocalizations.of(context).lastRemainingCellDescription4),
            TechniquePage.getTechniquePageImage(img1Future, context, Image.asset("${LastRemainingCellDescription.assetFolderPath}last_remaining_cell_variation_2.png")),
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
      [[0], [2], [5], [0], [0], [0], [0], [0], [7]],
      [[0], [0], [0], [0], [2], [0], [8], [0], [0]],
      [[8], [1], [0], [0], [0], [3], [2], [4], [0]],
      [[7], [0], [0], [3], [0], [0], [0], [5], [0]],
      [[0], [0], [0], [0], [7], [8], [4], [0], [2]],
      [[0], [0], [0], [0], [0], [2], [0], [0], [0]],
      [[0], [0], [0], [8], [3], [0], [0], [0], [0]],
      [[0], [0], [7], [5], [0], [1], [0], [0], [3]],
      [[4], [0], [0], [0], [0], [4], [0], [0], [0]],
    ],
    [
      [[0], [2], [5], [0], [0], [0], [0], [0], [7]],
      [[0], [7], [0], [0], [2], [0], [8], [0], [0]],
      [[8], [1], [0], [0], [0], [3], [2], [4], [0]],
      [[7], [0], [0], [3], [0], [0], [0], [5], [0]],
      [[0], [0], [0], [0], [7], [8], [4], [0], [2]],
      [[0], [0], [0], [0], [0], [2], [0], [0], [0]],
      [[0], [0], [0], [8], [3], [0], [0], [0], [0]],
      [[0], [0], [7], [5], [0], [1], [0], [0], [3]],
      [[4], [0], [0], [0], [0], [4], [0], [0], [0]],
    ]);
    problem.initColoredCells[problem.board[1][1]] = Theme.of(context).hintColor;
    return problem;
  }
}