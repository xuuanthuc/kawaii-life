import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:wibu_life/modules/common/widgets/nav_bar.dart';
import 'package:wibu_life/modules/wall_paper/controllers/wall_paper_controller.dart';
import 'package:wibu_life/modules/wall_paper/views/wall_paper_list_type.dart';
import 'package:wibu_life/modules/wall_paper/views/widgets/body.dart';
import 'package:wibu_life/themes/app_colors.dart';
import 'package:wibu_life/themes/app_theme.dart';
import 'package:wibu_life/utils/common/screen_util.dart';
import 'package:wibu_life/utils/constants/locale_key.dart';

class WallPaperPage extends StatelessWidget {
  final WallPaperController wallPaperController = Get.find();
  DateTime? currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Get.isDarkMode? darkModeBackgroundColor : lightModeBackgroundColor,
          appBar: PreferredSize(
            child: AppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: Get.isDarkMode? darkModeBackgroundColor : lightModeBackgroundColor,
              title: NavBarDesign(),
            ),
            preferredSize: Size.fromHeight(h(65)),
          ),
          body: SingleChildScrollView(
            child: GetBuilder<WallPaperController>(
                init: wallPaperController,
                builder: (index) => Column(
                      children: [
                        // headerSelectCategoryWallpaper(),
                        WallpaperTitle(
                            title: LocaleKeys.ANIME,
                            onPress: () async {
                              Get.to(WallpaperListType());
                              await wallPaperController
                                  .selectTypeWallpaper(LocaleKeys.ANIME);
                            }),
                        WidgetListType(title: LocaleKeys.ANIME, image: '1'),
                        WallpaperTitle(
                            title: LocaleKeys.ANIME_GIRLS,
                            onPress: () async {
                              Get.to(WallpaperListType());
                              await wallPaperController
                                  .selectTypeWallpaper(LocaleKeys.ANIME_GIRLS);
                            }),
                        WidgetListType(title: LocaleKeys.ANIME_GIRLS, image: '2'),
                        WallpaperTitle(
                            title: LocaleKeys.ANIME_BOYS,
                            onPress: () async {
                              Get.to(WallpaperListType());
                              await wallPaperController
                                  .selectTypeWallpaper(LocaleKeys.ANIME_BOYS);
                            }),
                        WidgetListType(title: LocaleKeys.ANIME_BOYS, image: '3'),
                        WallpaperTitle(
                            title: LocaleKeys.ANIME_AESTHETIC,
                            onPress: () async {
                              Get.to(WallpaperListType());
                              await wallPaperController.selectTypeWallpaper(
                                  LocaleKeys.ANIME_AESTHETIC);
                            }),
                        WidgetListType(
                            title: LocaleKeys.ANIME_AESTHETIC, image: '4'),
                        WallpaperTitle(
                            title: LocaleKeys.ANIME_LOVE,
                            onPress: () async {
                              Get.to(WallpaperListType());
                              await wallPaperController
                                  .selectTypeWallpaper(LocaleKeys.ANIME_LOVE);
                            }),
                        WidgetListType(title: LocaleKeys.ANIME_LOVE, image: '5'),
                        SizedBox(
                          height: h(30),
                        ),
                      ],
                    )),
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

Widget WallpaperTitle({required String title, required VoidCallback onPress}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: w(30), vertical: h(20)),
    child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title.tr,
            style: robotoW700(s(20),Get.isDarkMode? darkModeTextColorWhite : lightModeTextColorBlack),
          ),
          Spacer(),
          IconButton(
            onPressed: onPress,
            icon: Icon(
              Icons.double_arrow_rounded,
              color:Get.isDarkMode? darkModePrimaryColor :  lightModePrimaryColor,
            ),
          )
        ],
      ),
    ),
  );
}
