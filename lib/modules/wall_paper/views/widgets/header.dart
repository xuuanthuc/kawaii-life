import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wibu_life/modules/wall_paper/controllers/wall_paper_controller.dart';
import 'package:wibu_life/themes/app_colors.dart';
import 'package:wibu_life/themes/app_theme.dart';
import 'package:wibu_life/utils/common/screen_util.dart';
import 'package:wibu_life/utils/constants/locale_key.dart';

Widget headerSelectCategoryWallpaper() {
  final WallPaperController wallPaperController = Get.find();
  return Obx(()=>
      Container(
    height: h(50),
    padding: EdgeInsets.only(right: w(30)),
    child: ListView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      children: [
        typeWallpaperWidget(
          wallPaperController,
          title: LocaleKeys.ANIME,
          color: wallPaperController.animeSelect.value? Get.isDarkMode? darkModePrimaryColor : lightModePrimaryColor : Colors.grey,
        ),
        typeWallpaperWidget(
          wallPaperController,
          title: LocaleKeys.ANIME_GIRLS,
          color: wallPaperController.animeGirlSelect.value?  Get.isDarkMode? darkModePrimaryColor : lightModePrimaryColor : Colors.grey,

        ),
        typeWallpaperWidget(
          wallPaperController,
          title: LocaleKeys.ANIME_BOYS,
          color: wallPaperController.animeBoySelect.value?  Get.isDarkMode? darkModePrimaryColor : lightModePrimaryColor : Colors.grey,

        ),
        typeWallpaperWidget(
          wallPaperController,
          title: LocaleKeys.ANIME_AESTHETIC,
          color: wallPaperController.animeAestheticSelect.value?  Get.isDarkMode? darkModePrimaryColor : lightModePrimaryColor : Colors.grey,

        ),
        typeWallpaperWidget(
          wallPaperController,
          title: LocaleKeys.ANIME_LOVE,
          color: wallPaperController.animeLoveSelect.value?  Get.isDarkMode? darkModePrimaryColor : lightModePrimaryColor : Colors.grey,

        ),
      ],
    ),
  ));
}

Widget typeWallpaperWidget(
  WallPaperController wallPaperController, {
  required String title,
      required Color color,
}) {
  return GestureDetector(
    onTap: () {
      wallPaperController.selectTypeWallpaper(title);
    },
    child: Container(
      color: Get.isDarkMode? darkModeBackgroundColor : lightModeBackgroundColor,
      child: Padding(
        padding: EdgeInsets.only(right: w(30)),
        child: Center(
          child: Text(
            title.tr,
            style: robotoW600(
              s(14),
              color
            ),
          ),
        ),
      ),
    ),
  );
}
