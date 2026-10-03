import 'package:flutter/material.dart';
import 'package:protfolio/configs/theme_preferences.dart';

class ThemeModel extends ChangeNotifier {
  ThemeModel(this._preferences);

  final ThemePreferences _preferences;
  bool _isDark = true;

  bool get isDark => _isDark;

  ThemeMode get themeMode => _isDark ? ThemeMode.dark : ThemeMode.light;

  Future<void> load() async {
    _isDark = await _preferences.getTheme();
    notifyListeners();
  }

  Future<void> toggle() async {
    _isDark = !_isDark;
    notifyListeners();
    await _preferences.setTheme(_isDark);
  }
}
