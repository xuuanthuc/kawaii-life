import 'package:wibu_life/data/url_api.dart';
import 'package:wibu_life/models/wallpaper/wallpaper_model.dart';
import 'package:wibu_life/modules/anime_list_wallpapers/anime_list_wallpaper_repository.dart';
import '../request.dart';


final wallpaperOnePiece = '$getAnimeOnePiece';
final wallpaperDragonBall = '$getAnimeDragonBall';
final wallpaperNaruto = '$getAnimeNarto';
final wallpaperBokuNoHero = '$getAnimeBokuNoHero';
final wallpaperDrStone = '$getAnimeDrStone';
final wallpaperDemonSlayer = '$getAnimeDemonSlayer';
final wallpaperBoruto = '$getAnimeBoruto';
final wallpaperFireForce = '$getAnimeFireForce';
final wallpaperTokyoGhoul = '$getAnimeTokyoGhoul';
final wallpaperFairyTail = '$getAnimeFairyTail';
final wallpaperNanatsuNoTaizai = '$getAnimeNanatsuNoTaizai';
final wallpaperBlackClover = '$getAnimeBlackClover';
final wallpaperBleach = '$getAnimeBleach';
final wallpaperAttackOnTitan = '$getAnimeAttackOnTitan';
final wallpaperOnePunchMan = '$getAnimeOnePunchMan';
final wallpaperKurokoNoBasket = '$getAnimeKurokoNoBasket';
final wallpaperGintama = '$getAnimeGintama';
final wallpaperOverlord = '$getAnimeOverlord';
final wallpaperPokemon = '$getAnimePokemon';
final wallpaperSwordArtOnline = '$getAnimeSwordArtOnline';
final wallpaperReZero = '$getAnimeReZero';
final wallpaperNoGameNoLife = '$getAnimeNoGameNoLife';
final wallpaperKonosuba = '$getAnimeKonosuba';
final wallpaperDateALive = '$getAnimeDateALive';
final wallpaperKakegurui = '$getAnimeKakegurui';
final wallpaperDurarara = '$getAnimeDurarara';
final wallpaperMonogatari = '$getAnimeMonogatari';
final wallpaperLogHorizon = '$getAnimeLogHorizon';
final wallpaperFateStayNight = '$getAnimeFateStayNight';
final wallpaperHighSchoolDXD = '$getAnimeHightSchoolDxD';
final wallpaperSeraphOfTheEnd = '$getAnimeSeraphOfTheEnd';
final wallpaperToLoveRu = '$getAnimeToLoveRu';
final wallpaperZeroTwo = '$getAnimeZeroTwo';
final wallpaperKabaneri = '$getAnimeKabaneriOfTheIronFortres';


