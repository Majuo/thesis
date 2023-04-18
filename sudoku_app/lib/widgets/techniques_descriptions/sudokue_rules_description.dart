import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
        TechniquePage.getTechniquePageText(AppLocalizations.of(context).sudokuRulesDescription1),
        TechniquePage.getTechniquePageImage(img1Future, context, Image.asset("${SudokuRulesDescription.assetFolderPath}empty_sudoku.png")),
        TechniquePage.getTechniquePageText(AppLocalizations.of(context).sudokuRulesDescription2),
        TechniquePage.getTechniquePageImage(img2Future, context, Image.asset("${SudokuRulesDescription.assetFolderPath}solved_sudoku.png")),
        TechniquePage.getTechniquePageText(AppLocalizations.of(context).sudokuRulesDescription3),
        TechniquePage.getTechniquePageText(AppLocalizations.of(context).sudokuRulesDescription4),
        TechniquePage.getTechniquePageImage(img3Future, context, Image.asset("${SudokuRulesDescription.assetFolderPath}box_example.png")),
        TechniquePage.getTechniquePageText(AppLocalizations.of(context).solvePuzzleLearning),
      ]
    );
  }
}