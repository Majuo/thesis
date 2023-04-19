import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sudoku_app/locale/sudoku_technique_name_picker.dart';

import '../screen_size_helpers.dart';

class TechniquePage extends StatelessWidget {
  static double contentWidth = 0;
  static double fontSize = 16;
  const TechniquePage({super.key, required this.technique, required this.pageContent});
  final Type technique;
  final Widget pageContent;
  @override
  Widget build(BuildContext context) {
    contentWidth = ScreenSizeHelpers.displayWidth(context);
    double appBarHeight = Platform.isAndroid && !ScreenSizeHelpers.isVerticalOrientation(context) ? 35 : 50;
    return Scaffold(
      backgroundColor: Colors.blue[50],
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

  static Widget getTechniquePageText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: SizedBox(
        width: TechniquePage.contentWidth,
        child: Text(text, textAlign: TextAlign.justify, style: TextStyle(fontSize: TechniquePage.fontSize))
      ),
    );
  }

  static Widget getTechniquePageSection(List<Widget> children) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue[200]!),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Colors.blue[100]
        ),
        child: SizedBox(
          width: TechniquePage.contentWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ),
      ),
    );
  }

  static Widget getTechniquePageImage(Future<double> future, BuildContext context, Image image) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: SizedBox(
              width: contentWidth,
              height: min(min(400, snapshot.data!), ScreenSizeHelpers.displayHeight(context) * 0.7),
              child: Align(
                alignment: ScreenSizeHelpers.isVerticalOrientation(context) ? Alignment.center : Alignment.topLeft,
                child: image,
              ),
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  static Future<double> getImageHeightAsync(Image image) async {
    Completer<double> completer = Completer();
    image.image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener((image, synchronousCall) {
        completer.complete(image.image.height.toDouble());
      })
    );
    return completer.future;
  }
}