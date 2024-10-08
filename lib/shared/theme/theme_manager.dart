import 'package:flutter/material.dart';
import 'package:perfection_structure/shared/theme/theme_dark.dart';
import 'package:perfection_structure/shared/theme/theme_light.dart';

abstract class IThemeManager {
  late ThemeData currentTheme;
  void changeTheme(ThemeEnum theme);
  void switchTheme();
}

enum ThemeEnum { DARK, LIGHT }

class ThemeManager extends ChangeNotifier implements IThemeManager {
  static ThemeManager? _instance;
  static ThemeManager get instance {
    _instance ??= ThemeManager._init();
    return _instance!;
  }

  ThemeManager._init();

  @override
  ThemeData currentTheme = ThemeEnum.LIGHT.generateTheme;
  ThemeEnum currentThemeEnum = ThemeEnum.LIGHT;

  @override
  void changeTheme(ThemeEnum newTheme) {
    if (newTheme != currentThemeEnum) {
      currentTheme = newTheme.generateTheme;
      currentThemeEnum = newTheme;
      notifyListeners();
    }
    return;
  }

  @override
  void switchTheme() {
    if(ThemeManager.instance.currentThemeEnum == ThemeEnum.LIGHT){
      currentTheme=ThemeEnum.DARK.generateTheme;
      currentThemeEnum=ThemeEnum.DARK;
    }else{
      currentTheme=ThemeEnum.LIGHT.generateTheme;
      currentThemeEnum=ThemeEnum.LIGHT;
    }
    notifyListeners();
  }
}

extension ThemeEnumExtension on ThemeEnum {
  ThemeData get generateTheme {
    switch (this) {
      case ThemeEnum.LIGHT:
        return ThemeLight.instance.theme!;
      case ThemeEnum.DARK:
        return ThemeDark.instance.theme!;
      default:
        return ThemeLight.instance.theme!;
    }
  }
}