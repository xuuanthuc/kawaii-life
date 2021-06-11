import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:wibu_life/app_papes.dart';
import 'package:wibu_life/modules/anime_list_wallpapers/controllers/anime_list_controller.dart';
import 'package:wibu_life/modules/common/widgets/nav_bar.dart';
import 'package:wibu_life/themes/app_colors.dart';
import 'package:wibu_life/themes/app_icon.dart';
import 'package:wibu_life/themes/app_theme.dart';
import 'package:wibu_life/utils/common/screen_util.dart';
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
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: w(30), vertical: h(15)),
            child: Container(
              child: GridView.count(
                childAspectRatio: 1/1,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                crossAxisCount: 2,
                children: [
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
    required String image,
  }) {
    return GestureDetector(
      onTap: () async {
        Get.toNamed(Routes.ANIME_LIST_TILE, arguments: [title]);
        await animeListController.selectAnimeList(title);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(r(10))
        ),
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(r(10)),
                child: Image.asset(image, fit: BoxFit.fill,)),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(r(10)),
                color: Color(0x40000000),
              ),
            ),
            Center(
              child: Text(
                title.tr,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.clip,
                style: robotoW700(s(20), Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
