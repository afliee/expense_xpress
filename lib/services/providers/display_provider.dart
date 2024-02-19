import 'package:expense_xpress/utils/contants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DisplayProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  set themeMode(ThemeMode value) {
    _themeMode = value;
    notifyListeners();
    SharedPreferences.getInstance().then((prefs) {
      prefs.setInt(Constants.theme, themeModeToInt(value));
    });
  }

  static int themeModeToInt(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.light:
        return 0;
      case ThemeMode.dark:
        return 1;
      case ThemeMode.system:
        return 2;
      default:
        return 2;
    }
  }

  static ThemeMode intToThemeMode(int value) {
    switch (value) {
      case 0:
        return ThemeMode.light;
      case 1:
        return ThemeMode.dark;
      case 2:
        return ThemeMode.system;
      default:
        return ThemeMode.system;
    }
  }
}