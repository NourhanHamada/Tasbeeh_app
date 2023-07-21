import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/my_colors.dart';

buildDarkMode(context) {
  return ThemeData(
    scaffoldBackgroundColor: MyColors.black,
    appBarTheme: AppBarTheme(
      backgroundColor: MyColors.black,
      elevation: 0,
      titleTextStyle: GoogleFonts.cairo(
        textStyle: TextStyle(
          fontSize: 20,
          color: MyColors.white,
        ),
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: MyColors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: MyColors.black,
      elevation: 0,
    ),
    textTheme: GoogleFonts.cairoTextTheme(Theme.of(context).textTheme)
        .apply()
        .copyWith(
          bodyMedium: TextStyle(
            color: MyColors.white,
            fontSize: 20,
          ).apply(),
        ),
  );
}
