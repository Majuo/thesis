import 'package:flutter/material.dart';

class AppThemeData {

	AppThemeData._();

	static final ThemeData lightTheme = ThemeData(
		useMaterial3: true,
		colorScheme: const ColorScheme.light()
	);

	static final ThemeData darkTheme = ThemeData(
		useMaterial3: true,
		colorScheme: const ColorScheme.dark()
	);
}