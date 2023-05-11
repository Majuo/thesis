import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sudoku_app/settings/navigation_menu_option.dart';

class NavigationMenuOptionNamePicker {
	static String getNavMenuOptionName(BuildContext context, NavigationMenuOption difficulty)
	{
    switch (difficulty) {
      case NavigationMenuOption.adaptive:
        return AppLocalizations.of(context).adaptive;
      case NavigationMenuOption.bottomNavigationBar:
        return AppLocalizations.of(context).bottomNavigationBar;
      case NavigationMenuOption.sidebar:
        return AppLocalizations.of(context).sidebar;
      default:
        return "Unknown difficulty";
    }
  }
}