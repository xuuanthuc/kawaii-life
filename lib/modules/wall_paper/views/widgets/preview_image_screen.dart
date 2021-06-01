import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:share/share.dart';
import 'package:wibu_life/modules/wall_paper/controllers/wall_paper_controller.dart';
import 'package:wibu_life/themes/app_colors.dart';
import 'package:wibu_life/themes/app_icon.dart';
import 'package:wibu_life/utils/common/screen_util.dart';

class PreviewImageScreen extends StatelessWidget {
  String image;

  PreviewImageScreen({required this.image});

  final WallPaperController wallPaperController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WallPaperController>(
      init: wallPaperController,
      builder: (index) => Container(
        decoration: BoxDecoration(
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
                    onTap: () {},
                    height: 60,
                    width: 60,
                    padding: 15,
                    iconAsset: icon.edit_icon,
                  ),
                  SizedBox(width: w(30),),
                  IconButtomDesign(
                    onTap: () async {
                      wallPaperController.downloadImage(image);
                    },
                    height: 60,
                    width: 60,
                    padding: 15,
                    iconAsset: icon.download,
                  ),
                  SizedBox(width: w(30),),
                  IconButtomDesign(
                    onTap: () {
                      wallPaperController.shareImage(image);
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
          color: Colors.white.withOpacity(0.7),
        ),
        height: h(height),
        width: h(width),
        child: Padding(
          padding: EdgeInsets.all(w(padding)),
          child: SvgPicture.asset(
            iconAsset,
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
