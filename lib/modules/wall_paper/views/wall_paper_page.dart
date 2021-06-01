import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
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
            style: robotoW700(s(20), primaryTextColor),
          ),
          Spacer(),
          IconButton(
            onPressed: onPress,
            icon: Icon(
              Icons.double_arrow_rounded,
              color: primaryColor,
            ),
          )
        ],
      ),
    ),
  );
}
