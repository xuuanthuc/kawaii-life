

import 'package:wibu_life/models/wallpaper/wallpaper_model.dart';

abstract class IWallPaperRepository{
  Future<List<Wallpaper>> getWallpaperAnime();
  Future<List<Wallpaper>> getWallpaperAnimeGirls();
  Future<List<Wallpaper>> getWallpaperAnimeBoys();
  Future<List<Wallpaper>> getWallpaperAnimeLove();
  Future<List<Wallpaper>> getWallpaperAnimeAesthetic();
}