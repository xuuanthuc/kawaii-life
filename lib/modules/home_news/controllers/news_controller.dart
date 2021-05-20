import 'package:get/get.dart';
import 'package:wibu_life/models/news/news_model.dart';
import 'package:wibu_life/utils/constants/locale_key.dart';

import '../news_repository.dart';

class NewsController extends GetxController{
  // var movies = List<MoviePopularModel>();
  // var animeNews = News().obs;

  var selectCategory = <News>[];
  final INewsRepository newsRepository = Get.find();
  RxString _title = LocaleKeys.ANIME_NEWS.obs;
  String get title => _title.value;
  bool isLoading = false;
  @override
  void onInit() {
    super.onInit();
    selectNewsCategories(title);
  }

  void selectNewsCategories(String category) async{
    if(category == LocaleKeys.ANIME_NEWS){
      isLoading = true;
      selectCategory = await newsRepository.getAnimeNews();
      isLoading = false;

    } else if (category == LocaleKeys.MANGA_NEWS){
      isLoading = true;

      selectCategory = await newsRepository.getMangaNews();
      isLoading = false;

    } else if (category == LocaleKeys.COSPLAY){
      isLoading = true;

      selectCategory = await newsRepository.getCosplay();
      isLoading = false;

    } else if (category == LocaleKeys.FIGURE){
      isLoading = true;

      selectCategory = await newsRepository.getFigure();
      isLoading = false;

    } else if (category == LocaleKeys.NOMINATION){
      isLoading = true;

      selectCategory = await newsRepository.getNomination();
      isLoading = false;

    }
    update();
  }

  // void getAnimeNews()async{
  //   isLoading = true;
  //   animeNews = await newsRepository.getAnimeNews();
  //   isLoading = false;
  //
  //   update();
  // }
  // void getMangaNews()async{
  //   isLoading = true;
  //
  //   mangaNews = await newsRepository.getMangaNews();
  //   isLoading = false;
  //
  //   update();
  // }

}
