import 'package:flutter/material.dart';

class ScreenSizeHelpers {
  static bool isVerticalOrientation(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return size.height > size.width;
  }

  static Size displaySize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double displayHeight(BuildContext context) {
    return displaySize(context).height;
  }

  static double displayWidth(BuildContext context) {
    return displaySize(context).width;
  }
}