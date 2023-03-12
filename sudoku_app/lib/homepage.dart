import 'package:flutter/material.dart';
import 'package:sudoku_app/locale/current_locale.dart';
import 'package:sudoku_app/locale/locale_language_name.dart';
import 'package:sudoku_app/theme/app_theme.dart';
import 'package:sudoku_app/theme/current_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'config.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
	setState(() {
	  // This call to setState tells the Flutter framework that something has
	  // changed in this State, which causes it to rerun the build method below
	  // so that the display can reflect the updated values. If we changed
	  // _counter without calling setState(), then the build method would not be
	  // called again, and so nothing would appear to happen.
	  _counter++;
	});
  }

  @override
  Widget build(BuildContext context) {
	// This method is rerun every time setState is called, for instance as done
	// by the _incrementCounter method above.
	//
	// The Flutter framework has been optimized to make rerunning build methods
	// fast, so that you can just rebuild anything that needs updating rather
	// than having to individually change instances of widgets.
	return Scaffold(
	  body: Center(
		// Center is a layout widget. It takes a single child and positions it
		// in the middle of the parent.
		child: Column(
		  // Column is also a layout widget. It takes a list of children and
		  // arranges them vertically. By default, it sizes itself to fit its
		  // children horizontally, and tries to be as tall as its parent.
		  //
		  // Invoke "debug painting" (press "p" in the console, choose the
		  // "Toggle Debug Paint" action from the Flutter Inspector in Android
		  // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
		  // to see the wireframe for each widget.
		  //
		  // Column has various properties to control how it sizes itself and
		  // how it positions its children. Here we use mainAxisAlignment to
		  // center the children vertically; the main axis here is the vertical
		  // axis because Columns are vertical (the cross axis would be
		  // horizontal).
		  mainAxisAlignment: MainAxisAlignment.center,
		  children: <Widget>[
			Text(
			  AppLocalizations.of(context).helloWorld
			),
			const Text(
			  'You have pushed the button this many times:',
			),
			Text(
			  '$_counter',
			  style: Theme.of(context).textTheme.headlineMedium,
			),
		  ],
		),
	  ),
	  floatingActionButton: FloatingActionButton(
		onPressed: _incrementCounter,
		tooltip: 'Increment',
		child: const Icon(Icons.add),
	  ),
	);
  }
}