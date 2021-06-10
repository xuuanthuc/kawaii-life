

//get link api news
const getAnimeNews = 'api/v1/news?type=2';
const getMangaNews = 'api/v1/news?type=1';
const getCosplay = 'api/v1/news?type=3';
const getFigure = 'api/v1/news?type=4';
const getNomination = 'api/v1/news?type=5';
//get link api wallpaper
const getAnimeWallpaper = 'api/v1/wallpaper?type=1';
const getAnimeGirlsWallpaper = 'api/v1/wallpaper?type=2';
const getAnimeAestheticWallpaper = 'api/v1/wallpaper?type=3';
const getAnimeBoysWallpaper = 'api/v1/wallpaper?type=4';
const getAnimeLoveWallpaper = 'api/v1/wallpaper?type=5';
//get link api animelist
const getAnimeOnePiece = 'api/v1/wallpaper?type=6';
const getAnimeDragonBall = 'api/v1/wallpaper?type=7';
const getAnimeNarto = 'api/v1/wallpaper?type=8';
const getAnimeBokuNoHero = 'api/v1/wallpaper?type=9';
const getAnimeDrStone = 'api/v1/wallpaper?type=10';
const getAnimeDemonSlayer = 'api/v1/wallpaper?type=11';
const getAnimeBoruto = 'api/v1/wallpaper?type=12';
const getAnimeFireForce = 'api/v1/wallpaper?type=13';
const getAnimeTokyoGhoul = 'api/v1/wallpaper?type=14';
const getAnimeFairyTail = 'api/v1/wallpaper?type=15';
const getAnimeNanatsuNoTaizai = 'api/v1/wallpaper?type=16';
const getAnimeBlackClover = 'api/v1/wallpaper?type=17';
const getAnimeBleach = 'api/v1/wallpaper?type=18';
const getAnimeAttackOnTitan = 'api/v1/wallpaper?type=19';
const getAnimeOnePunchMan = 'api/v1/wallpaper?type=20';
const getAnimeKurokoNoBasket = 'api/v1/wallpaper?type=21';
const getAnimeGintama = 'api/v1/wallpaper?type=22';
const getAnimeOverlord = 'api/v1/wallpaper?type=23';
const getAnimeSwordArtOnline = 'api/v1/wallpaper?type=24';
const getAnimeReZero = 'api/v1/wallpaper?type=25';
const getAnimeNoGameNoLife = 'api/v1/wallpaper?type=26';
const getAnimeKonosuba = 'api/v1/wallpaper?type=27';
const getAnimeDateALive = 'api/v1/wallpaper?type=28';
const getAnimeKakegurui = 'api/v1/wallpaper?type=29';
const getAnimePokemon = 'api/v1/wallpaper?type=30';
const getAnimeDurarara = 'api/v1/wallpaper?type=31';
const getAnimeMonogatari = 'api/v1/wallpaper?type=32';
const getAnimeLogHorizon = 'api/v1/wallpaper?type=33';
const getAnimeFateStayNight = 'api/v1/wallpaper?type=34';
const getAnimeHightSchoolDxD = 'api/v1/wallpaper?type=35';
const getAnimeToLoveRu = 'api/v1/wallpaper?type=36';
const getAnimeSeraphOfTheEnd = 'api/v1/wallpaper?type=37';
const getAnimeZeroTwo = 'api/v1/wallpaper?type=38';
const getAnimeKabaneriOfTheIronFortres = 'api/v1/wallpaper?type=39';



//Môi trường dev

class NewsEnvironment{
  final baseUrl = "http://192.168.28.171:8080/";
  // final baseUrl = "https://raw.githubusercontent.com/XuannThucc/bot_crawl_wibu_data/master/out/";
  final receiveTimeout = 2 * 60 * 1000;
  final connectTimeout = 2 * 60 * 1000;
}
final environment = NewsEnvironment();

enum MethodType {GET, POST}
