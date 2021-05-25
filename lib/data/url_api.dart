


const getAnimeNews = 'api/v1/news?type=2';
// const getMangaNews = 'news.json';
const getMangaNews = 'api/v1/news?type=1';
const getCosplay = 'api/v1/news?type=3';
const getFigure = 'api/v1/news?type=4';
const getNomination = 'api/v1/news?type=5';
//Môi trường dev

class NewsEnvironment{
  final baseUrl = "http://192.168.10.100:8080/";
  // final baseUrl = "https://raw.githubusercontent.com/XuannThucc/bot_crawl_wibu_data/master/out/";
  final receiveTimeout = 2 * 60 * 1000;
  final connectTimeout = 2 * 60 * 1000;
}
final environment = NewsEnvironment();

enum MethodType {GET, POST}
