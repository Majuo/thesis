import 'package:flutter/material.dart';
import 'package:sudoku_app/config.dart';
import 'package:sudoku_app/homepage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sudoku_app/locale/current_locale.dart';
import 'package:sudoku_app/settings/settings_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
	const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

	int _selectedIndex = 0;
	static const List<Widget> _widgetOptions = <Widget>[
		HomePage(),
		SettingsPage(),
	];
	void _onItemTapped(int index) {
		setState(() {
			_selectedIndex = index;
		});
	}
	@override
	void initState() {
		super.initState();
		currentTheme.addListener(() {
			setState(() {});
		});
		currentLocale.addListener(() {
			setState(() {});
		});
	}

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Flutter Demo',
			localizationsDelegates: AppLocalizations.localizationsDelegates,
			supportedLocales: AppLocalizations.supportedLocales,
			locale: CurrentLocale.currentLocale,
			theme: currentTheme.getThemeData(),
			home: Scaffold(
				appBar: AppBar(
					title: const Text("Sudoku App"),
				),
				body: Center(
					child: _widgetOptions.elementAt(_selectedIndex),
				),
				bottomNavigationBar: BottomNavigationBar(
					items: const <BottomNavigationBarItem>[
						BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
						BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
					],
					currentIndex: _selectedIndex,
					onTap: _onItemTapped,
				),
			),
		);
	}
}