import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wibu_life/themes/app_colors.dart';
import 'package:wibu_life/utils/common/screen_util.dart';
import 'package:wibu_life/utils/constants/locale_key.dart';
import 'package:get/get.dart';
RichText logoText() {
  return RichText(
    text: TextSpan(
        text: LocaleKeys.hello.tr,
        style: GoogleFonts.josefinSlab(
            color: Get.isDarkMode? darkModePrimaryColor :lightModePrimaryColor,
            fontSize: s(30),
            fontWeight: FontWeight.w800),
        children: [
          TextSpan(
              text: '.', style: GoogleFonts.oswald(fontSize: s(50), color: Colors.orange)
          )
        ]
    ),
  );
}