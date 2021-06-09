import 'package:get/get.dart';
import 'package:wibu_life/modules/anime_list_wallpapers/views/anime_list_screen.dart';
import 'package:wibu_life/modules/home_news/controllers/news_controller.dart';
import 'package:wibu_life/modules/home_news/views/news_detail.dart';
import 'package:wibu_life/modules/menu/menu_screen.dart';
import 'package:wibu_life/modules/wall_paper/bindings/wall_paper_binding.dart';
import 'package:wibu_life/modules/wall_paper/views/wall_paper_list_type.dart';
import 'package:wibu_life/modules/wall_paper/views/wall_paper_page.dart';
import '/modules/home_news/views/home_news.dart';

import 'models/common/error_model.dart';
import 'modules/common/error_page.dart';
import 'modules/home_news/bindings/news_binding.dart';
import 'modules/splash/splash_page.dart';


abstract class Routes {
  static const SPLASH = '/splash';
  static const HOME = '/home';
  static const ERROR = '/error';
  static const NEWS_DETAIL = '/news-detail';
  static const WALL_PAPER = '/wall-paper';
  static const MENU = '/menu-screen';
  static const ANIME_LIST = '/anime-list-screen';
}

class AppPages {
  static const INITIAL = Routes.SPLASH;
  static final unknownRoute =
  GetPage(name: Routes.ERROR, page: () => ErrorPage(error: ErrorModel()));
  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashPage(),
      bindings: [],
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeNews(),
      bindings: [NewsBinding()],
    ),
    GetPage(
      name: Routes.NEWS_DETAIL,
      page: () => NewsDetail(),
      bindings: [],
    ),
    GetPage(
      name: Routes.WALL_PAPER,
      page: () => WallPaperPage(),
      bindings: [WallPaperBinding()],
    ),
    GetPage(
      name: Routes.MENU,
      page: () => MenuScreen(),
      bindings: [WallPaperBinding(), NewsBinding()],
    ),
    GetPage(
      name: Routes.ANIME_LIST,
      page: () => AnimeListScreen(),
      bindings: [],
    ),
  ];
}

// can add route children by that
// GetPage(
//   name: Routes.HOME,
//   page: () => HomeWeatherPage(),
//   binding: WeatherBinding(),
//   children: [
//     GetPage(
//     name: Routes.CITY_SEARCH,
//     page: () => CitySearchPage(),
//     ),
//     GetPage(
//     name: Routes.SETTING,
//     page: () => SettingLangPage(),
//     ),
//   ]
// ),
