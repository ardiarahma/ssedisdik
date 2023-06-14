import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ssedisdik/src/constants/colors.dart';

class SSETextTheme {
  static TextTheme lightTextTheme = TextTheme(
      displayMedium: GoogleFonts.montserrat(
          color: primaryColor.withOpacity(0.8), fontSize: 24),
      displaySmall: GoogleFonts.poppins(
          color: primaryColor.withOpacity(0.5), fontSize: 12));

  static TextTheme darkTextTheme = TextTheme(
      displayMedium:
          GoogleFonts.montserrat(color: Colors.white70, fontSize: 24),
      displaySmall: GoogleFonts.poppins(color: Colors.white60, fontSize: 12));
}
