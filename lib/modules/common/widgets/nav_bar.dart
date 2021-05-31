import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wibu_life/app_papes.dart';
import 'package:wibu_life/modules/home_news/controllers/navbar_controller.dart';
import 'package:wibu_life/themes/app_colors.dart';
import 'package:wibu_life/themes/app_icon.dart';

class NavBarDesign extends StatelessWidget {
  final NavController navController = Get.put(NavController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                Get.offAllNamed(Routes.HOME);
                navController.isActionNews.value = true;
                navController.isActionWallpaper.value = false;
                navController.isActionBuy.value = false;
                navController.isActionHeart.value = false;
                navController.isActionMenu.value = false;
              },
              icon: navController.isActionNews.value
                  ? SvgPicture.asset(
                      icon.fire_solid,
                      color: primaryColor,
                    )
                  : SvgPicture.asset(
                      icon.fire,
                      color: primaryColor,
                    )),
          IconButton(
              onPressed: () {
                Get.offAllNamed(Routes.WALL_PAPER);
                navController.isActionNews.value = false;
                navController.isActionWallpaper.value = true;
                navController.isActionBuy.value = false;
                navController.isActionHeart.value = false;
                navController.isActionMenu.value = false;

              },
              icon: navController.isActionWallpaper.value
                  ? SvgPicture.asset(
                icon.wallpapers_solid,
                color: primaryColor,
              )
                  : SvgPicture.asset(
                icon.wallpapers_icon,
                color: primaryColor,
              )),
          IconButton(
              onPressed: () {
                Get.offAllNamed(Routes.WALL_PAPER);
                navController.isActionNews.value = false;
                navController.isActionWallpaper.value = false;
                navController.isActionBuy.value = true;
                navController.isActionHeart.value = false;
                navController.isActionMenu.value = false;

              },
              icon: navController.isActionBuy.value
                  ? SvgPicture.asset(
                      icon.buy_solid,
                      color: primaryColor,
                    )
                  : SvgPicture.asset(
                      icon.buy_icon,
                      color: primaryColor,
                    )),
          IconButton(
              onPressed: () {
                Get.offAllNamed(Routes.WALL_PAPER);
                navController.isActionNews.value = false;
                navController.isActionWallpaper.value = false;
                navController.isActionBuy.value = false;
                navController.isActionHeart.value = true;
                navController.isActionMenu.value = false;

              },
              icon: navController.isActionHeart.value
                  ? SvgPicture.asset(
                      icon.heart_solid,
                      color: primaryColor,
                    )
                  : SvgPicture.asset(
                      icon.heart_icon,
                      color: primaryColor,
                    )),
          IconButton(
              onPressed: () {
                Get.offAllNamed(Routes.WALL_PAPER);
                navController.isActionNews.value = false;
                navController.isActionWallpaper.value = false;
                navController.isActionBuy.value = false;
                navController.isActionHeart.value = false;
                navController.isActionMenu.value = true;
              },
              icon: navController.isActionMenu.value
                  ? SvgPicture.asset(
                icon.menu_solid,
                color: primaryColor,
              )
                  : SvgPicture.asset(
                icon.menu_icon,
                color: primaryColor,
              )),
        ],
      ),
    );
  }
}
