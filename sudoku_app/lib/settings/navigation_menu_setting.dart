import 'package:flutter/material.dart';
import 'package:sudoku_app/settings/navigation_menu_option.dart';

class NavigationMenuSetting with ChangeNotifier {
	static NavigationMenuOption currentSetting = NavigationMenuOption.sidebar;

	changeCurrentNavMenuSetting(NavigationMenuOption setting) {
		currentSetting = setting;
		notifyListeners();
	}
}