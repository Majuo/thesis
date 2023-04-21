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
              foregroundColor: Colors.black,
              backgroundColor: const Color.fromRGBO(66, 161, 255, 1),
              iconTheme: const IconThemeData(
                color: Colors.black
              )
            ),
            canvasColor: const Color.fromRGBO(240, 250, 255, 1),
            scaffoldBackgroundColor: const Color.fromRGBO(240, 240, 255, 1),
            primaryColorLight: const Color.fromRGBO(250, 250, 255, 1),
            primaryColorDark: Colors.black, // border color for cells / tiles
            textTheme: const TextTheme(
              bodyMedium: TextStyle(
                color: Colors.black
              ),
              displaySmall: TextStyle(
                color: Colors.black
              ),
              headlineSmall: TextStyle(
                color: Colors.black
              ),
            ),
            bottomNavigationBarTheme: BottomNavigationBarTheme.of(context).copyWith(
              backgroundColor: const Color.fromRGBO(240, 240, 255, 1),
              unselectedItemColor: Colors.black,
              selectedItemColor: Colors.black,
              selectedIconTheme: const IconThemeData(
                color: Color.fromRGBO(36, 111, 255, 1),
              )
            ),
            textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                foregroundColor: const MaterialStatePropertyAll(Colors.black),
                backgroundColor: const MaterialStatePropertyAll(Color.fromRGBO(96, 181, 255, 1)),
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
            appBarTheme: AppBarTheme.of(context).copyWith(
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromRGBO(00, 84, 168, 1),
              iconTheme: const IconThemeData(
                color: Colors.white
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