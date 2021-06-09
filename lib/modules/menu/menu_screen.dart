import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wibu_life/app_papes.dart';
import 'package:wibu_life/modules/common/controllers/dark_light_controller.dart';
import 'package:wibu_life/modules/common/widgets/nav_bar.dart';
import 'package:wibu_life/modules/common/controllers/navbar_controller.dart';
import 'package:wibu_life/modules/home_news/controllers/news_controller.dart';
import 'package:wibu_life/modules/wall_paper/controllers/wall_paper_controller.dart';
import 'package:wibu_life/modules/wall_paper/views/wall_paper_list_type.dart';
import 'package:wibu_life/themes/app_colors.dart';
import 'package:wibu_life/themes/app_icon.dart';
import 'package:wibu_life/themes/app_theme.dart';
import 'package:wibu_life/themes/app_theme_service.dart';
import 'package:wibu_life/utils/common/screen_util.dart';
import 'package:wibu_life/utils/constants/locale_key.dart';

class MenuScreen extends StatelessWidget {

  final WallPaperController wallPaperController = Get.find();

  final NewsController newsController = Get.find();

  final NavController navController = Get.find();

  final DarkLightController darkLightController = Get.put(DarkLightController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:  Get.isDarkMode? darkModeBackgroundColor : lightModeBackgroundColor,
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back),
            color:  Get.isDarkMode? darkModePrimaryColor : lightModePrimaryColor,
          ),
          backgroundColor:  Get.isDarkMode? darkModeBackgroundColor : lightModeBackgroundColor,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: w(30)),
          child: ListView(
            children: [
              titlePageDesign(icon.fire_solid ,LocaleKeys.NEWS),
              categoryNewsOnMenuButton( title:  LocaleKeys.ANIME_NEWS, image: icon.anime_news),
              categoryNewsOnMenuButton( title:  LocaleKeys.MANGA_NEWS, image: icon.manga_news),
              categoryNewsOnMenuButton( title:  LocaleKeys.COSPLAY, image: icon.cosplay_news),
              categoryNewsOnMenuButton( title:  LocaleKeys.NOMINATION, image: icon.nomination_news),
              categoryNewsOnMenuButton( title:  LocaleKeys.FIGURE, image: icon.figure_news),
              Divider(),
              SizedBox(height: h(10),),
              titlePageDesign( icon.wallpapers_solid,LocaleKeys.WALLPAPER),
              categoryWallpaperOnMenuButton(title: LocaleKeys.ANIME, image: icon.anime),
              categoryWallpaperOnMenuButton(title: LocaleKeys.ANIME_GIRLS, image: icon.anime_girls),
              categoryWallpaperOnMenuButton(title: LocaleKeys.ANIME_BOYS, image: icon.anime_boys),
              categoryWallpaperOnMenuButton(title: LocaleKeys.ANIME_AESTHETIC, image: icon.anime_aesthetic),
              categoryWallpaperOnMenuButton(title: LocaleKeys.ANIME_LOVE, image: icon.anime_love),
              Divider(),
              switchDarkLightModeButton(),

            ],
          ),
        ),
      ),
    );
  }

  Row switchDarkLightModeButton() {
    return Row(
              children: [
                SizedBox(width: w(18),),
                TextButton(child:
                Row(
                  children: [
                    Text( Get.isDarkMode? LocaleKeys.LIGHT.tr : LocaleKeys.DARK.tr, style: robotoW600(s(16), Get.isDarkMode? darkModePrimaryColor: lightModePrimaryColor),),
                  ],
                ),
                  onPressed: () {
                    ThemeService().changeThemeMode();
                    // Get.isDarkMode? Get.changeTheme(lightMode) : Get.changeTheme(darkMode);
                  },
                ),
                Spacer(),
                GestureDetector(
                  onTap: (){
                    ThemeService().changeThemeMode();
                  },
                  child: Container(
                      width: h(50),
                      height: h(50),
                      child: Image.asset(Get.isDarkMode? icon.moon:  icon.sun,fit: BoxFit.fill,)),
                ),
                SizedBox(width: w(20),),
              ],
            );
  }

  Widget categoryWallpaperOnMenuButton({required String title, required String image}) {
    return GestureDetector(
      onTap: () async {
        Get.toNamed(Routes.WALL_PAPER);
        navController.selectAnimeListWallpaper();
        Get.to(WallpaperListType());
        await wallPaperController
            .selectTypeWallpaper(title);
      },
      child: Container(
        height: 50,
                child: Row(
                  children: [
                    SizedBox(width: w(20),),
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(r(50)),
                        ),
                        height: h(30),
                        width: h(30),
                        child: ClipRRect(borderRadius: BorderRadius.circular(r(50)),child: Image.asset(image, fit: BoxFit.fitHeight,))),
                    SizedBox(width: w(20),),
                    Text(title.tr, style: robotoW500(s(14), Get.isDarkMode? darkModeTextColorWhite : lightModeTextColorBlack),),
                  ],
                ),
              ),
    );
  }

  Widget titlePageDesign(String icon, String title) {
    return Container(
      decoration: BoxDecoration(
        // color: primaryColor,
        borderRadius: BorderRadius.circular(r(10)),
      ),
      height: 50,
      child: Row(
        children: [
          SizedBox(width: w(20),),
          SvgPicture.asset(icon, color:  Get.isDarkMode? darkModePrimaryColor : lightModePrimaryColor,),
          SizedBox(width: w(20),),
          Text(title.tr, style: robotoW700(s(19),  Get.isDarkMode? darkModePrimaryColor : lightModePrimaryColor),),
        ],
      ),
        );
  }

  Widget categoryNewsOnMenuButton({required String title, required String image}) {
    return GestureDetector(
      onTap: () async {
        navController.selectNews();
        Get.toNamed(Routes.HOME);
        await newsController.selectNewsCategories(title);
      },
      child: Container(
        height: 50,
        child: Row(
          children: [
            SizedBox(width: w(20),),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(r(50)),
              ),
              height: h(30),
                width: h(30),
                child: ClipRRect(borderRadius: BorderRadius.circular(r(50)),child: Image.asset(image, fit: BoxFit.fitHeight,))),
            SizedBox(width: w(20),),
            Text(
              title.tr,style: robotoW500(s(14),  Get.isDarkMode? darkModeTextColorWhite : lightModeTextColorBlack),
            ),
          ],
        ),
      ),
    );
  }
}
