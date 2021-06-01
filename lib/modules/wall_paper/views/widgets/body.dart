import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wibu_life/modules/common/widgets/effect_widget.dart';
import 'package:wibu_life/modules/wall_paper/controllers/wall_paper_controller.dart';
import 'package:wibu_life/modules/wall_paper/views/widgets/preview_image_screen.dart';
import 'package:wibu_life/utils/common/screen_util.dart';
import 'package:wibu_life/utils/constants/locale_key.dart';

class WidgetListType extends StatelessWidget {
  String image;
  String title;
  WidgetListType({required this.image, required this.title});
  final WallPaperController wallPaperController = Get.find();

  @override
  Widget build(BuildContext context) {
    return wallPaperController.isLoading.value
          ? EffectAnimationWallpaperDesign()
          : Container(
      padding: EdgeInsets.symmetric(horizontal: w(10)),
      height: h(210),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  if(title == LocaleKeys.ANIME){
                    image = wallPaperController.animeType[index].thumbUrl;
                  } else if(title == LocaleKeys.ANIME_GIRLS){
                    image = wallPaperController.animeGirlsType[index].thumbUrl;
                  }else if(title == LocaleKeys.ANIME_BOYS){
                    image = wallPaperController.animeBoysType[index].thumbUrl;
                  }else if(title == LocaleKeys.ANIME_AESTHETIC){
                    image = wallPaperController.animeAestheticType[index].thumbUrl;
                  }else if(title == LocaleKeys.ANIME_LOVE){
                    image = wallPaperController.animeLoveType[index].thumbUrl;
                  }
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: w(6)),
                    child: GestureDetector(
                      onTap: (){
                        var previewImage = '';
                        if(title == LocaleKeys.ANIME){
                          previewImage = wallPaperController.animeType[index].previewUrl;
                        } else if(title == LocaleKeys.ANIME_GIRLS){
                          previewImage = wallPaperController.animeGirlsType[index].previewUrl;
                        }else if(title == LocaleKeys.ANIME_BOYS){
                          previewImage = wallPaperController.animeBoysType[index].previewUrl;
                        }else if(title == LocaleKeys.ANIME_AESTHETIC){
                          previewImage = wallPaperController.animeAestheticType[index].previewUrl;
                        }else if(title == LocaleKeys.ANIME_LOVE){
                          previewImage = wallPaperController.animeLoveType[index].previewUrl;
                        }
                        Get.to(PreviewImageScreen(image: previewImage,));
                      },
                      child: Container(
                        width: w(110),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(r(8)),
                          child:
                          FadeInImage.assetNetwork(
                              placeholder: 'assets/images/loading_image.gif' ,
                              image: image,
                            fit: BoxFit.fitHeight,)
                        ),
                      ),
                    ),
                  );
                },
                itemCount: 20,
              ),
    );
  }
}
