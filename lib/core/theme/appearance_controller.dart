import 'package:flutter/material.dart';

/// Estado compartido del modo de apariencia. No persiste entre reinicios.
class AppearanceController extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  void setThemeMode(ThemeMode mode) {
    if (_themeMode == mode) return;
    _themeMode = mode;
    notifyListeners();
  }
}
