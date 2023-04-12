import 'package:flutter/material.dart';
import 'package:sudoku_app/config.dart';
import 'package:sudoku_app/pages/gamepage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sudoku_app/pages/learning_page.dart';
import 'package:sudoku_app/screen_size_helpers.dart';
import 'package:sudoku_app/settings/navigatio_menu_setting.dart';
import 'package:sudoku_app/settings/navigation_menu_option.dart';
import 'package:sudoku_app/pages/settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  VoidCallback listener = () {};

	@override
	void initState() {
		super.initState();
    listener = () {
			setState(() {});
		};
    currentNavMenuSetting.addListener(listener);
	}

  @override
  void dispose() {
    currentNavMenuSetting.removeListener(listener);
    super.dispose();
  }

	int _selectedIndex = 0;
	static const List<Widget> _widgetOptions = <Widget>[
		GamePage(),
    LearningPage(),
		SettingsPage(),
	];
	void _onItemTapped(int index) {
		setState(() {
			_selectedIndex = index;
		});
	}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: getDrawer(context),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Visibility(
        visible: NavigationMenuSetting.currentSetting == NavigationMenuOption.bottomNavigationBar || (NavigationMenuSetting.currentSetting == NavigationMenuOption.adaptive && ScreenSizeHelpers.isVerticalOrientation(context)),
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: const Icon(Icons.grid_on), label: getMenuItemName(context, GamePage)),
            BottomNavigationBarItem(icon: const Icon(Icons.school), label: getMenuItemName(context, LearningPage)),
            BottomNavigationBarItem(icon: const Icon(Icons.settings), label: getMenuItemName(context, SettingsPage)),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  static String getMenuItemName(BuildContext context, Type menuItem) {
    switch (menuItem) {
      case GamePage:
        return AppLocalizations.of(context).menuItemGame;
      case LearningPage:
        return AppLocalizations.of(context).menuItemLearning;
      case SettingsPage:
        return AppLocalizations.of(context).menuItemSettings;
      default:
        return "Unknown menu item";
    }
  }

  Widget? getDrawer(BuildContext context) {
    if (NavigationMenuSetting.currentSetting == NavigationMenuOption.bottomNavigationBar || (NavigationMenuSetting.currentSetting == NavigationMenuOption.adaptive && ScreenSizeHelpers.isVerticalOrientation(context))) return null;
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(child: Text("Sudoku App")),
            ListTile(
              title: Row(children: [
                const Padding(padding: EdgeInsets.symmetric(horizontal: 10), child: Icon(Icons.grid_on)),
                Text(getMenuItemName(context, GamePage))
              ]),
              onTap: () {
                _onItemTapped(_widgetOptions.indexWhere((element) => element.runtimeType == GamePage));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Row(children: [
                const Padding(padding: EdgeInsets.symmetric(horizontal: 10), child: Icon(Icons.school)),
                Text(getMenuItemName(context, LearningPage))
              ]),
              onTap: () {
                _onItemTapped(_widgetOptions.indexWhere((element) => element.runtimeType == LearningPage));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Row(children: [
                const Padding(padding: EdgeInsets.symmetric(horizontal: 10), child: Icon(Icons.settings)),
                Text(getMenuItemName(context, SettingsPage))
              ]),
              onTap: () {
                _onItemTapped(_widgetOptions.indexWhere((element) => element.runtimeType == SettingsPage));
                Navigator.pop(context);
              },
            )
          ],
        ),
      );
  }
}