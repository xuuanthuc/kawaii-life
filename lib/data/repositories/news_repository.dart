
import 'dart:convert';

import 'package:dio/dio.dart';

import '/models/news/news_model.dart';
import '../request.dart';
import '../url_api.dart';
import '/modules/home_news/news_repository.dart';


final animeNewsApi = '$getAnimeNews';
final mangaNewsApi = '$getMangaNews';
class NewsRepository implements INewsRepository{
  Request request = Request();

  @override
  Future<List<News>> getAnimeNews()async {
    // TODO: implement getMoviePopular
    var res = await
    request.requestApi(method: MethodType.GET, url: animeNewsApi);
    // Dio().get('https://raw.githubusercontent.com/XuannThucc/bot_crawl_wibu_data/master/out/animenews.json');
    var converRes = (res as dynamic);
    List<dynamic> data = json.decode(converRes);
    print(data);
    return data.map((job) => new News.fromJson(job)).toList();
  }

  Future<List<News>> getMangaNews()async {
    // TODO: implement getMoviePopular
    var res = await
    request.requestApi(method: MethodType.GET, url: mangaNewsApi);
    // Dio().get('https://raw.githubusercontent.com/XuannThucc/bot_crawl_wibu_data/master/out/animenews.json');
    var converRes = (res as dynamic);
    List<dynamic> data = json.decode(converRes);
    print(data);
    return data.map((job) => new News.fromJson(job)).toList();
  }




  // Future<News> getMovieTopRate()async {
  //   var res = await request.requestApi(method: MethodType.GET, url: movieTopRatedApi);
  //   var data = (res as dynamic);
  //   print(data);
  //   return News.fromJson(data);
  // }


//
// List<MoviePopularModel> parseMovies(String responseBody) {
//   final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
//
//   return parsed.map<MoviePopularModel>((json) => MoviePopularModel.fromJson(json)).toList();
// }

}