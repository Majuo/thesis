import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CurrentLocale with ChangeNotifier {
	static Locale currentLocale = AppLocalizations.supportedLocales.first;

	changeCurrentLocale(Locale locale) {
		currentLocale = locale;
		notifyListeners();
	}
}