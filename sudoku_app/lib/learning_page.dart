import 'package:flutter/material.dart';
import 'package:sudoku_app/sudoku_rules_page.dart';

class LearningPage extends StatelessWidget {
  const LearningPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const SudokuRulesTechniquePage()));
          },
          child: Text("Go to technique page")),
      ),
    );
  }

}