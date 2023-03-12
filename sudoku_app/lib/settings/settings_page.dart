import 'package:flutter/material.dart';
import 'package:sudoku_app/locale/current_locale.dart';
import 'package:sudoku_app/locale/locale_language_name.dart';
import 'package:sudoku_app/theme/app_theme.dart';
import 'package:sudoku_app/theme/current_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sudoku_app/theme/theme_name.dart';

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
			body: Column(
				mainAxisAlignment: MainAxisAlignment.center,
				crossAxisAlignment: CrossAxisAlignment.center,
				children: <Widget>[
					Row(
						mainAxisAlignment: MainAxisAlignment.center,
					
						children: [
							Text(AppLocalizations.of(context).colorScheme),
							const Text(" : "),
							DropdownButton<AppTheme>(
								value: CurrentTheme.currentTheme,
								onChanged: (AppTheme? value) {
									currentTheme.changeCurrentTheme(value ?? AppTheme.light);
								},
								items: AppTheme.values.map<DropdownMenuItem<AppTheme>>((AppTheme value) {
									return DropdownMenuItem<AppTheme>(
										value: value,
										child: Text(ThemeName.getThemeName(context, value))
									);
								}).toList()
							),
						]
					),
					Row(
						mainAxisAlignment: MainAxisAlignment.center,
						children: [
							Text(AppLocalizations.of(context).language),
							const Text(" : "),
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
						]
					),
					
				],
			),
		);
	}
}