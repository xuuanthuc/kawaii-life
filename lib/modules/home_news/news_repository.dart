import 'package:wibu_life/models/news/news_model.dart';

abstract class INewsRepository{
  Future<List<News>> getAnimeNews();
  Future<List<News>> getMangaNews();
  Future<List<News>> getCosplay();
  Future<List<News>> getFigure();
  Future<List<News>> getNomination();
}