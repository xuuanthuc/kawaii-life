

import 'package:wibu_life/data/url_api.dart';
import 'package:wibu_life/models/wallpaper/wallpaper_model.dart';
import 'package:wibu_life/modules/wall_paper/wall_paper_repository.dart';

import '../request.dart';
final wallpaperAnime = '$getAnimeWallpaper';
final wallpaperAnimeGirls = '$getAnimeGirlsWallpaper';
final wallpaperAnimeAesthetic = '$getAnimeAestheticWallpaper';
final wallpaperAnimeBoys = '$getAnimeBoysWallpaper';
final wallpaperAnimeLove = '$getAnimeLoveWallpaper';

class WallPaperRepository implements IWallPaperRepository{
  Request request = Request();

  @override
  Future<List<Wallpaper>> getWallpaperAnime()async {
    // TODO: implement getMoviePopular
    var res = await
    request.requestApi(method: MethodType.GET, url: wallpaperAnime);
    // Dio().get('http://192.168.10.100:8080/api/v1/news?type=1');
    var converRes = (res as dynamic);
    List<dynamic> data = converRes;
    // ignore: avoid_print
    print(data);
    return data.map((job) => new Wallpaper.fromJson(job)).toList();
  }

  @override
  Future<List<Wallpaper>> getWallpaperAnimeGirls()async {
    // TODO: implement getMoviePopular
    var res = await
    request.requestApi(method: MethodType.GET, url: wallpaperAnimeGirls);
    // Dio().get('http://192.168.10.100:8080/api/v1/news?type=1');
    var converRes = (res as dynamic);
    List<dynamic> data = converRes;
    // ignore: avoid_print
    print(data);
    return data.map((job) => new Wallpaper.fromJson(job)).toList();
  }
  @override
  Future<List<Wallpaper>> getWallpaperAnimeBoys()async {
    // TODO: implement getMoviePopular
    var res = await
    request.requestApi(method: MethodType.GET, url: wallpaperAnimeBoys);
    // Dio().get('http://192.168.10.100:8080/api/v1/news?type=1');
    var converRes = (res as dynamic);
    List<dynamic> data = converRes;
    // ignore: avoid_print
    print(data);
    return data.map((job) => new Wallpaper.fromJson(job)).toList();
  }
  @override
  Future<List<Wallpaper>> getWallpaperAnimeAesthetic()async {
    // TODO: implement getMoviePopular
    var res = await
    request.requestApi(method: MethodType.GET, url: wallpaperAnimeAesthetic );
    // Dio().get('http://192.168.10.100:8080/api/v1/news?type=1');
    var converRes = (res as dynamic);
    List<dynamic> data = converRes;
    // ignore: avoid_print
    print(data);
    return data.map((job) => new Wallpaper.fromJson(job)).toList();
  }
  @override
  Future<List<Wallpaper>> getWallpaperAnimeLove()async {
    // TODO: implement getMoviePopular
    var res = await
    request.requestApi(method: MethodType.GET, url: wallpaperAnimeLove);
    // Dio().get('http://192.168.10.100:8080/api/v1/news?type=1');
    var converRes = (res as dynamic);
    List<dynamic> data = converRes;
    // ignore: avoid_print
    print(data);
    return data.map((job) => new Wallpaper.fromJson(job)).toList();
  }
}