import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:wibu_life/data/repositories/anime_list_repository.dart';
import 'package:wibu_life/modules/anime_list_wallpapers/anime_list_wallpaper_repository.dart';
import 'package:wibu_life/modules/anime_list_wallpapers/controllers/anime_list_controller.dart';

class AnimeListBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<AnimeListController>(() => AnimeListController());
    Get.lazyPut<IAnimeListRepository>(() => AnimeListRepository());
  }
}