import 'package:flutter/material.dart';
import 'package:sudoku_app/game_internals/solver/techniques/sudoku_rules_technique.dart';
import 'package:sudoku_app/locale/sudoku_technique_name_picker.dart';
import 'package:sudoku_app/pages/techniques/sudoku_rules_page.dart';
import 'package:sudoku_app/screen_size_helpers.dart';
import 'package:sudoku_app/widgets/techniques_list_tile.dart';

class LearningPage extends StatefulWidget {
  LearningPage({super.key});
  static const double learningPagePadding = 10;
  static const String assetFolder = "lib/assets/tileListIcons/";

  @override
  State<LearningPage> createState() => _LearningPageState();
}

class _LearningPageState extends State<LearningPage> {
  Wrap? wrapWidget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: LearningPage.learningPagePadding),
        child: ListView(
          children: [
            () {
              wrapWidget = Wrap(
                spacing: getTileSpacing(context),
                children: [
                  TechniquesListTile(
                    onTapHandler: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SudokuRulesTechniquePage()));
                    },
                    imageAssetPath: "${LearningPage.assetFolder}rules.png",
                    techniaueName: SudokuTechniqueNamePicker.getTechniqueName(context, SudokuRulesTechnique),
                  ),
                  TechniquesListTile(onTapHandler: () {},
                    imageAssetPath: "${LearningPage.assetFolder}rules.png",
                    techniaueName: SudokuTechniqueNamePicker.getTechniqueName(context, SudokuRulesTechnique),
                  ),
                  TechniquesListTile(onTapHandler: () {},
                    imageAssetPath: "${LearningPage.assetFolder}rules.png",
                    techniaueName: SudokuTechniqueNamePicker.getTechniqueName(context, SudokuRulesTechnique),
                  ),
                  TechniquesListTile(onTapHandler: () {},
                    imageAssetPath: "${LearningPage.assetFolder}rules.png",
                    techniaueName: SudokuTechniqueNamePicker.getTechniqueName(context, SudokuRulesTechnique),
                  ),
                  TechniquesListTile(onTapHandler: () {},
                    imageAssetPath: "${LearningPage.assetFolder}rules.png",
                    techniaueName: SudokuTechniqueNamePicker.getTechniqueName(context, SudokuRulesTechnique),
                  ),
                ],
              );
              return wrapWidget!;
            } ()
          ]
        ),
      ),
    );
  }

  double getTileSpacing(BuildContext context) {
    double defaultSpacing = 10;
    var screenWidth = ScreenSizeHelpers.displayWidth(context) - 2 * LearningPage.learningPagePadding;
    var tileTotalWidth = TechniquesListTile.tileWidth + 2 * TechniquesListTile.tilePadding;
    var possibleTilesNum = screenWidth / (tileTotalWidth + defaultSpacing);
    if (possibleTilesNum > wrapWidget!.children.length) {
      return defaultSpacing;
    }
    return (screenWidth % tileTotalWidth) / (screenWidth ~/ tileTotalWidth);
  }
}