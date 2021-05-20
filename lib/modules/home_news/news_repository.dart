import 'package:wibu_life/models/news/news_model.dart';

abstract class INewsRepository{
  Future<List<News>> getAnimeNews();
  Future<List<News>> getMangaNews();
}