import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDark = false;

  bool get getThemeMode => isDark;

  void toggleTheme(bool value) {
    isDark = value;
    notifyListeners();
  }
}
