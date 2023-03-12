import 'package:flutter/material.dart';
import 'package:sudoku_app/theme/app_theme.dart';

import 'app_theme_data.dart';

class CurrentTheme with ChangeNotifier {
	static AppTheme currentTheme = AppTheme.light;

	changeCurrentTheme (AppTheme theme) {
		currentTheme = theme;
		notifyListeners();
	}

	ThemeData getThemeData() {
		switch (currentTheme) {
			case AppTheme.light:
		    	return AppThemeData.lightTheme;
			case AppTheme.dark:
				return AppThemeData.darkTheme;
			case AppTheme.highContrast:
				return AppThemeData.lightTheme.copyWith(
					primaryColor: Colors.red
				);
			default:
				return ThemeData.light();
		}
	}
}