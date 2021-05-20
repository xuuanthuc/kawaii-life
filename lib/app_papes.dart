import 'package:get/get.dart';
import '/modules/home_news/views/home_news.dart';

import 'models/common/error_model.dart';
import 'modules/common/error_page.dart';
import 'modules/home_news/bindings/news_binding.dart';
import 'modules/splash/splash_page.dart';


abstract class Routes {
  static const SPLASH = '/splash';
  static const HOME = '/home';
  static const ERROR = '/error';
}

class AppPages {
  static const INITIAL = Routes.HOME;
  static final unknownRoute =
  GetPage(name: Routes.ERROR, page: () => ErrorPage(error: ErrorModel()));
  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashPage(),
      bindings: [NewsBinding()],
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeNews(),
      bindings: [NewsBinding()],
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
