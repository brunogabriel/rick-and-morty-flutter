import 'package:flutter/material.dart';

import 'app_theme.dart';

class AppThemeModel {
  AppThemeModel(
      {required this.theme, required this.themeData, required this.icon});

  final AppTheme theme;
  final ThemeData themeData;
  final Icon icon;
}