class AnimeListRepository implements IAnimeListRepository{
  Request request = Request();
  @override
  Future<List<Wallpaper>> getAnimeOnePiece()async {
    var res = await
    request.requestApi(method: MethodType.GET, url: wallpaperOnePiece);
    var converRes = (res as dynamic);
    List<dynamic> data = converRes;
    return data.map((job) => new Wallpaper.fromJson(job)).toList();
  }
  @override
  Future<List<Wallpaper>> getAnimeDragonBall()async {
    var res = await
    request.requestApi(method: MethodType.GET, url: wallpaperDragonBall);
    var converRes = (res as dynamic);
    List<dynamic> data = converRes;
    return data.map((job) => new Wallpaper.fromJson(job)).toList();
  }
  @override
  Future<List<Wallpaper>> getAnimeNaruto()async {
    var res = await
    request.requestApi(method: MethodType.GET, url: wallpaperNaruto);
    var converRes = (res as dynamic);
    List<dynamic> data = converRes;
    return data.map((job) => new Wallpaper.fromJson(job)).toList();
  }
  @override
  Future<List<Wallpaper>> getAnimeBokuNoHero()async {
    var res = await
    request.requestApi(method: MethodType.GET, url: wallpaperBokuNoHero);
    var converRes = (res as dynamic);
    List<dynamic> data = converRes;
    return data.map((job) => new Wallpaper.fromJson(job)).toList();
  }
  @override
  Future<List<Wallpaper>> getAnimeDrStone()async {
    var res = await
    request.requestApi(method: MethodType.GET, url: wallpaperDrStone);
    var converRes = (res as dynamic);
    List<dynamic> data = converRes;
    return data.map((job) => new Wallpaper.fromJson(job)).toList();
  }
  @override
  Future<List<Wallpaper>> getAnimeDemonSlayer()async {
    var res = await
    request.requestApi(method: MethodType.GET, url: wallpaperDemonSlayer);
    var converRes = (res as dynamic);
    List<dynamic> data = converRes;
    return data.map((job) => new Wallpaper.fromJson(job)).toList();
  }
  @override
  Future<List<Wallpaper>> getAnimeBoruto()async {
    var res = await
    request.requestApi(method: MethodType.GET, url: wallpaperBoruto);
    var converRes = (res as dynamic);
    List<dynamic> data = converRes;
    return data.map((job) => new Wallpaper.fromJson(job)).toList();
  }
  @override
  Future<List<Wallpaper>> getAnimeFireForce()async {
    var res = await
    request.requestApi(method: MethodType.GET, url: wallpaperFireForce);
    var converRes = (res as dynamic);
    List<dynamic> data = converRes;
    return data.map((job) => new Wallpaper.fromJson(job)).toList();
  }
  @override
  Future<List<Wallpaper>> getAnimeTokyoGhoul()async {
    var res = await
    request.requestApi(method: MethodType.GET, url: wallpaperTokyoGhoul);
    var converRes = (res as dynamic);
    List<dynamic> data = converRes;
    return data.map((job) => new Wallpaper.fromJson(job)).toList();
  }
  @override
  Future<List<Wallpaper>> getAnimeFairyTail()async {
    var res = await
    request.requestApi(method: MethodType.GET, url: wallpaperFairyTail);
    var converRes = (res as dynamic);
    List<dynamic> data = converRes;
    return data.map((job) => new Wallpaper.fromJson(job)).toList();
  }
  @override
  Future<List<Wallpaper>> getAnimeNanatsuNoTaizai()async {
    var res = await
    request.requestApi(method: MethodType.GET, url: wallpaperNanatsuNoTaizai);
    var converRes = (res as dynamic);
    List<dynamic> data = converRes;
    return data.map((job) => new Wallpaper.fromJson(job)).toList();
  }
  @override
  Future<List<Wallpaper>> getAnimeBlackClover()async {
    var res = await
    request.requestApi(method: MethodType.GET, url: wallpaperBlackClover);
    var converRes = (res as dynamic);
    List<dynamic> data = converRes;
    return data.map((job) => new Wallpaper.fromJson(job)).toList();
  }
  @override
  Future<List<Wallpaper>> getAnimeBleach()async {
    var res = await
    request.requestApi(method: MethodType.GET, url: wallpaperBleach);
    var converRes = (res as dynamic);
    List<dynamic> data = converRes;
    return data.map((job) => new Wallpaper.fromJson(job)).toList();
  }
  @override
  Future<List<Wallpaper>> getAnimeAttackOnTitan()async {
    var res = await
    request.requestApi(method: MethodType.GET, url: wallpaperAttackOnTitan);
    var converRes = (res as dynamic);
    List<dynamic> data = converRes;
    return data.map((job) => new Wallpaper.fromJson(job)).toList();
  }
  @override
  Future<List<Wallpaper>> getAnimeOnePunchMan()async {
    var res = await
    request.requestApi(method: MethodType.GET, url: wallpaperOnePunchMan);
    var converRes = (res as dynamic);
    List<dynamic> data = converRes;
    return data.map((job) => new Wallpaper.fromJson(job)).toList();
  }
  @override
  Future<List<Wallpaper>> getAnimeKurokoNobasket()async {
    var res = await
    request.requestApi(method: MethodType.GET, url: wallpaperKurokoNoBasket);
    var converRes = (res as dynamic);
    List<dynamic> data = converRes;
    return data.map((job) => new Wallpaper.fromJson(job)).toList();
  }
  @override
  Future<List<Wallpaper>> getAnimeGintama()async {
    var res = await
    request.requestApi(method: MethodType.GET, url: wallpaperGintama);
    var converRes = (res as dynamic);
    List<dynamic> data = converRes;
    return data.map((job) => new Wallpaper.fromJson(job)).toList();
  }
  @override
  Future<List<Wallpaper>> getAnimeOverlord()async {
    var res = await
    request.requestApi(method: MethodType.GET, url: wallpaperOverlord);
    var converRes = (res as dynamic);
    List<dynamic> data = converRes;
    return data.map((job) => new Wallpaper.fromJson(job)).toList();
  }
  @override
  Future<List<Wallpaper>> getAnimeSwordArtOnline()async {
    var res = await
    request.requestApi(method: MethodType.GET, url: wallpaperSwordArtOnline);
    var converRes = (res as dynamic);
    List<dynamic> data = converRes;
    return data.map((job) => new Wallpaper.fromJson(job)).toList();
  }
  @override
  Future<List<Wallpaper>> getAnimeReZero()async {
    var res = await
    request.requestApi(method: MethodType.GET, url: wallpaperReZero);
    var converRes = (res as dynamic);
    List<dynamic> data = converRes;
    return data.map((job) => new Wallpaper.fromJson(job)).toList();
  }
  @override
  Future<List<Wallpaper>> getAnimeNoGameNoLife()async {
    var res = await
    request.requestApi(method: MethodType.GET, url: wallpaperNoGameNoLife);
    var converRes = (res as dynamic);
    List<dynamic> data = converRes;
    return data.map((job) => new Wallpaper.fromJson(job)).toList();
  }
  @override
  Future<List<Wallpaper>> getAnimeKonosuba()async {
    var res = await
    request.requestApi(method: MethodType.GET, url: wallpaperKonosuba);
    var converRes = (res as dynamic);
    List<dynamic> data = converRes;
    return data.map((job) => new Wallpaper.fromJson(job)).toList();
  }
  @override
  Future<List<Wallpaper>> getAnimeDateALive()async {
    var res = await
    request.requestApi(method: MethodType.GET, url: wallpaperDateALive);
    var converRes = (res as dynamic);
    List<dynamic> data = converRes;
    return data.map((job) => new Wallpaper.fromJson(job)).toList();
  }
  @override
  Future<List<Wallpaper>> getAnimeKakegurui()async {
    var res = await
    request.requestApi(method: MethodType.GET, url: wallpaperKakegurui);
    var converRes = (res as dynamic);
    List<dynamic> data = converRes;
    return data.map((job) => new Wallpaper.fromJson(job)).toList();
  }
  @override
  Future<List<Wallpaper>> getAnimePokemon()async {
    var res = await
    request.requestApi(method: MethodType.GET, url: wallpaperPokemon);
    var converRes = (res as dynamic);
    List<dynamic> data = converRes;
    return data.map((job) => new Wallpaper.fromJson(job)).toList();
  }
  @override
  Future<List<Wallpaper>> getAnimeDurarara()async {
    var res = await
    request.requestApi(method: MethodType.GET, url: wallpaperDurarara);
    var converRes = (res as dynamic);
    List<dynamic> data = converRes;
    return data.map((job) => new Wallpaper.fromJson(job)).toList();
  }
  @override
  Future<List<Wallpaper>> getAnimeMonogarari()async {
    var res = await
    request.requestApi(method: MethodType.GET, url: wallpaperMonogatari);
    var converRes = (res as dynamic);
    List<dynamic> data = converRes;
    return data.map((job) => new Wallpaper.fromJson(job)).toList();
  }
  @override
  Future<List<Wallpaper>> getAnimeLogHorizon()async {
    var res = await
    request.requestApi(method: MethodType.GET, url: wallpaperLogHorizon);
    var converRes = (res as dynamic);
    List<dynamic> data = converRes;
    return data.map((job) => new Wallpaper.fromJson(job)).toList();
  }
  @override
  Future<List<Wallpaper>> getAnimeFateStayNight()async {
    var res = await
    request.requestApi(method: MethodType.GET, url: wallpaperFateStayNight);
    var converRes = (res as dynamic);
    List<dynamic> data = converRes;
    return data.map((job) => new Wallpaper.fromJson(job)).toList();
  }
  @override
  Future<List<Wallpaper>> getAnimeHighSchoolDXD()async {
    var res = await
    request.requestApi(method: MethodType.GET, url: wallpaperHighSchoolDXD);
    var converRes = (res as dynamic);
    List<dynamic> data = converRes;
    return data.map((job) => new Wallpaper.fromJson(job)).toList();
  }
  @override
  Future<List<Wallpaper>> getAnimeToLoveRu()async {
    var res = await
    request.requestApi(method: MethodType.GET, url: wallpaperToLoveRu);
    var converRes = (res as dynamic);
    List<dynamic> data = converRes;
    print(data);
    return data.map((job) => new Wallpaper.fromJson(job)).toList();
  }
  @override
  Future<List<Wallpaper>> getAnimeSeraphOfTheEnd()async {
    var res = await
    request.requestApi(method: MethodType.GET, url: wallpaperSeraphOfTheEnd);
    var converRes = (res as dynamic);
    List<dynamic> data = converRes;
    return data.map((job) => new Wallpaper.fromJson(job)).toList();
  }
  @override
  Future<List<Wallpaper>> getAnimeZeroTwo()async {
    var res = await
    request.requestApi(method: MethodType.GET, url: wallpaperZeroTwo);
    var converRes = (res as dynamic);
    List<dynamic> data = converRes;
    return data.map((job) => new Wallpaper.fromJson(job)).toList();
  }
  @override
  Future<List<Wallpaper>> getAnimeKabaneri()async {
    var res = await
    request.requestApi(method: MethodType.GET, url: wallpaperKabaneri);
    var converRes = (res as dynamic);
    List<dynamic> data = converRes;
    return data.map((job) => new Wallpaper.fromJson(job)).toList();
  }

}