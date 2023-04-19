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
        TechniquePage.getTechniquePageText(AppLocalizations.of(context).findSolutionForCell),
        SudokuProblemWidget(problem: getRulesColumnProblem()),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Divider(
            thickness: 0.5,
          ),
        ),
        TechniquePage.getTechniquePageText(AppLocalizations.of(context).findSolutionForCell),
        SudokuProblemWidget(problem: getRulesRowProblem()),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Divider(
            thickness: 0.5,
          ),
        ),
        TechniquePage.getTechniquePageText(AppLocalizations.of(context).findSolutionForCell),
        SudokuProblemWidget(problem: getRulesBlockProblem())
      ]
    );
  }

  SudokuProblem getRulesColumnProblem() {
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

  SudokuProblem getRulesRowProblem() {
    var problem = SudokuProblem.getSudokuProblem(
    [
      [[0], [0], [9], [0], [8], [0], [0], [2], [0]],
      [[8], [6], [0], [0], [0], [1], [7], [0], [4]],
      [[3], [4], [1], [0], [7], [2], [9], [5], [8]],
      [[0], [0], [0], [7], [0], [0], [0], [0], [0]],
      [[6], [0], [8], [0], [3], [4], [0], [9], [0]],
      [[0], [0], [3], [0], [5], [6], [0], [8], [7]],
      [[0], [8], [6], [2], [0], [7], [0], [0], [3]],
      [[0], [0], [0], [0], [0], [5], [4], [6], [0]],
      [[5], [0], [4], [0], [6], [9], [8], [7], [0]],
    ], 
    [
      [[0], [0], [9], [0], [8], [0], [0], [2], [0]],
      [[8], [6], [0], [0], [0], [1], [7], [0], [4]],
      [[3], [4], [1], [6], [7], [2], [9], [5], [8]],
      [[0], [0], [0], [7], [0], [0], [0], [0], [0]],
      [[6], [0], [8], [0], [3], [4], [0], [9], [0]],
      [[0], [0], [3], [0], [5], [6], [0], [8], [7]],
      [[0], [8], [6], [2], [0], [7], [0], [0], [3]],
      [[0], [0], [0], [0], [0], [5], [4], [6], [0]],
      [[5], [0], [4], [0], [6], [9], [8], [7], [0]],
    ]);
    problem.initColoredCells[problem.board[2][3]] = Colors.green;
    return problem;
  }

  SudokuProblem getRulesBlockProblem() {
    var problem = SudokuProblem.getSudokuProblem(
    [
      [[0], [0], [6], [0], [3], [0], [0], [4], [0]],
      [[5], [8], [1], [0], [9], [4], [0], [0], [3]],
      [[0], [3], [9], [0], [6], [7], [2], [0], [8]],
      [[8], [1], [2], [0], [4], [0], [0], [0], [0]],
      [[3], [9], [5], [6], [0], [0], [8], [0], [0]],
      [[7], [6], [0], [3], [0], [0], [0], [5], [0]],
      [[6], [2], [8], [0], [0], [0], [0], [0], [7]],
      [[0], [4], [0], [0], [0], [8], [0], [0], [6]],
      [[9], [0], [0], [0], [0], [6], [0], [8], [0]],
    ], 
    [
      [[0], [0], [6], [0], [3], [0], [0], [4], [0]],
      [[5], [8], [1], [0], [9], [4], [0], [0], [3]],
      [[0], [3], [9], [0], [6], [7], [2], [0], [8]],
      [[8], [1], [2], [0], [4], [0], [0], [0], [0]],
      [[3], [9], [5], [6], [0], [0], [8], [0], [0]],
      [[7], [6], [4], [3], [0], [0], [0], [5], [0]],
      [[6], [2], [8], [0], [0], [0], [0], [0], [7]],
      [[0], [4], [0], [0], [0], [8], [0], [0], [6]],
      [[9], [0], [0], [0], [0], [6], [0], [8], [0]],
    ]);
    problem.initColoredCells[problem.board[5][2]] = Colors.green;
    return problem;
  }
}