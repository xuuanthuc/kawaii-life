import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wibu_life/utils/common/screen_util.dart';
import 'app_colors.dart';

final ThemeData lightThemeData = ThemeData(
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: Colors.black.withOpacity(0.1)
  ),
  accentColor: Colors.white.withOpacity(0),
  primaryColor: Colors.white,
  fontFamily: GoogleFonts.sarabun.toString(),
  backgroundColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  textTheme: TextTheme(
    headline6: GoogleFonts.sarabun(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  ),
);


final ThemeData darkThemeData = ThemeData(
  bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Colors.black.withOpacity(1)
  ),
  accentColor: Colors.white.withOpacity(1),
  primaryColor: Colors.blue,
  fontFamily: GoogleFonts.sarabun.toString(),
  scaffoldBackgroundColor: HexColor("#E5E5E5"),
  textTheme: TextTheme(
    headline6: GoogleFonts.sarabun(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  ),
);

final TextStyle cardTextStyle = TextStyle(
  color: Colors.black,
  fontSize: s(16),
  fontWeight: FontWeight.w700,
);

final TextStyle detailTextStyle = GoogleFonts.sarabun(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: Colors.black
);

TextStyle robotoW400(double size, Color color) => GoogleFonts.roboto(
  fontSize: size,
  fontWeight: FontWeight.w400,
  color: color
);
TextStyle robotoW500(double size, Color color) => GoogleFonts.roboto(
    fontSize: size,
    fontWeight: FontWeight.w500,
    color: color
);
TextStyle robotoW600(double size, Color color) => GoogleFonts.roboto(
    fontSize: size,
    fontWeight: FontWeight.w600,
    color: color
);
TextStyle robotoW700(double size, Color color) => GoogleFonts.roboto(
    fontSize: size,
    fontWeight: FontWeight.w700,
    color: color
);


