import 'package:flutter/material.dart';
import 'package:news_app/utils/app_theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData currentTheme = AppTheme.lightTheme;

  void changeLocale(ThemeData theme) {
    if (theme == currentTheme) {
      return;
    }
    currentTheme = theme;

    notifyListeners();
  }

  bool isDarkMode() {
    return currentTheme == AppTheme.darkTheme;
  }
}
