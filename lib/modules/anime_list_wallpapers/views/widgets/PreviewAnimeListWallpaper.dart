import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:share/share.dart';
import 'package:wibu_life/modules/anime_list_wallpapers/controllers/anime_list_controller.dart';
import 'package:wibu_life/themes/app_colors.dart';
import 'package:wibu_life/themes/app_icon.dart';
import 'package:wibu_life/themes/app_theme.dart';
import 'package:wibu_life/utils/common/screen_util.dart';
import 'package:wibu_life/utils/common/wallpaper_manager.dart';
import 'package:wibu_life/utils/constants/locale_key.dart';

class PreviewAnimeListImageScreen extends StatelessWidget {
  String image;

  PreviewAnimeListImageScreen({required this.image});

  final AnimeListController animeListController = Get.find();


  @override
  Widget build(BuildContext context) {
    return GetBuilder<AnimeListController>(
      init: animeListController,
      builder: (index) => Container(
        decoration: BoxDecoration(
            color:Get.isDarkMode? darkModeBackgroundColor : lightModeBackgroundColor,
            image: DecorationImage(
                image: NetworkImage(image), fit: BoxFit.fitHeight)),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Positioned(
              top: h(40),
              left: w(20),
              child: IconButtomDesign(
                padding: 10,
                height: 45,
                width: 45,
                onTap: () => Get.back(),
                iconAsset: icon.arrow_back,
              ),
            ),
            Positioned(
              bottom: h(80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButtomDesign(
                    onTap: () {
                      Get.bottomSheet(
                          Padding(
                            padding: EdgeInsets.only(bottom: h(40), left: w(8),right: w(8)),
                            child: ClipRect(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 5.0,
                                  sigmaY: 5.0,
                                ),
                                child: Container(
                                  height: h(120),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(r(10)),
                                    color: Colors.white.withOpacity(0.9),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        // mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          buttomSetWallpaperDesign(imageUrl: image,icon: icon.home_screen, type: LocaleKeys.HOME_SCREEN),
                                          buttomSetWallpaperDesign(imageUrl: image,icon: icon.lock_screen,  type: LocaleKeys.LOCK_SCREEN),
                                          buttomSetWallpaperDesign(imageUrl: image, icon: icon.both_screen, type: LocaleKeys.BOTH_SCREEN),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          barrierColor: Colors.white.withOpacity(0)
                      );

                    },
                    height: 60,
                    width: 60,
                    padding: 15,
                    iconAsset: icon.edit_icon,
                  ),
                  SizedBox(width: w(30),),
                  IconButtomDesign(
                    onTap: () async {
                      animeListController.downloadImage(image);
                    },
                    height: 60,
                    width: 60,
                    padding: 15,
                    iconAsset: icon.download,
                  ),
                  SizedBox(width: w(30),),
                  IconButtomDesign(
                    onTap: () {
                      animeListController.shareImage(image);
                    },
                    height: 60,
                    width: 60,
                    padding: 15,
                    iconAsset: icon.send_solid,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buttomSetWallpaperDesign({required String imageUrl,required String type, required String icon}) {
    return Flexible(
      child: TextButton(
        onPressed: ()async{
          await animeListController.setWallpaper(imageUrl,type);
          Get.back();
        }, child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(icon, width: h(25), height: h(25),color: lightModeTextColorBlack,),
          SizedBox(width: w(10),),
          Text(type.tr, style: robotoW400(s(20), lightModeTextColorBlack),),
        ],
      ),
      ),
    );
  }

  GestureDetector IconButtomDesign({
    required VoidCallback onTap,
    required double height,
    required double width,
    required double padding,
    required String iconAsset,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(r(50)),
          color: Colors.white.withOpacity(0.5),
        ),
        height: h(height),
        width: h(width),
        child: Padding(
          padding: EdgeInsets.all(w(padding)),
          child: SvgPicture.asset(
            iconAsset,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
