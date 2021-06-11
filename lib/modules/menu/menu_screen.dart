import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wibu_life/app_papes.dart';
import 'package:wibu_life/modules/anime_list_wallpapers/controllers/anime_list_controller.dart';
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

  final AnimeListController animeListController = Get.find();

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
              switchDarkLightModeButton(),
              Divider(),
              titlePageDesign(icon.fire_solid ,LocaleKeys.NEWS),
              categoryNewsOnMenuButton( title:  LocaleKeys.ANIME_NEWS, image: icon.anime_news),
              categoryNewsOnMenuButton( title:  LocaleKeys.MANGA_NEWS, image: icon.manga_news),
              categoryNewsOnMenuButton( title:  LocaleKeys.COSPLAY, image: icon.cosplay_news),
              categoryNewsOnMenuButton( title:  LocaleKeys.NOMINATION, image: icon.nomination_news),
              categoryNewsOnMenuButton( title:  LocaleKeys.FIGURE, image: icon.figure_news),
              Divider(),
              SizedBox(height: h(10),),
              titlePageDesign( icon.folder_solid,LocaleKeys.WALLPAPER),
              categoryWallpaperOnMenuButton(title: LocaleKeys.ANIME, image: icon.anime),
              categoryWallpaperOnMenuButton(title: LocaleKeys.ANIME_GIRLS, image: icon.anime_girls),
              categoryWallpaperOnMenuButton(title: LocaleKeys.ANIME_BOYS, image: icon.anime_boys),
              categoryWallpaperOnMenuButton(title: LocaleKeys.ANIME_AESTHETIC, image: icon.anime_aesthetic),
              categoryWallpaperOnMenuButton(title: LocaleKeys.ANIME_LOVE, image: icon.anime_love),
              Divider(),
              titlePageDesign( icon.wallpapers_solid,LocaleKeys.ANIMELIST),
              animeListTileWidget(title: '${LocaleKeys.ONE_PIECE}', image: icon.anime_onepiece),
              animeListTileWidget(title: '${LocaleKeys.DRAGON_BALL}',image: icon.anime_dragonball),
              animeListTileWidget(title: '${LocaleKeys.NARUTO}',image: icon.anime_naruto ),
              animeListTileWidget(title: '${LocaleKeys.BOKU_NO_HERO}',image: icon.anime_bokunohero),
              animeListTileWidget(title: '${LocaleKeys.DR_STONE}',image: icon.anime_drstone),
              animeListTileWidget(title: '${LocaleKeys.DEMON_SLAYER}',image: icon.anime_demonslayer),
              animeListTileWidget(title: '${LocaleKeys.BORUTO}',image: icon.anime_boruto),
              animeListTileWidget(title: '${LocaleKeys.FIRE_FORCE}',image: icon.anime_fireforce),
              animeListTileWidget(title: '${LocaleKeys.TOKYO_GHOUL}',image: icon.anime_tokyoghoul),
              animeListTileWidget(title: '${LocaleKeys.FAIRY_TAIL}',image: icon.anime_fairytail),
              animeListTileWidget(title: '${LocaleKeys.NANATSU_NO_TAIZAI}',image: icon.anime_nanatsunotaizai),
              animeListTileWidget(title: '${LocaleKeys.BLACK_CLOVER}',image: icon.anime_blackclover),
              animeListTileWidget(title: '${LocaleKeys.ZERO_TWO}',image: icon.anime_darlinginthefranxx),
              animeListTileWidget(title: '${LocaleKeys.BLEACH}',image: icon.anime_bleach),
              animeListTileWidget(title: '${LocaleKeys.ATTACH_ON_TITAN}',image: icon.anime_attackontitan),
              animeListTileWidget(title: '${LocaleKeys.ONE_PUNCH_MAN}',image: icon.anime_onepunchman),
              animeListTileWidget(title: '${LocaleKeys.KUROKO_NO_BASKET}',image: icon.anime_kurokonobasket),
              animeListTileWidget(title: '${LocaleKeys.GINTAMA}',image: icon.anime_gintama),
              animeListTileWidget(title: '${LocaleKeys.OVERLORD}',image: icon.anime_overlord),
              animeListTileWidget(title: '${LocaleKeys.SWORD_ART_ONLINE}',image: icon.anime_swordartonline),
              animeListTileWidget(title: '${LocaleKeys.RE_ZERO}',image: icon.anime_rezero),
              animeListTileWidget(title: '${LocaleKeys.NO_GAME_NO_LIFE}',image: icon.anime_nogamenolife),
              animeListTileWidget(title: '${LocaleKeys.KONOSUBA}',image: icon.anime_konosuba),
              animeListTileWidget(title: '${LocaleKeys.DATE_A_LIVE}',image: icon.anime_datealive),
              animeListTileWidget(title: '${LocaleKeys.KAKEGURUI}',image: icon.anime_kakegurui),
              animeListTileWidget(title: '${LocaleKeys.POKEMON}',image: icon.anime_pokemon),
              animeListTileWidget(title: '${LocaleKeys.DURARARA}',image: icon.anime_durarara),
              animeListTileWidget(title: '${LocaleKeys.MONOGATARI}',image: icon.anime_monogatari),
              animeListTileWidget(title: '${LocaleKeys.LOG_HORIZON}',image: icon.anime_loghorizon),
              animeListTileWidget(title: '${LocaleKeys.FATE_STAY_NIGHT}',image: icon.anime_fatestaynight),
              animeListTileWidget(title: '${LocaleKeys.HIGH_SCHOOL_DXD}',image: icon.anime_hightschooldxd),
              animeListTileWidget(title: '${LocaleKeys.TO_LOVE_RU}',image: icon.anime_toloveru),
              animeListTileWidget(title: '${LocaleKeys.KABANERI_OF_THE_IRON_FORTRESS}',image: icon.anime_kabaneri),
              animeListTileWidget(title: '${LocaleKeys.SERAPH_OF_THE_END}',image: icon.anime_seraphoftheend),
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
        Get.to(WallpaperListType());
        await wallPaperController.selectTypeWallpaper(title);
      },
      child: Container(
        color: Colors.transparent,
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
        color: Colors.transparent,
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

  Widget animeListTileWidget({
    required String title,
    required String image,
  }) {
    return GestureDetector(
      onTap: () async {
        Get.toNamed(Routes.ANIME_LIST_TILE, arguments: [title]);
        await animeListController.selectAnimeList(title);
      },
      child: Container(
        color: Colors.transparent,
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
