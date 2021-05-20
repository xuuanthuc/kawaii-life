import 'package:flutter/material.dart';

final Color white = Colors.white;
final Color black = Colors.black;
final Color redAccent = Colors.redAccent;
final HexColor deepIndigo = HexColor("#240066");
final HexColor primaryColor = HexColor("#F05555");
final HexColor primaryTextColor = HexColor("#222222");
final HexColor greyTextColor = HexColor("#6C6C6C");


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
