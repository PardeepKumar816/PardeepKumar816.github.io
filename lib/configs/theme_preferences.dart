import 'package:shared_preferences/shared_preferences.dart';

class ThemePreferences {
  const ThemePreferences();

  static const String prefKey = 'pref_key';

  Future<void> setTheme(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(prefKey, value);
  }

  Future<bool> getTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(prefKey) ?? true;
  }
}