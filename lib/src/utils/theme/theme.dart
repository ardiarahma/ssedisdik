import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ssedisdik/src/constants/colors.dart';
import 'package:ssedisdik/src/utils/theme/widget_theme/text_theme.dart';

class SSETheme {
  SSETheme._();

  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      textTheme: SSETextTheme.lightTextTheme,
      elevatedButtonTheme:
          ElevatedButtonThemeData(style: ElevatedButton.styleFrom()));

  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark, textTheme: SSETextTheme.darkTextTheme);
}
