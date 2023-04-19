import 'package:flutter/material.dart';
import 'package:sudoku_app/game_internals/solver/techniques/hidden_pair_technique.dart';
import 'package:sudoku_app/game_internals/solver/techniques/hidden_single_technique.dart';
import 'package:sudoku_app/game_internals/solver/techniques/hidden_triple_technique.dart';
import 'package:sudoku_app/game_internals/solver/techniques/last_possible_number_technique.dart';
import 'package:sudoku_app/game_internals/solver/techniques/last_remaining_cell_technique.dart';
import 'package:sudoku_app/game_internals/solver/techniques/naked_pair_technique.dart';
import 'package:sudoku_app/game_internals/solver/techniques/naked_single_technique.dart';
import 'package:sudoku_app/game_internals/solver/techniques/naked_triple_technique.dart';
import 'package:sudoku_app/game_internals/solver/techniques/pointing_pair_technique.dart';
import 'package:sudoku_app/game_internals/solver/techniques/pointing_triple_technique.dart';
import 'package:sudoku_app/game_internals/solver/techniques/sudoku_rules_technique.dart';
import 'package:sudoku_app/game_internals/solver/techniques/swordfish_technique.dart';
import 'package:sudoku_app/game_internals/solver/techniques/x_wing_technique.dart';
import 'package:sudoku_app/game_internals/solver/techniques/y_wing_technique.dart';
import 'package:sudoku_app/locale/sudoku_technique_name_picker.dart';
import 'package:sudoku_app/pages/technique_page.dart';
import 'package:sudoku_app/screen_size_helpers.dart';
import 'package:sudoku_app/widgets/techniques_descriptions/pencil_marks_description.dart';
import 'package:sudoku_app/widgets/techniques_descriptions/sudoku_rules_description.dart';
import 'package:sudoku_app/widgets/techniques_list_tile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LearningPage extends StatefulWidget {
  const LearningPage({super.key});
  static const double learningPagePadding = 10;
  static const String assetFolder = "lib/assets/tileListIcons/";

  @override
  State<LearningPage> createState() => _LearningPageState();
}

