

import 'package:get/get.dart';
import 'package:wibu_life/models/wallpaper/wallpaper_model.dart';
import 'package:wibu_life/modules/wall_paper/wall_paper_repository.dart';

class WallPaperController extends GetxController{
  final IWallPaperRepository wallPaperRepository = Get.find();
  var wallpaperAnime = <Wallpaper>[].obs;
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    wallpaperAnime.value = await wallPaperRepository.getWallpaperAnime();
  }
}