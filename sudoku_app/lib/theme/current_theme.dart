import 'package:flutter/material.dart';
import 'package:sudoku_app/theme/app_theme.dart';

import 'app_theme_data.dart';

class CurrentTheme with ChangeNotifier {
	static AppTheme currentTheme = AppTheme.light;

  static ThemeData? lightThemeData;
  static ThemeData? darkThemeData;
  static ThemeData? hcThemeData;

	changeCurrentTheme (AppTheme theme) {
		currentTheme = theme;
		notifyListeners();
	}

	ThemeData getThemeData(BuildContext context) {
		switch (currentTheme) {
			case AppTheme.light:
        lightThemeData ??= AppThemeData.lightTheme.copyWith(
            appBarTheme: AppBarTheme.of(context).copyWith(
              backgroundColor: Colors.amber
            ),
            scaffoldBackgroundColor: Colors.pink[100],
            bottomNavigationBarTheme: BottomNavigationBarTheme.of(context).copyWith(
              backgroundColor: Colors.greenAccent,
              selectedItemColor: Colors.orange,
              unselectedItemColor: Colors.black
            ),
            drawerTheme: DrawerTheme.of(context).copyWith(

            )
          );
        return lightThemeData!;
			case AppTheme.dark:
        darkThemeData ??= AppThemeData.darkTheme;
        return darkThemeData!;
			case AppTheme.highContrast:
        hcThemeData ??= AppThemeData.lightTheme.copyWith(
          appBarTheme: AppBarTheme.of(context).copyWith(
            backgroundColor: Colors.amber
          )
				);
        return hcThemeData!;
			default:
				return ThemeData.light();
		}
	}
}