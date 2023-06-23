import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ssedisdik/src/constants/colors.dart';

class SSETextTheme {
  static TextTheme lightTextTheme = TextTheme(
      displayLarge: GoogleFonts.poppins(color: primaryColor, fontSize: 24),
      displayMedium: GoogleFonts.poppins(color: primaryColor, fontSize: 18),
      displaySmall: GoogleFonts.poppins(
          color: primaryColor.withOpacity(0.8), fontSize: 12),
      bodySmall: GoogleFonts.poppins(
          color: primaryColor, fontSize: 12, fontWeight: FontWeight.w600));

  static TextTheme darkTextTheme = TextTheme(
      displayLarge: GoogleFonts.poppins(color: Colors.white, fontSize: 24),
      displayMedium: GoogleFonts.poppins(color: Colors.white70, fontSize: 18),
      displaySmall: GoogleFonts.poppins(color: Colors.white60, fontSize: 12));
}
