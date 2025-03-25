import 'package:arjun_portfolio/utils/index_utils.dart';
import 'package:flutter/material.dart';

class ThemeUtils {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: ColorPlattes.light,
    useMaterial3: true,
    fontFamily: FontClass.raleway,
    elevatedButtonTheme: ButttonThemeUtil.elevatedLight,
    outlinedButtonTheme: ButttonThemeUtil.outlineLight,
    textButtonTheme: ButttonThemeUtil.textLight,
    iconButtonTheme: ButttonThemeUtil.iconLight,
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: ColorPlattes.dark,
    useMaterial3: true,
    fontFamily: FontClass.raleway,
    elevatedButtonTheme: ButttonThemeUtil.elevatedDark,
    outlinedButtonTheme: ButttonThemeUtil.outlineDark,
    textButtonTheme: ButttonThemeUtil.textDark,
    iconButtonTheme: ButttonThemeUtil.iconDark,
  );
}
