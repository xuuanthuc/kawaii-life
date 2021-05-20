


const getAnimeNews = 'animenews.json';
const getMangaNews = 'manganews.json';
const getCosplay = 'cosplay.json';
const getFigure = 'figure.json';
const getNomination = 'nominations.json';
//Môi trường dev

class NewsEnvironment{
  final baseUrl = "https://raw.githubusercontent.com/XuannThucc/bot_crawl_wibu_data/master/out/";
  final receiveTimeout = 2 * 60 * 1000;
  final connectTimeout = 2 * 60 * 1000;
}

final environment = NewsEnvironment();

enum MethodType {GET, POST}
