import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../game_internals/sudoku_problem.dart';
import '../../pages/technique_page.dart';
import '../sudoku_problem_widget.dart';

class PencilMarksDescription extends StatefulWidget {
  const PencilMarksDescription({super.key});
  static const String assetFolderPath = "lib/assets/techniques/pencil_marks/";

  @override
  State<PencilMarksDescription> createState() => _PencilMarksDescriptionState();
}

class _PencilMarksDescriptionState extends State<PencilMarksDescription> {
  final Future<double> img1Future = TechniquePage.getImageHeightAsync(Image.asset("${PencilMarksDescription.assetFolderPath}pencil_marks.png"));

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TechniquePage.getTechniquePageSection(
          [
            TechniquePage.getTechniquePageText(AppLocalizations.of(context).pencilMarksDescription1),
            TechniquePage.getTechniquePageImage(img1Future, context, Image.asset("${PencilMarksDescription.assetFolderPath}pencil_marks.png")),
            TechniquePage.getTechniquePageText(AppLocalizations.of(context).pencilMarksDescription2),
          ]
        ),
        TechniquePage.getTechniquePageText(AppLocalizations.of(context).pencilMarksProblem),
        SudokuProblemWidget(problem: getPencilMarksProblem())
      ]
    );
  }

  SudokuProblem getPencilMarksProblem() {
    var problem = SudokuProblem.getSudokuProblem(
    [
      [[5], [7], [0], [0], [0], [0], [0], [1], [0]],
      [[0], [0], [0], [0], [0], [0], [5], [2], [8]],
      [[0], [4], [8], [0], [0], [0], [0], [0], [0]],
      [[3], [2], [0], [9], [4], [7], [0], [8], [0]],
      [[0], [0], [0], [0], [2], [0], [0], [0], [4]],
      [[0], [9], [1], [0], [0], [3], [0], [0], [7]],
      [[0], [1], [0], [0], [5], [2], [0], [0], [6]],
      [[0], [0], [0], [6], [0], [0], [0], [0], [0]],
      [[9], [0], [5], [0], [3], [1], [0], [0], [0]],
    ],
    [
      [[5], [7], [0], [0], [0], [0], [0], [1], [0]],
      [[0], [0], [0], [0], [0], [0], [5], [2], [8]],
      [[0], [4], [8], [0], [0], [0], [0], [0], [0]],
      [[3], [2], [0], [9], [4], [7], [0], [8], [0]],
      [[0], [0], [0], [0], [2], [0], [0], [0], [4]],
      [[0], [9], [1], [0], [0, 6, 8], [3], [0], [0], [7]],
      [[0], [1], [0], [0], [5], [2], [0], [0], [6]],
      [[0], [0], [0], [6], [0], [0], [0], [0], [0]],
      [[9], [0], [5], [0], [3], [1], [0], [0], [0]],
    ]);
    problem.initColoredCells[problem.board[5][4]] = Colors.green;
    return problem;
  }
}