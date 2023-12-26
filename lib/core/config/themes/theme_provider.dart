import 'package:flutter/material.dart';
import 'package:noteit/core/config/themes/app_themes.dart';

enum Themes{
  dark,
  light,
}
extension ThemesExtension on Themes{

  getThemes(){
    switch(this) {
      case Themes.dark:
        AppTheme.dark;
        break;
      case Themes.light:
        AppTheme.light;
        break;
      default:
    }

  }
}

class ThemeProvider extends ChangeNotifier{

  bool isThemeChanged=false;

  changeTheme(){
    isThemeChanged=!isThemeChanged;
    notifyListeners();
  }


}