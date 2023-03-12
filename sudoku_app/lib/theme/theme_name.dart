import 'package:flutter/material.dart';
import 'package:sudoku_app/theme/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThemeName {
	static String getThemeName(BuildContext context, AppTheme theme)
	{
		switch (theme) {
		case AppTheme.light:
			return AppLocalizations.of(context).lightTheme;
		case AppTheme.dark:
			return AppLocalizations.of(context).darkTheme;
		case AppTheme.highContrast:
			return AppLocalizations.of(context).highContrastTheme;
		default:
			return "Unknown theme";
		}
	}
}