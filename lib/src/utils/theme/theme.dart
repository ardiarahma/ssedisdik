import 'package:flutter/material.dart';
import 'package:ssedisdik/src/utils/theme/widget_theme/text_theme.dart';

import '../../constants/colors.dart';

class SSETheme {
  SSETheme._();

  static ThemeData lightTheme = ThemeData(
      colorScheme: const ColorScheme.light(primary: primaryColor),
      brightness: Brightness.light,
      textTheme: SSETextTheme.lightTextTheme,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(backgroundColor: buttonColor)));

  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark, textTheme: SSETextTheme.darkTextTheme);
}
