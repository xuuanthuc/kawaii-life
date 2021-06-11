import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wibu_life/modules/anime_list_wallpapers/controllers/anime_list_controller.dart';
import 'package:wibu_life/modules/anime_list_wallpapers/views/widgets/PreviewAnimeListWallpaper.dart';
import 'package:wibu_life/modules/common/widgets/effect_widget.dart';
import 'package:wibu_life/modules/wall_paper/views/widgets/preview_image_screen.dart';
import 'package:wibu_life/themes/app_colors.dart';
import 'package:wibu_life/themes/app_theme.dart';
import 'package:wibu_life/utils/common/screen_util.dart';


class AnimeListTile extends StatelessWidget {
  final AnimeListController animeListController = Get.find();
  @override
  Widget build(BuildContext context) {
  var title = Get.arguments[0];
    return Obx(() => Scaffold(
      backgroundColor: Get.isDarkMode? darkModeBackgroundColor : lightModeBackgroundColor,
      appBar: AppBar(
        backgroundColor: Get.isDarkMode? darkModeBackgroundColor : lightModeBackgroundColor,
        elevation: 0,
        leading: IconButton(onPressed: () => Get.back(),icon: Icon(Icons.arrow_back, color: Get.isDarkMode? darkModePrimaryColor : lightModePrimaryColor,),),
        title: Text('${title}'.tr, style: robotoW600(s(20), Get.isDarkMode? darkModePrimaryColor : lightModePrimaryColor,),),
      ),
      body: animeListController.isLoading.value
          ? EffectAnimationAnimeListDesign()
          :  Padding(
            padding: EdgeInsets.symmetric(horizontal: w(30), vertical: h(10)),
            child: Container(
        child: GridView.builder(
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
            childAspectRatio: 9 / 16,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
        ),
            itemBuilder: (context, index) => Container(
              child: GestureDetector(
                onTap: () async {
                  await Get.to(PreviewAnimeListImageScreen(image: animeListController.animeList[index].previewUrl,));
                },
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(r(8)),
                    child: FadeInImage.assetNetwork(placeholder: 'assets/images/loading_image.gif', image: animeListController.animeList[index].thumbUrl)
                ),
              ),
        ), itemCount: animeListController.animeList.length,)
      ),
          ),
    ),);
  }
}
