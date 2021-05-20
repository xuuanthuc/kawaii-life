import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:wibu_life/data/repositories/news_repository.dart';
import 'package:wibu_life/modules/home_news/controllers/news_controller.dart';
import 'package:wibu_life/modules/home_news/news_repository.dart';

class NewsBinding extends Bindings {
  @override
  void dependencies() {
    print("===================this is news binding");
    Get.lazyPut<NewsController>(() => NewsController());
    Get.lazyPut<INewsRepository>(() => NewsRepository());
  }
}