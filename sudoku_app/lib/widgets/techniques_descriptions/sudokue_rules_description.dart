import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sudoku_app/game_internals/sudoku_problem.dart';
import 'package:sudoku_app/widgets/sudoku_problem_widget.dart';

import '../../pages/technique_page.dart';

class SudokuRulesDescription extends StatefulWidget {
  const SudokuRulesDescription({super.key});
  static const String assetFolderPath = "lib/assets/techniques/sudoku_rules/";

  @override
  State<SudokuRulesDescription> createState() => _SudokuRulesDescriptionState();
}

class _SudokuRulesDescriptionState extends State<SudokuRulesDescription> {
  final Future<double> img1Future = TechniquePage.getImageHeightAsync(Image.asset("${SudokuRulesDescription.assetFolderPath}empty_sudoku.png"));
  final Future<double> img2Future = TechniquePage.getImageHeightAsync(Image.asset("${SudokuRulesDescription.assetFolderPath}solved_sudoku.png"));
  final Future<double> img3Future = TechniquePage.getImageHeightAsync(Image.asset("${SudokuRulesDescription.assetFolderPath}box_example.png"));

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TechniquePage.getTechniquePageSection(
          [
            TechniquePage.getTechniquePageText(AppLocalizations.of(context).sudokuRulesDescription1),
            TechniquePage.getTechniquePageImage(img1Future, context, Image.asset("${SudokuRulesDescription.assetFolderPath}empty_sudoku.png")),
            TechniquePage.getTechniquePageText(AppLocalizations.of(context).sudokuRulesDescription2),
            TechniquePage.getTechniquePageImage(img2Future, context, Image.asset("${SudokuRulesDescription.assetFolderPath}solved_sudoku.png")),
          ]
        ),
        TechniquePage.getTechniquePageSection(
          [
            TechniquePage.getTechniquePageText(AppLocalizations.of(context).sudokuRulesDescription3),
            TechniquePage.getTechniquePageText(AppLocalizations.of(context).sudokuRulesDescription4),
            TechniquePage.getTechniquePageImage(img3Future, context, Image.asset("${SudokuRulesDescription.assetFolderPath}box_example.png")),
          ]
        ),
        TechniquePage.getTechniquePageText(AppLocalizations.of(context).solvePuzzleLearning),
        SudokuProblemWidget(problem: getRulesProblem())
      ]
    );
  }

  SudokuProblem getRulesProblem() {
    var problem = SudokuProblem.getSudokuProblem(
    [
      [[6], [2], [0], [3], [8], [0], [9], [0], [7]],
      [[9], [7], [0], [0], [0], [1], [5], [0], [0]],
      [[0], [0], [0], [0], [9], [0], [0], [0], [0]],
      [[0], [5], [9], [4], [1], [0], [6], [2], [0]],
      [[0], [0], [0], [7], [5], [0], [4], [0], [0]],
      [[4], [0], [1], [9], [6], [2], [0], [3], [5]],
      [[0], [0], [6], [1], [7], [0], [3], [5], [0]],
      [[5], [0], [7], [0], [3], [6], [8], [0], [9]],
      [[0], [9], [2], [0], [4], [0], [0], [0], [0]],
    ], 
    [
      [[6], [2], [0], [3], [8], [0], [9], [0], [7]],
      [[9], [7], [0], [0], [2], [1], [5], [0], [0]],
      [[0], [0], [0], [0], [9], [0], [0], [0], [0]],
      [[0], [5], [9], [4], [1], [0], [6], [2], [0]],
      [[0], [0], [0], [7], [5], [0], [4], [0], [0]],
      [[4], [0], [1], [9], [6], [2], [0], [3], [5]],
      [[0], [0], [6], [1], [7], [0], [3], [5], [0]],
      [[5], [0], [7], [0], [3], [6], [8], [0], [9]],
      [[0], [9], [2], [0], [4], [0], [0], [0], [0]],
    ]);
    problem.initColoredCells[problem.board[1][4]] = Colors.green;
    return problem;
  }
}