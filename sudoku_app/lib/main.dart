import 'package:flutter/material.dart';
import 'package:sudoku_app/config.dart';
import 'package:sudoku_app/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
	const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

	@override
	void initState() {
    super.initState();
	currentTheme.addListener(() {
		setState(() {});
	});
  }

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Flutter Demo',
			theme: currentTheme.getThemeData(),
			home: const MyHomePage(title: 'Flutter Demo Home Page'),
		);
	}
}