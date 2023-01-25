import 'package:flutter/material.dart';

import 'data/app_theme.dart';
import 'data/app_theme_model.dart';

class ApplicationTheme {
  static final themes = {
    AppTheme.light: AppThemeModel(
      theme: AppTheme.light,
      themeData: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        cardTheme: const CardTheme(elevation: 4.0),
      ),
    ),
    AppTheme.dark: AppThemeModel(
      theme: AppTheme.dark,
      themeData: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
    ),
  };
}
