import 'package:flutter/material.dart';
import 'package:sudoku_app/config.dart';
import 'package:sudoku_app/theme/app_theme.dart';

import '../theme/current_theme.dart';

class SettingsPage extends StatelessWidget {
	const SettingsPage({super.key});

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: Column(
				children: [
					SizedBox(
						width: 200,
						height: 50,
						child: Text('zhopa')
/* 						DropdownButton<AppTheme>(
							value: CurrentTheme.currentTheme,
							onChanged: (AppTheme? value) {
								currentTheme.changeCurrentTheme(value ?? AppTheme.light);
							},
							items: AppTheme.values.map<DropdownMenuItem<AppTheme>>((AppTheme value) {
								return DropdownMenuItem<AppTheme>(
									value: value,
									child: Text(value.name)
								);
							}).toList()
						), */
					)
				],
			),
		);
	}
}