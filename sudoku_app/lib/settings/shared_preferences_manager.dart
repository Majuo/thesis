import 'package:shared_preferences/shared_preferences.dart';
import 'package:sudoku_app/config.dart';
import 'package:sudoku_app/locale/current_locale.dart';
import 'package:sudoku_app/settings/navigation_menu_option.dart';
import 'package:sudoku_app/settings/navigation_menu_setting.dart';
import 'package:sudoku_app/settings/text_size_setting.dart';
import 'package:sudoku_app/theme/app_theme.dart';
import 'package:sudoku_app/theme/current_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main(List<String> arguments){
	// for testing
	SharedPreferences? prefs;
  SharedPreferences.getInstance().then((value) {
    prefs = value;
    prefs?.remove(SharedPreferencesManager.prefAlreadyRun);
  });
  print("prefs cleared");
}

class SharedPreferencesManager {
  static const prefAlreadyRun = "alreadyRun";
  static const prefCurrentTheme = "currentTheme";
  static const prefCurrentLanguage = "currentLanguage";
  static const prefCurrentNavMenuBehavior = "currentNavMenuBehavior";
  static const prefCurrentTextSize = "currentTextSize";
  static SharedPreferences? prefs;
  static bool isFirstRun = false;

  static Future initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    var firstRun = prefs?.getBool(prefAlreadyRun);
    if (firstRun == null) {
      isFirstRun = true;
      prefs?.setBool(prefAlreadyRun, true);
      updateCurrentThemeInPrefs();
      updateCurrentLocaleInPrefs();
      updateCurrentNavMenuSettingInPrefs();
      updateCurrentTextSizeSettingInPrefs();
    } else {
      currentTheme.changeCurrentTheme(AppTheme.values.byName(prefs?.getString(prefCurrentTheme)?.split(".")[1] ?? ""));
      currentLocale.changeCurrentLocale(AppLocalizations.supportedLocales.firstWhere((l) => l.languageCode == prefs?.getString(prefCurrentLanguage)));
      currentNavMenuSetting.changeCurrentNavMenuSetting(NavigationMenuOption.values.byName(prefs?.getString(prefCurrentNavMenuBehavior)?.split(".")[1] ?? ""));
      currentTextSize.changeCurrentTextSizeSetting(prefs?.getDouble(prefCurrentTextSize) ?? 1);
    }
  }

  static void addPrefListeners() {
    currentTheme.addListener(() {
      updateCurrentThemeInPrefs();
    });
    currentLocale.addListener(() {
      updateCurrentLocaleInPrefs();
    });
    currentNavMenuSetting.addListener(() {
      updateCurrentNavMenuSettingInPrefs();
    });
    currentTextSize.addListener(() {
      updateCurrentTextSizeSettingInPrefs();
    });
  }

  static void removePrefListeners() {
    currentTheme.removeListener(() {
      updateCurrentThemeInPrefs();
    });
    currentLocale.removeListener(() {
      updateCurrentLocaleInPrefs();
    });
    currentNavMenuSetting.removeListener(() {
      updateCurrentNavMenuSettingInPrefs();
    });
    currentTextSize.removeListener(() {
      updateCurrentTextSizeSettingInPrefs();
    });
  }

  static void updateCurrentThemeInPrefs() {
    prefs?.setString(prefCurrentTheme, CurrentTheme.currentTheme.toString());
  }

  static void updateCurrentLocaleInPrefs() {
    prefs?.setString(prefCurrentLanguage, CurrentLocale.currentLocale.languageCode);
  }

  static void updateCurrentNavMenuSettingInPrefs() {
    prefs?.setString(prefCurrentNavMenuBehavior, NavigationMenuSetting.currentSetting.toString());
  }

  static void updateCurrentTextSizeSettingInPrefs() {
    prefs?.setDouble(prefCurrentTextSize, TextSizeSetting.currentSetting);
  }
}