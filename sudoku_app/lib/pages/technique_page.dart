import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sudoku_app/locale/sudoku_technique_name_picker.dart';

import '../screen_size_helpers.dart';

class TechniquePage extends StatelessWidget {
  const TechniquePage({super.key, required this.technique, required this.pageContent});
  final Type technique;
  final Widget pageContent;
  @override
  Widget build(BuildContext context) {
    double appBarHeight = Platform.isAndroid && !ScreenSizeHelpers.isVerticalOrientation(context) ? 35 : 50;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight),
        child: AppBar(
          title: Text(SudokuTechniqueNamePicker.getTechniqueName(context, technique), style: TextStyle(fontSize: appBarHeight * 0.5)),
          backgroundColor: Colors.blueAccent,
        ),
      ),
      body: pageContent
    );
  }
}