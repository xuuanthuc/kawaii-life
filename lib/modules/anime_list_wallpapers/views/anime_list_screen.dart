import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:wibu_life/app_papes.dart';
import 'package:wibu_life/modules/anime_list_wallpapers/controllers/anime_list_controller.dart';
import 'package:wibu_life/modules/common/widgets/nav_bar.dart';
import 'package:wibu_life/themes/app_colors.dart';
import 'package:wibu_life/utils/constants/locale_key.dart';

class AnimeListScreen extends StatelessWidget {
  final AnimeListController animeListController = Get.find();
  DateTime? currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Get.isDarkMode
              ? darkModeBackgroundColor
              : lightModeBackgroundColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Get.isDarkMode
                ? darkModeBackgroundColor
                : lightModeBackgroundColor,
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: NavBarDesign(),
          ),
          body: Container(
            child: GridView.count(
              crossAxisCount: 3,
              children: [
                animeListTileWidget(title: '${LocaleKeys.ONE_PIECE}'),
                animeListTileWidget(title: '${LocaleKeys.DRAGON_BALL}'),
              ],
            ),
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
              fontSize: 11.0);
          return Future.value(false);
        }
        exit(0);
      },
    );
  }

  Widget animeListTileWidget({
    required String title,
  }) {
    return GestureDetector(
      onTap: () async {
        Get.toNamed(Routes.ANIME_LIST_TILE, arguments: [title]);
        await animeListController.selectAnimeList(title);
      },
      child: Container(
        child: Text(
          title.tr,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
