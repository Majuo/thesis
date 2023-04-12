import 'package:flutter/material.dart';

class SudokuRulesTechniquePage extends StatelessWidget {
  const SudokuRulesTechniquePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: TextButton(onPressed: () { Navigator.pop(context); }, child: Text("Go to learning page")),
      ),
    );
  }

}