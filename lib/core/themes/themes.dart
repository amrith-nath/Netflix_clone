import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/colors.dart';

class Themes {
  static final themeData = ThemeData(
    fontFamily: GoogleFonts.inter().fontFamily,
    primarySwatch: primarySwatch,
    scaffoldBackgroundColor: backgroundColor,
    textTheme: const TextTheme(
      bodyText1: TextStyle(color: Colors.white),
      bodyText2: TextStyle(color: Colors.white),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: backgroundColor,
      selectedItemColor: whiteColor,
      unselectedItemColor: Colors.grey,
      selectedIconTheme: const IconThemeData(color: Colors.white, size: 30),
      unselectedIconTheme: IconThemeData(color: Colors.grey.shade700, size: 30),
      selectedLabelStyle: const TextStyle(fontSize: 11, height: 1.5),
      unselectedLabelStyle: const TextStyle(fontSize: 11, height: 1.5),
    ),
    appBarTheme:
        const AppBarTheme(backgroundColor: backgroundColor, elevation: 0),
  );
}
