import 'package:flutter/material.dart';

final Color white = Colors.white;
final Color black = Colors.black;
final Color redAccent = Colors.redAccent;
final HexColor deepIndigo = HexColor("#240066");
// final HexColor primaryColor = HexColor("#F05555");
//TODO: Light mode
final HexColor lightModePrimaryColor = HexColor("#F05555");
final HexColor lightModeTextColorBlack = HexColor("#222222");
final HexColor lightModeTextColorGrey = HexColor("#6C6C6C");
final HexColor lightModePrimaryColorShade100 = HexColor("#FFFFCDD2");
final HexColor lightModeBackgroundColor = HexColor("#ffffff");
//TODO: Dark mode
final HexColor darkModeBackgroundColor = HexColor("#18191a");
final HexColor darkModeBackgroundCard = HexColor("#242526");
final HexColor darkModePrimaryColor = HexColor("#FFFFFFFF");
final HexColor darkModeTextColorWhite = HexColor("#FFFFFFFF");
final HexColor darkModeTextColorGrey = HexColor("#b0b3b8");
final HexColor darkModePrimaryColorShade100 = HexColor("#b0b3b8");




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
