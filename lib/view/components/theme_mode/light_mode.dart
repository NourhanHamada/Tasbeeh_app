import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/my_colors.dart';

buildLightMode(context) {
  return ThemeData(
    scaffoldBackgroundColor: MyColors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: GoogleFonts.cairo(
        textStyle: TextStyle(fontSize: 20, color: MyColors.black),
      ),
      iconTheme: IconThemeData(color: MyColors.black),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: MyColors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: MyColors.white,
      elevation: 0,
    ),
    textTheme: GoogleFonts.cairoTextTheme(Theme.of(context).textTheme)
        .apply()
        .copyWith(
          bodyMedium: TextStyle(
            color: MyColors.black,
            fontSize: 20,
          ),
        ),
  );
}
