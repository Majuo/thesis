import 'package:flutter/material.dart';
import 'package:sudoku_app/config.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sudoku_app/pages/homepage.dart';
import 'package:sudoku_app/locale/current_locale.dart';

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
	@override
	void initState() {
		super.initState();
    listener = () {
			setState(() {});
		};
		currentTheme.addListener(listener);
		currentLocale.addListener(listener);
	}

  @override
  void dispose() {
    currentTheme.removeListener(listener);
    currentLocale.removeListener(listener);
    super.dispose();
  }

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Flutter Demo',
			localizationsDelegates: AppLocalizations.localizationsDelegates,
			supportedLocales: AppLocalizations.supportedLocales,
			locale: CurrentLocale.currentLocale,
			theme: currentTheme.getThemeData(),
			home: const HomePage()
		);
	}
}