import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  String languageCode = "en";
  ThemeMode themeMode = ThemeMode.light;

  void changeLanguage(String code) {
    languageCode = code;
    notifyListeners();
  }
  void changeTheme(ThemeMode mode){
    themeMode=mode;
    notifyListeners();
  }
}
