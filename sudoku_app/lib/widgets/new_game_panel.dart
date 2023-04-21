import 'package:flutter/material.dart';
import 'package:sudoku_app/game_internals/generator/sudoku_difficulty_enum.dart';
import 'package:sudoku_app/locale/sudoku_difficulty_name_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewGamePanel extends StatefulWidget {
  const NewGamePanel({super.key, required this.newGameOnClick});
  final Function(SudokuDifficultyEnum) newGameOnClick;

  @override
  State<NewGamePanel> createState() => _NewGamePanelState();
}

class _NewGamePanelState extends State<NewGamePanel> {
  SudokuDifficultyEnum currentDifficulty = SudokuDifficultyEnum.easy;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: TextButton(
            onPressed: () { widget.newGameOnClick(currentDifficulty); },
            child: Text(AppLocalizations.of(context).newGame)),
        ),
        DropdownButton<SudokuDifficultyEnum>(
          value: currentDifficulty,
          onChanged: (SudokuDifficultyEnum? value) {
            if (value != null) {
              setState(() {
                currentDifficulty = value;
              });
            }
          },
          items: SudokuDifficultyEnum.values.map<DropdownMenuItem<SudokuDifficultyEnum>>((SudokuDifficultyEnum value) {
            return DropdownMenuItem<SudokuDifficultyEnum>(
              value: value,
              child: Text(SudokuDifficultyNamePicker.getDifficultyName(context, value), style: TextStyle(color: Theme.of(context).textTheme.bodyMedium!.color))
            );
          }).toList()
        )
      ]
    );
  }
}