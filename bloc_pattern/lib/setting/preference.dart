import 'dart:convert';

import 'package:bloc_pattern/setting/app_theme.dart';
import 'package:bloc_pattern/setting/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  //
  static SharedPreferences preference;
  static const String KEY_SELECTED_THEME = 'key_selected_theme';

  static init() async {
    preference = await SharedPreferences.getInstance();
  }

  static void saveTheme(Apptheme selectedtehme) async {
    if (null == selectedtehme) {
      selectedtehme = Apptheme.lightTheme;
    }
    String theme = jsonEncode(selectedtehme.toString());
    preference.setString(KEY_SELECTED_THEME, theme);
  }

  static Apptheme gettheme() {
    String theme = preference.getString(KEY_SELECTED_THEME);
    if (null == theme) {
      return Apptheme.lightTheme;
    }
    return getthemefromstring(jsonDecode(theme));
  }

  static Apptheme getthemefromstring(String themestring) {
    for (Apptheme theme in Apptheme.values) {
      if (theme.toString() == themestring) {
        return theme;
      }
    }
    return null;
  }
}
