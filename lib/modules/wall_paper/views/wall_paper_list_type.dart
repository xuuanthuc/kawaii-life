import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wibu_life/modules/common/widgets/effect_widget.dart';
import 'package:wibu_life/modules/wall_paper/controllers/wall_paper_controller.dart';
import 'package:wibu_life/modules/wall_paper/views/widgets/header.dart';
import 'package:wibu_life/modules/wall_paper/views/widgets/preview_image_screen.dart';
import 'package:wibu_life/themes/app_colors.dart';
import 'package:wibu_life/utils/common/screen_util.dart';

class WallpaperListType extends StatelessWidget {
  final WallPaperController wallPaperController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WallPaperController>(
      builder: (index) => Scaffold(
        backgroundColor: Get.isDarkMode? darkModeBackgroundColor : lightModeBackgroundColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Get.isDarkMode? darkModeBackgroundColor : lightModeBackgroundColor,
            leading: IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              icon: Icon(
                Icons.keyboard_arrow_left,
                color:Get.isDarkMode? darkModePrimaryColor : lightModePrimaryColor,
                size: 30,
              ),
              onPressed: () => Get.back(),
            ),
            title: headerSelectCategoryWallpaper(),
          ),
          body: wallPaperController.isLoading.value
              ? EffectAnimationWallpaperListDesign()
              : Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: w(30), vertical: h(15)),
                      child: GridView.builder(
                          itemCount: wallPaperController.wallpaper.length,
                          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: wallPaperController.animeSelect.value? 3 : 2,
                            childAspectRatio: 9 / 16,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () async {
                                await Get.to(PreviewImageScreen(image: wallPaperController.wallpaper[index].previewUrl,));
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(r(8)),
                                child: FadeInImage.assetNetwork(placeholder: 'assets/images/loading_image.gif', image: wallPaperController.wallpaper[index].thumbUrl)
                              ),
                            );
                          },
                        ),
                    ),
                  ),
                ],
              )),
    );
  }
}
