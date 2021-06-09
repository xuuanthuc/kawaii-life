import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:wibu_life/modules/common/widgets/nav_bar.dart';
import 'package:wibu_life/themes/app_colors.dart';

class AnimeListScreen extends StatelessWidget {
  DateTime? currentBackPressTime;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Get.isDarkMode? darkModeBackgroundColor : lightModeBackgroundColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Get.isDarkMode? darkModeBackgroundColor : lightModeBackgroundColor,
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: NavBarDesign(),
          ),
        ),
      ),
      onWillPop: () async {
        DateTime now = DateTime.now();
        if (currentBackPressTime == null ||
            now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
          currentBackPressTime = now;
          Fluttertoast.showToast(
              msg: "Nhấn BACK lần nữa để thoát!",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.grey.shade700,
              textColor: Colors.white,
              fontSize: 11.0
          );
          return Future.value(false);
        }
        exit(0);
      },
    );
  }
}
