import 'package:flutter/material.dart';
import 'package:sudoku_app/locale/current_locale.dart';
import 'package:sudoku_app/locale/locale_language_name.dart';
import 'package:sudoku_app/theme/app_theme.dart';
import 'package:sudoku_app/theme/current_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../config.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});


  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

	@override
	void initState() {
		super.initState();
		currentTheme.addListener(() {
			setState(() {});
		});
	}
	
	@override
	Widget build(BuildContext context) {
		return Scaffold(
		body: Center(
			child: Column(
			mainAxisAlignment: MainAxisAlignment.center,
			children: <Widget>[
				Text(
				AppLocalizations.of(context).helloWorld
				),
				DropdownButton<AppTheme>(
					value: CurrentTheme.currentTheme,
					onChanged: (AppTheme? value) {
						currentTheme.changeCurrentTheme(value ?? AppTheme.light);
					},
					items: AppTheme.values.map<DropdownMenuItem<AppTheme>>((AppTheme value) {
						return DropdownMenuItem<AppTheme>(
							value: value,
							child: Text(value.name)
						);
					}).toList()
				),
				DropdownButton<Locale>(
					value: CurrentLocale.currentLocale,
					onChanged: (Locale? value) {
						currentLocale.changeCurrentLocale(value ?? AppLocalizations.supportedLocales.first);
					},
					items: AppLocalizations.supportedLocales.map<DropdownMenuItem<Locale>>((Locale value) {
						return DropdownMenuItem<Locale>(
							value: value,
							child: Text(LocaleLanguageName.langNames[value.languageCode] ?? "Unknown locale")
						);
					}).toList()
				),
			],
			),
		),
		);
	}
}