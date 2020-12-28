import 'package:flutter/material.dart';

enum ThemeType { DARK, LIGHT }

class ThemeState extends ChangeNotifier {
  bool isdarktheme = false;

  ThemeState() {
    getTheme().then((type) {
      isdarktheme = type == ThemeType.DARK;
      notifyListeners();
    });
  }
  ThemeType get theme => isdarktheme ? ThemeType.DARK : ThemeType.LIGHT;
  set theme(ThemeType type) => setTheme(type);

  void setTheme(ThemeType type) async {
    isdarktheme = type == ThemeType.DARK;
    notifyListeners();
  }

  Future<ThemeType> getTheme() async {
    return isdarktheme ? ThemeType.DARK : ThemeType.LIGHT;
  }
}
