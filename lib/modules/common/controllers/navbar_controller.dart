import 'package:get/get.dart';

class NavController extends GetxController{
  RxBool isActionNews = true.obs;
  RxBool isActionWallpaper = false.obs;
  RxBool isActionBuy = false.obs;
  RxBool isActionHeart = false.obs;
  RxBool isActionMenu = false.obs;

  void selectNews(){
    isActionNews.value = true;
    isActionWallpaper.value = false;
    isActionBuy.value = false;
    isActionHeart.value = false;
    isActionMenu.value = false;
  }
  void selectAnimeListWallpaper(){
    isActionNews.value = false;
    isActionWallpaper.value = true;
    isActionBuy.value = false;
    isActionHeart.value = false;
    isActionMenu.value = false;
  }
  void selectWallpaperCategory(){
    isActionNews.value = false;
    isActionWallpaper.value = false;
    isActionBuy.value = true;
    isActionHeart.value = false;
    isActionMenu.value = false;
  }
  void selectHeart(){
    isActionNews.value = false;
    isActionWallpaper.value = false;
    isActionBuy.value = false;
    isActionHeart.value = true;
    isActionMenu.value = false;
  }
  void selectMenu(){
    isActionNews.value = false;
    isActionWallpaper.value = false;
    isActionBuy.value = false;
    isActionHeart.value = false;
    isActionMenu.value = true;
  }

}