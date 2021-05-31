

import 'package:wibu_life/models/wallpaper/wallpaper_model.dart';

abstract class IWallPaperRepository{
  Future<List<Wallpaper>> getWallpaperAnime();
}