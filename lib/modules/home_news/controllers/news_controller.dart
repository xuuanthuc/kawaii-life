import 'package:get/get.dart';
import 'package:wibu_life/models/news/news_model.dart';

import '../news_repository.dart';

class NewsController extends GetxController{
  // var movies = List<MoviePopularModel>();
  // var animeNews = News().obs;
  var animeNews = <News>[];
  var mangaNews = <News>[];

  final INewsRepository newsRepository = Get.find();

  var id;
  var isLoading = false;
  late int index;
  @override
  void onInit() {
    super.onInit();
    getAnimeNews();
    getMangaNews();
  }

  // Results findById(int id, String type){
  //   if(type == 'Popular'){
  //     return moviesPopular.results!.firstWhere((movie) => movie.id == id);
  //   }else if(type == 'Top Rate'){
  //     return moviesToprate.results!.firstWhere((movie) => movie.id == id);
  //   }else {
  //     return moviesPopular.results!.firstWhere((movie) => movie.id == id);
  //   }
  // }

  void getAnimeNews()async{
    isLoading = true;
    animeNews = await newsRepository.getAnimeNews();
    isLoading = false;
    update();
  }
  void getMangaNews()async{
    isLoading = true;
    mangaNews = await newsRepository.getMangaNews();
    isLoading = false;
    update();
  }

}
