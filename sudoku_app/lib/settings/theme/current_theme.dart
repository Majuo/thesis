import 'package:flutter/material.dart';
import 'package:sudoku_app/settings/theme/app_theme.dart';

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
            hintColor: Colors.green,
            highlightColor: const Color.fromRGBO(255, 245, 99, 1),
            indicatorColor: const Color.fromARGB(255, 255, 109, 98),
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
            canvasColor: Colors.black87,
            scaffoldBackgroundColor: const Color.fromRGBO(00, 23, 47, 1),
            primaryColorLight: const Color.fromRGBO(40, 79, 119, 1),
            primaryColorDark: Colors.black,
            hintColor: Colors.green[800],
            highlightColor: const Color.fromRGBO(44, 120, 195, 1),
            indicatorColor: const Color.fromRGBO(210, 51, 40, 1),
            textTheme: const TextTheme(
              bodyMedium: TextStyle(
                color: Colors.white
              ),
              displaySmall: TextStyle(
                color: Colors.white
              ),
              headlineSmall: TextStyle(
                color: Colors.white
              ),
            ),
            bottomNavigationBarTheme: BottomNavigationBarTheme.of(context).copyWith(
              backgroundColor: const Color.fromRGBO(00, 23, 47, 1),
              unselectedItemColor: Colors.white,
              selectedItemColor: Colors.white,
              selectedIconTheme: const IconThemeData(
                color: Color.fromRGBO(36, 111, 255, 1),
              )
            ),
            textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                foregroundColor: const MaterialStatePropertyAll(Colors.white),
                backgroundColor: const MaterialStatePropertyAll(Color.fromRGBO(00, 84, 168, 1)),
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
              foregroundColor: Colors.black,
              backgroundColor: const Color.fromRGBO(76, 171, 255, 1),
              iconTheme: const IconThemeData(
                color: Colors.black
              )
            ),
            canvasColor: Colors.white,
            scaffoldBackgroundColor: Colors.white,
            primaryColorLight: const Color.fromRGBO(252, 252, 252, 1),
            primaryColorDark: Colors.black, // border color for cells / tiles
            hintColor: Colors.green,
            highlightColor: const Color.fromRGBO(255, 245, 99, 1),
            indicatorColor: const Color.fromARGB(255, 255, 109, 98),
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
              backgroundColor: Colors.white,
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
        return hcThemeData!;
			default:
				return ThemeData.light();
		}
	}
}