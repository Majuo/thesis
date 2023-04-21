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
              foregroundColor: Colors.white,
              backgroundColor: Colors.amber,
              iconTheme: const IconThemeData(
                color: Colors.blue
              )
            ),
            canvasColor: Colors.pink[300],
            scaffoldBackgroundColor: Colors.pink[100],
            primaryColorLight: Colors.pink[50],
            primaryColorDark: Colors.black,
            textTheme: const TextTheme(
              bodyMedium: TextStyle(
                color: Colors.pink
              ),
              displaySmall: TextStyle(
                color: Colors.pink
              ),
            ),
            bottomNavigationBarTheme: BottomNavigationBarTheme.of(context).copyWith(
              backgroundColor: Colors.greenAccent,
              selectedItemColor: Colors.orange,
              unselectedItemColor: Colors.black
            ),
            textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                foregroundColor: const MaterialStatePropertyAll(Colors.pink),
                backgroundColor: const MaterialStatePropertyAll(Colors.amber),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3)
                  )
                )
              )
            ),
          );
        return lightThemeData!;
			case AppTheme.dark:
        darkThemeData ??= AppThemeData.darkTheme.copyWith(
          primaryColorDark: Colors.white
        );
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