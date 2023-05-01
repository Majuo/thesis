import 'package:flutter/material.dart';

class TextSizeSetting with ChangeNotifier {
	static double currentSetting = 1;

	changeCurrentTextSizeSetting(double setting) {
		currentSetting = setting;
		notifyListeners();
	}
}