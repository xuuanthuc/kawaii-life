
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:share/share.dart';

import 'package:wibu_life/models/wallpaper/wallpaper_model.dart';
import 'package:wibu_life/modules/anime_list_wallpapers/anime_list_wallpaper_repository.dart';
import 'package:wibu_life/themes/app_colors.dart';
import 'package:wibu_life/utils/common/wallpaper_manager.dart';
import 'package:wibu_life/utils/constants/locale_key.dart';

class AnimeListController extends GetxController {
  final IAnimeListRepository animeListRepository = Get.find();
  var animeList = <Wallpaper>[].obs;
  RxBool isLoading = false.obs;
  RxString imageId = ''.obs;
  RxString imageDownloadedName = ''.obs;
  RxString imageDownloadedPath = ''.obs;
  RxInt imageDownloadedSize = 0.obs;
  RxString imageDownloadedMimeType = ''.obs;
  RxBool isDownloading = false.obs;
  Future<void> selectAnimeList(String title) async {
    isLoading.value = true;
    if (title == LocaleKeys.ONE_PIECE) {
      animeList.value = await animeListRepository.getAnimeOnePiece();
    } else if (title == LocaleKeys.DRAGON_BALL) {
      animeList.value = await animeListRepository.getAnimeDragonBall();
    } else if (title == LocaleKeys.NARUTO) {
      animeList.value = await animeListRepository.getAnimeNaruto();
    } else if (title == LocaleKeys.BOKU_NO_HERO) {
      animeList.value = await animeListRepository.getAnimeBokuNoHero();
    } else if (title == LocaleKeys.DR_STONE) {
      animeList.value = await animeListRepository.getAnimeDrStone();
    } else if (title == LocaleKeys.DEMON_SLAYER) {
      animeList.value = await animeListRepository.getAnimeDemonSlayer();
    } else if (title == LocaleKeys.BORUTO) {
      animeList.value = await animeListRepository.getAnimeBoruto();
    } else if (title == LocaleKeys.FIRE_FORCE) {
      animeList.value = await animeListRepository.getAnimeFireForce();
    } else if (title == LocaleKeys.TOKYO_GHOUL) {
      animeList.value = await animeListRepository.getAnimeTokyoGhoul();
    } else if (title == LocaleKeys.FAIRY_TAIL) {
      animeList.value = await animeListRepository.getAnimeFairyTail();
    } else if (title == LocaleKeys.NANATSU_NO_TAIZAI) {
      animeList.value = await animeListRepository.getAnimeNanatsuNoTaizai();
    } else if (title == LocaleKeys.BLACK_CLOVER) {
      animeList.value = await animeListRepository.getAnimeBlackClover();
    } else if (title == LocaleKeys.BLEACH) {
      animeList.value = await animeListRepository.getAnimeBleach();
    } else if (title == LocaleKeys.ATTACH_ON_TITAN) {
      animeList.value = await animeListRepository.getAnimeAttackOnTitan();
    } else if (title == LocaleKeys.ONE_PUNCH_MAN) {
      animeList.value = await animeListRepository.getAnimeOnePunchMan();
    } else if (title == LocaleKeys.KUROKO_NO_BASKET) {
      animeList.value = await animeListRepository.getAnimeKurokoNobasket();
    } else if (title == LocaleKeys.GINTAMA) {
      animeList.value = await animeListRepository.getAnimeGintama();
    } else if (title == LocaleKeys.OVERLORD) {
      animeList.value = await animeListRepository.getAnimeOverlord();
    } else if (title == LocaleKeys.SWORD_ART_ONLINE) {
      animeList.value = await animeListRepository.getAnimeSwordArtOnline();
    } else if (title == LocaleKeys.RE_ZERO) {
      animeList.value = await animeListRepository.getAnimeReZero();
    } else if (title == LocaleKeys.NO_GAME_NO_LIFE) {
      animeList.value = await animeListRepository.getAnimeNoGameNoLife();
    } else if (title == LocaleKeys.KONOSUBA) {
      animeList.value = await animeListRepository.getAnimeKonosuba();
    } else if (title == LocaleKeys.DATE_A_LIVE) {
      animeList.value = await animeListRepository.getAnimeDateALive();
    } else if (title == LocaleKeys.KAKEGURUI) {
      animeList.value = await animeListRepository.getAnimeKakegurui();
    } else if (title == LocaleKeys.POKEMON) {
      animeList.value = await animeListRepository.getAnimePokemon();
    } else if (title == LocaleKeys.DURARARA) {
      animeList.value = await animeListRepository.getAnimeDurarara();
    } else if (title == LocaleKeys.MONOGATARI) {
      animeList.value = await animeListRepository.getAnimeMonogarari();
    } else if (title == LocaleKeys.LOG_HORIZON) {
      animeList.value = await animeListRepository.getAnimeLogHorizon();
    } else if (title == LocaleKeys.FATE_STAY_NIGHT) {
      animeList.value = await animeListRepository.getAnimeFateStayNight();
    } else if (title == LocaleKeys.HIGH_SCHOOL_DXD) {
      animeList.value = await animeListRepository.getAnimeHighSchoolDXD();
    } else if (title == LocaleKeys.TO_LOVE_RU) {
      animeList.value = await animeListRepository.getAnimeToLoveRu();
    } else if (title == LocaleKeys.SERAPH_OF_THE_END) {
      animeList.value = await animeListRepository.getAnimeSeraphOfTheEnd();
    } else if (title == LocaleKeys.ZERO_TWO) {
      animeList.value = await animeListRepository.getAnimeZeroTwo();
    } else if (title == LocaleKeys.KABANERI_OF_THE_IRON_FORTRESS) {
      animeList.value = await animeListRepository.getAnimeKabaneri();
    }
    isLoading.value = false;
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
