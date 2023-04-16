import 'package:flutter/material.dart';
import 'package:sudoku_app/config.dart';
import 'package:sudoku_app/pages/gamepage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sudoku_app/pages/learning_page.dart';
import 'package:sudoku_app/pages/techniques/sudoku_rules_page.dart';
import 'package:sudoku_app/screen_size_helpers.dart';
import 'package:sudoku_app/settings/navigation_menu_setting.dart';
import 'package:sudoku_app/settings/navigation_menu_option.dart';
import 'package:sudoku_app/pages/settings_page.dart';
import 'package:sudoku_app/settings/shared_preferences_manager.dart';

class HomePage extends StatefulWidget {
  final Future<bool> firstRun;

  const HomePage({super.key, required this.firstRun});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  VoidCallback listener = () {};
  bool checkFirstRun = true;

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
	static final List<Widget> _widgetOptions = <Widget>[
		const GamePage(),
    const LearningPage(),
		const SettingsPage(),
	];
	void _onItemTapped(int index) {
		setState(() {
			_selectedIndex = index;
		});
	}
  @override
  Widget build(BuildContext context) {
    if (checkFirstRun) {
      widget.firstRun.then((value) {
        if (value) {
          List<Locale> systemLocales = WidgetsBinding.instance.window.locales;
          for (var locale in systemLocales) {
            if (AppLocalizations.supportedLocales.any((sl) => sl.languageCode == locale.languageCode)) {
              currentLocale.changeCurrentLocale(AppLocalizations.supportedLocales.firstWhere((sl) => sl.languageCode == locale.languageCode));
              SharedPreferencesManager.updateCurrentLocaleInPrefs();
              break;
            }
          }
          showDialog<void>(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(AppLocalizations.of(context).welcome),
                content: Text(AppLocalizations.of(context).seeBasics),
                actions: <Widget>[
                  TextButton(
                    child: Text(AppLocalizations.of(context).yes),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SudokuRulesTechniquePage()));
                    },
                  ),
                  TextButton(
                    child: Text(AppLocalizations.of(context).no),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        }
      });
      checkFirstRun = false;
    }
    return Scaffold(
      drawer: getDrawer(context),
      appBar: AppBar(
        title: Text(getMenuItemName(context, _widgetOptions[_selectedIndex].runtimeType)),
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