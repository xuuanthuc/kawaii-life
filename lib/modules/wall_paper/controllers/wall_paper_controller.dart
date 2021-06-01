

import 'package:get/get.dart';
import 'package:wibu_life/models/wallpaper/wallpaper_model.dart';
import 'package:wibu_life/modules/wall_paper/wall_paper_repository.dart';
import 'package:wibu_life/utils/constants/locale_key.dart';

class WallPaperController extends GetxController{
  final IWallPaperRepository wallPaperRepository = Get.find();
  RxString titleWallpaper = LocaleKeys.ANIME.obs;
  var wallpaper = <Wallpaper>[].obs;
  RxBool isLoading = false.obs;
  RxBool animeSelect = false.obs;
  RxBool animeGirlSelect = false.obs;
  RxBool animeBoySelect = false.obs;
  RxBool animeAestheticSelect = false.obs;
  RxBool animeLoveSelect = false.obs;

  var animeType = <Wallpaper>[];
  var animeGirlsType = <Wallpaper>[];
  var animeBoysType = <Wallpaper>[].obs;
  var animeAestheticType = <Wallpaper>[].obs;
  var animeLoveType = <Wallpaper>[].obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    animeSelect.value = true;
    // selectTypeWallpaper(titleWallpaper.value);
    await  selectAnimeWallpaper();
    await selectAnimeGirlsWallpaper();
    await selectAnimeBoysWallpaper();
    await selectAnimeLoveWallpaper();
    await  selectAnimeAestheticWallpaper();
  }



  Future<void> selectTypeWallpaper(String title) async {
    isLoading.value = true;
    if(title == LocaleKeys.ANIME){
      animeSelect.value = true;
      animeGirlSelect.value = false;
      animeBoySelect.value = false;
      animeAestheticSelect.value = false;
      animeLoveSelect.value = false;
      wallpaper.value = await wallPaperRepository.getWallpaperAnime();

    } else if(title == LocaleKeys.ANIME_GIRLS){
      animeSelect.value = false;
      animeGirlSelect.value = true;
      animeBoySelect.value = false;
      animeAestheticSelect.value = false;
      animeLoveSelect.value = false;
      wallpaper.value = await wallPaperRepository.getWallpaperAnimeGirls();

    } else if(title == LocaleKeys.ANIME_BOYS){
      animeSelect.value = false;
      animeGirlSelect.value = false;
      animeBoySelect.value = true;
      animeAestheticSelect.value = false;
      animeLoveSelect.value = false;
      wallpaper.value = await wallPaperRepository.getWallpaperAnimeBoys();

    } else if(title == LocaleKeys.ANIME_AESTHETIC){
      animeSelect.value = false;
      animeGirlSelect.value = false;
      animeBoySelect.value = false;
      animeAestheticSelect.value = true;
      animeLoveSelect.value = false;
      wallpaper.value = await wallPaperRepository.getWallpaperAnimeAesthetic();

    } else if(title == LocaleKeys.ANIME_LOVE){
      animeSelect.value = false;
      animeGirlSelect.value = false;
      animeBoySelect.value = false;
      animeAestheticSelect.value = false;
      animeLoveSelect.value = true;
      wallpaper.value = await wallPaperRepository.getWallpaperAnimeLove();
    }
    isLoading.value = false;
    update();
  }

  Future<void> selectAnimeWallpaper() async{
    isLoading.value = true;
    animeType = await wallPaperRepository.getWallpaperAnime();
    isLoading.value = false;
    update();
  }
  Future<void> selectAnimeGirlsWallpaper() async{
    isLoading.value = true;
    animeGirlsType = await wallPaperRepository.getWallpaperAnimeGirls();
    isLoading.value = false;
    update();

  }
  Future<void> selectAnimeBoysWallpaper() async{
    isLoading.value = true;
    animeBoysType.value = await wallPaperRepository.getWallpaperAnimeBoys();
    isLoading.value = false;
    update();

  }
  Future<void> selectAnimeAestheticWallpaper() async{
    isLoading.value = true;
    animeAestheticType.value = await wallPaperRepository.getWallpaperAnimeAesthetic();
    isLoading.value = false;
    update();

  }
  Future<void> selectAnimeLoveWallpaper() async{
    isLoading.value = true;
    animeLoveType.value = await wallPaperRepository.getWallpaperAnimeLove();
    isLoading.value = false;
    update();
  }
}