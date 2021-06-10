

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:share/share.dart';
import 'package:wibu_life/models/wallpaper/wallpaper_model.dart';
import 'package:wibu_life/modules/wall_paper/wall_paper_repository.dart';
import 'package:wibu_life/themes/app_colors.dart';
import 'package:wibu_life/themes/app_icon.dart';
import 'package:wibu_life/utils/common/wallpaper_manager.dart';
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


  var animeType = <Wallpaper>[].obs;
  var animeGirlsType = <Wallpaper>[].obs;
  var animeBoysType = <Wallpaper>[].obs;
  var animeAestheticType = <Wallpaper>[].obs;
  var animeLoveType = <Wallpaper>[].obs;

  //Image Downloaded
  RxString imageId = ''.obs;
  RxString imageDownloadedName = ''.obs;
  RxString imageDownloadedPath = ''.obs;
  RxInt imageDownloadedSize = 0.obs;
  RxString imageDownloadedMimeType = ''.obs;
  RxBool isDownloading = false.obs;
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
    animeType.value = await wallPaperRepository.getWallpaperAnime();
    isLoading.value = false;
    update();
  }
  Future<void> selectAnimeGirlsWallpaper() async{
    isLoading.value = true;
    animeGirlsType.value = await wallPaperRepository.getWallpaperAnimeGirls();
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

  //Delete file deleteFile(File('path'))
  Future<void> deleteFile(File file) async {
    try {
      if (await file.exists()) {
        await file.delete();
      }
    } catch (e) {
      // Error in getting access to the file.
    }
  }


  Future<void> setWallpaper(String imageUrl, String type) async {
    try {
      Get.dialog(
          AlertDialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            shape: CircleBorder(),
            content: Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(lightModePrimaryColor),),),
          )
      );
      imageId.value = (await ImageDownloader.downloadImage(imageUrl, destination: AndroidDestinationType.directoryPictures))!;
      if (imageId.value == null) {
        return Get.snackbar(
          'Cannot set wallpaper Image',
          '',
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 2),
        );;
      }
      // Below is a method of obtaining saved image information.
      imageDownloadedName.value = (await ImageDownloader.findName(imageId.value))!;
      imageDownloadedPath.value = (await ImageDownloader.findPath(imageId.value))!;
      imageDownloadedSize.value = (await ImageDownloader.findByteSize(imageId.value))!;
      imageDownloadedMimeType.value = (await ImageDownloader.findMimeType(imageId.value))!;

      //set wallpaper code line
      try{
        if(type == LocaleKeys.HOME_SCREEN){
          print('Set home screnn');
          await WallpaperManager.setWallpaperFromFile(imageDownloadedPath.value, WallpaperManager.HOME_SCREEN);
        } else if(type == LocaleKeys.LOCK_SCREEN){
          print('Set lock screnn');
          await WallpaperManager.setWallpaperFromFile(imageDownloadedPath.value, WallpaperManager.LOCK_SCREEN);
        } else if(type == LocaleKeys.BOTH_SCREEN){
          print('Set Both screnn');
          await WallpaperManager.setWallpaperFromFile(imageDownloadedPath.value, WallpaperManager.BOTH_SCREENS);
        }
      }catch(e){
        Get.snackbar(
          'Cannot set wallpaper Image',
          '',
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 2),
        );
      }

      //delete wallpaper code line
      Get.back();

      var dir = Directory(imageDownloadedPath.value);
      dir.deleteSync(recursive: true);
      imageCache!.clear();
    } on PlatformException catch (error) {
      print(error);
      Get.snackbar(
        'Cannot set wallpaper Image',
        '',
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: 2),
      );
    }

  }

  
  Future<void> shareImage(String imageUrl) async {
    try {
      Get.dialog(
          AlertDialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            shape: CircleBorder(),
            content: Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(lightModePrimaryColor),),),
          )
      );
      imageId.value = (await ImageDownloader.downloadImage(imageUrl, destination: AndroidDestinationType.directoryPictures))!;
      if (imageId.value == null) {
        return Get.snackbar(
          'Cannot share Image',
          '',
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 2),
        );;
      }
      Get.back();
      // Below is a method of obtaining saved image information.
      imageDownloadedName.value = (await ImageDownloader.findName(imageId.value))!;
      imageDownloadedPath.value = (await ImageDownloader.findPath(imageId.value))!;
      imageDownloadedSize.value = (await ImageDownloader.findByteSize(imageId.value))!;
      imageDownloadedMimeType.value = (await ImageDownloader.findMimeType(imageId.value))!;
      await Share.shareFiles([imageDownloadedPath.value]);
      var dir = Directory(imageDownloadedPath.value);
      dir.deleteSync(recursive: true);
      imageCache!.clear();
    } on PlatformException catch (error) {
      print(error);
      Get.snackbar(
        'Cannot share Image',
        '',
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: 2),
      );
    }

  }

  Future<void> downloadImage(String imageUrl) async {
    try {
      // Saved with this method.
      Get.dialog(
        AlertDialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          shape: CircleBorder(),
          content: Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(lightModePrimaryColor),),),
        )
      );
      imageId.value = (await ImageDownloader.downloadImage(imageUrl, destination: AndroidDestinationType.directoryPictures))!;
      if (imageId.value == null) {
        return Get.snackbar(
          'Cannot download Image',
          '',
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 2),
        );;
      }
      Get.back();
      Get.snackbar(
        'Image Downloaded !',
        '${imageDownloadedPath.value}',
        colorText: Color(0xffffffff),
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: 2),
      );
      // Below is a method of obtaining saved image information.
      imageDownloadedName.value = (await ImageDownloader.findName(imageId.value))!;
      imageDownloadedPath.value = (await ImageDownloader.findPath(imageId.value))!;
      imageDownloadedSize.value = (await ImageDownloader.findByteSize(imageId.value))!;
      imageDownloadedMimeType.value = (await ImageDownloader.findMimeType(imageId.value))!;
      print(imageDownloadedName.value);
      print(imageDownloadedPath.value);
      print(imageDownloadedSize.value);
      print(imageDownloadedMimeType.value);
    } on PlatformException catch (error) {
      print(error);
      Get.snackbar(
        'Cannot download Image',
        '',
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: 2),
      );
    }
  }

}