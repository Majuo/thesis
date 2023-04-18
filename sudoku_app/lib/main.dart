import 'package:flutter/material.dart';
import 'package:sudoku_app/config.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sudoku_app/pages/homepage.dart';
import 'package:sudoku_app/locale/current_locale.dart';
import 'package:sudoku_app/settings/shared_preferences_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
	const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  VoidCallback listener = () {};
  Future<bool> isFirstRun = Future(() => false);
	@override
	void initState() {
		super.initState();
    listener = () {
      setState(() {});
    };
    isFirstRun = SharedPreferencesManager.initSharedPreferences().then((value) {
      return SharedPreferencesManager.isFirstRun;
    });
    SharedPreferencesManager.addPrefListeners();
    currentTheme.addListener(listener);
    currentLocale.addListener(listener);
	}

  @override
  void dispose() {
    SharedPreferencesManager.removePrefListeners();
    currentTheme.removeListener(listener);
    currentLocale.removeListener(listener);
    super.dispose();
  }

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Sudoku Guide',
			localizationsDelegates: AppLocalizations.localizationsDelegates,
			supportedLocales: AppLocalizations.supportedLocales,
			locale: CurrentLocale.currentLocale,
			theme: currentTheme.getThemeData(),
			home: HomePage(firstRun: isFirstRun)
		);
	}
}