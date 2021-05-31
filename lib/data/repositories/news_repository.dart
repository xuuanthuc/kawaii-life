
import '/models/news/news_model.dart';
import '../request.dart';
import '../url_api.dart';
import '/modules/home_news/news_repository.dart';


final animeNewsApi = '$getAnimeNews';
final mangaNewsApi = '$getMangaNews';
final cosplayApi = '$getCosplay';
final figureApi = '$getFigure';
final nominationApi = '$getNomination';


class NewsRepository implements INewsRepository{
  Request request = Request();

  @override
  Future<List<News>> getAnimeNews()async {
    // TODO: implement getMoviePopular
    var res = await
    request.requestApi(method: MethodType.GET, url: animeNewsApi);
    // Dio().get('http://192.168.10.100:8080/api/v1/news?type=1');
    var converRes = (res as dynamic);
    List<dynamic> data = converRes;
    // ignore: avoid_print
    print(data);
    return data.map((job) => new News.fromJson(job)).toList();
  }

  Future<List<News>> getMangaNews()async {
    // TODO: implement getMoviePopular
    var res = await
    request.requestApi(method: MethodType.GET, url: mangaNewsApi);
    // Dio().get('https://raw.githubusercontent.com/XuannThucc/bot_crawl_wibu_data/master/out/animenews.json');
    var converRes = (res as dynamic);
    print(converRes) ;

    List<dynamic> data = converRes;
    print(data);
    print(data.map((job) => new News.fromJson(job)).toList().toString());
    return data.map((job) => new News.fromJson(job)).toList();
  }



  Future<List<News>> getCosplay()async {
    // TODO: implement getMoviePopular
    var res = await
    request.requestApi(method: MethodType.GET, url: cosplayApi);
    // Dio().get('https://raw.githubusercontent.com/XuannThucc/bot_crawl_wibu_data/master/out/animenews.json');
    var converRes = (res as dynamic);
    List<dynamic> data = converRes;
    print(data);
    return data.map((job) => new News.fromJson(job)).toList();
  }
  Future<List<News>> getFigure()async {
    // TODO: implement getMoviePopular
    var res = await
    request.requestApi(method: MethodType.GET, url: figureApi);
    // Dio().get('https://raw.githubusercontent.com/XuannThucc/bot_crawl_wibu_data/master/out/animenews.json');
    var converRes = (res as dynamic);
    List<dynamic> data = converRes;
    print(data);
    return data.map((job) => new News.fromJson(job)).toList();
  }
  Future<List<News>> getNomination()async {
    // TODO: implement getMoviePopular
    var res = await
    request.requestApi(method: MethodType.GET, url: nominationApi);
    // Dio().get('https://raw.githubusercontent.com/XuannThucc/bot_crawl_wibu_data/master/out/animenews.json');
    var converRes = (res as dynamic);
    List<dynamic> data = converRes;
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