import 'package:flutter/material.dart';
import 'package:sudoku_app/gamepage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sudoku_app/learning_page.dart';
import 'package:sudoku_app/settings/settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              title: Text("Item 1"),
              onTap: () {},
            ),
            ListTile(
              title: Text("Item 2"),
              onTap: () {},
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("Sudoku App"),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.grid_on), label: getMenuItemName(context, GamePage)),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: getMenuItemName(context, LearningPage)),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: getMenuItemName(context, SettingsPage)),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
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
}