class _LearningPageState extends State<LearningPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: LearningPage.learningPagePadding),
        child: ListView(
          children: [
            const Divider(
              thickness: 0.5,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                AppLocalizations.of(context).basics,
                style: Theme.of(context).textTheme.displaySmall
              ),
            ),
            Wrap(
              spacing: getTileSpacing(context, 2),
              children: [
                TechniquesListTile(
                  onTapHandler: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const TechniquePage(technique: SudokuRulesTechnique, pageContent: SudokuRulesDescription())));
                  },
                  imageAssetPath: "${LearningPage.assetFolder}rules.png",
                  techniqueName: SudokuTechniqueNamePicker.getTechniqueName(context, SudokuRulesTechnique),
                ),
                TechniquesListTile(
                  onTapHandler: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TechniquePage(technique: null, pageContent: const PencilMarksDescription(), techniqueNameOverride: AppLocalizations.of(context).pencilMarks)));
                  },
                  imageAssetPath: "${LearningPage.assetFolder}notes.png",
                  techniqueName: AppLocalizations.of(context).pencilMarks,
                ),
              ],
            ),
            const Divider(
              thickness: 0.5,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                AppLocalizations.of(context).beginnerTechniques,
                style: Theme.of(context).textTheme.displaySmall
              ),
            ),
            Wrap(
              spacing: getTileSpacing(context, 8),
              children: [
                TechniquesListTile(
                  onTapHandler: () {},
                  imageAssetPath: "${LearningPage.assetFolder}lastPossibleNumber.png",
                  techniqueName: SudokuTechniqueNamePicker.getTechniqueName(context, LastPossibleNumberTechnique),
                ),
                TechniquesListTile(
                  onTapHandler: () {},
                  imageAssetPath: "${LearningPage.assetFolder}lastRemainingCell.png",
                  techniqueName: SudokuTechniqueNamePicker.getTechniqueName(context, LastRemainingCellTechnique),
                ),
                TechniquesListTile(
                  onTapHandler: () {},
                  imageAssetPath: "${LearningPage.assetFolder}nakedSingle.png",
                  techniqueName: SudokuTechniqueNamePicker.getTechniqueName(context, NakedSingleTechnique),
                ),
                TechniquesListTile(
                  onTapHandler: () {},
                  imageAssetPath: "${LearningPage.assetFolder}nakedPair.png",
                  techniqueName: SudokuTechniqueNamePicker.getTechniqueName(context, NakedPairTechnique),
                ),
                TechniquesListTile(
                  onTapHandler: () {},
                  imageAssetPath: "${LearningPage.assetFolder}nakedTriple.png",
                  techniqueName: SudokuTechniqueNamePicker.getTechniqueName(context, NakedTripleTechnique),
                ),
                TechniquesListTile(
                  onTapHandler: () {},
                  imageAssetPath: "${LearningPage.assetFolder}rules.png",
                  techniqueName: SudokuTechniqueNamePicker.getTechniqueName(context, HiddenSingleTechnique),
                ),
                TechniquesListTile(
                  onTapHandler: () {},
                  imageAssetPath: "${LearningPage.assetFolder}rules.png",
                  techniqueName: SudokuTechniqueNamePicker.getTechniqueName(context, HiddenPairTechnique),
                ),
                TechniquesListTile(
                  onTapHandler: () {},
                  imageAssetPath: "${LearningPage.assetFolder}rules.png",
                  techniqueName: SudokuTechniqueNamePicker.getTechniqueName(context, HiddenTripleTechnique),
                ),
              ],
            ),
            const Divider(
              thickness: 0.5,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                AppLocalizations.of(context).intermediateTechniques,
                style: Theme.of(context).textTheme.displaySmall
              ),
            ),
            Wrap(
              spacing: getTileSpacing(context, 2),
              children: [
                TechniquesListTile(
                  onTapHandler: () {},
                  imageAssetPath: "${LearningPage.assetFolder}rules.png",
                  techniqueName: SudokuTechniqueNamePicker.getTechniqueName(context, PointingPairTechnique),
                ),
                TechniquesListTile(
                  onTapHandler: () {},
                  imageAssetPath: "${LearningPage.assetFolder}rules.png",
                  techniqueName: SudokuTechniqueNamePicker.getTechniqueName(context, PointingTripleTechnique),
                ),
              ],
            ),
            const Divider(
              thickness: 0.5,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                AppLocalizations.of(context).advancedTechniques,
                style: Theme.of(context).textTheme.displaySmall
              ),
            ),
            Wrap(
              spacing: getTileSpacing(context, 3),
              children: [
                TechniquesListTile(
                  onTapHandler: () {},
                  imageAssetPath: "${LearningPage.assetFolder}rules.png",
                  techniqueName: SudokuTechniqueNamePicker.getTechniqueName(context, XWingTechnique),
                ),
                TechniquesListTile(
                  onTapHandler: () {},
                  imageAssetPath: "${LearningPage.assetFolder}rules.png",
                  techniqueName: SudokuTechniqueNamePicker.getTechniqueName(context, YWingTechnique),
                ),
                TechniquesListTile(
                  onTapHandler: () {},
                  imageAssetPath: "${LearningPage.assetFolder}rules.png",
                  techniqueName: SudokuTechniqueNamePicker.getTechniqueName(context, SwordfishTechnique),
                ),
              ],
            ),
            const Divider(
              thickness: 0.5,
            ),
          ]
        ),
      ),
    );
  }

  double getTileSpacing(BuildContext context, int numOfChildren) {
    var screenWidth = ScreenSizeHelpers.displayWidth(context) - 2 * LearningPage.learningPagePadding;
    var tileTotalWidth = TechniquesListTile.tileWidth + 2 * TechniquesListTile.tilePadding;
    return (screenWidth % tileTotalWidth) / (screenWidth ~/ tileTotalWidth);
  }
}