import 'package:flutter/material.dart';

final Color white = Colors.white;
final Color black = Colors.black;
final Color redAccent = Colors.redAccent;
final HexColor deepIndigo = HexColor("#240066");
// final HexColor primaryColor = HexColor("#F05555");
final HexColor primaryColor = HexColor("#F05555");
final HexColor primaryTextColor = HexColor("#222222");
final HexColor greyTextColor = HexColor("#6C6C6C");
final HexColor primaryColorShade100 = HexColor("#FFFFCDD2");


class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

const shimmerGradient = LinearGradient(
  colors: [
    Color(0xFFEFEFEF),
    Color(0xFFFDF9F9),
    Color(0xFFEFEFEF),
  ],
  stops: [
    0.1,
    0.3,
    0.4,
  ],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);
