import 'package:flutter/material.dart';
import 'package:protfolio/configs/theme_preferences.dart';

class ThemeModel extends ChangeNotifier {
  late bool _isDark;
  late ThemePreferences _themePreferences;
  bool get isDark => _isDark;

  ThemeModel() {
    _isDark = false;
    _themePreferences = ThemePreferences();
    getPreferences();
  }

  set isDark(bool value) {
    _isDark = value;
    _themePreferences.setTheme(value);
    notifyListeners();
  }

  getPreferences() async {
    _isDark = await _themePreferences.getTheme();
    notifyListeners();
  }
}
