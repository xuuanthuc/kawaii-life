import 'package:get/get.dart';
import 'package:wibu_life/models/wallpaper/wallpaper_model.dart';
import 'package:wibu_life/modules/anime_list_wallpapers/anime_list_wallpaper_repository.dart';
import 'package:wibu_life/utils/constants/locale_key.dart';

class AnimeListController extends GetxController {
  final IAnimeListRepository animeListRepository = Get.find();
  var animeList = <Wallpaper>[].obs;
  RxBool isLoading = false.obs;

  Future<void> selectAnimeList(String title) async {
    if (title == LocaleKeys.ONE_PIECE) {
      isLoading.value = true;
      animeList.value = await animeListRepository.getAnimeOnePiece();
      isLoading.value = false;
    } else if (title == LocaleKeys.DRAGON_BALL) {
      isLoading.value = true;
      animeList.value = await animeListRepository.getAnimeDragonBall();
      isLoading.value = false;
    } else if (title == LocaleKeys.NARUTO) {
      isLoading.value = true;
      animeList.value = await animeListRepository.getAnimeNaruto();
      isLoading.value = true;
    } else if (title == LocaleKeys.BOKU_NO_HERO) {
      isLoading.value = true;
      animeList.value = await animeListRepository.getAnimeBokuNoHero();
      isLoading.value = false;
    } else if (title == LocaleKeys.DR_STONE) {
      isLoading.value = true;
      animeList.value = await animeListRepository.getAnimeDrStone();
      isLoading.value = true;
    } else if (title == LocaleKeys.DEMON_SLAYER) {
      isLoading.value = true;
      animeList.value = await animeListRepository.getAnimeDemonSlayer();
      isLoading.value = false;
    } else if (title == LocaleKeys.BORUTO) {
      isLoading.value = true;
      animeList.value = await animeListRepository.getAnimeBoruto();
      isLoading.value = true;
    } else if (title == LocaleKeys.FIRE_FORCE) {
      isLoading.value = true;
      animeList.value = await animeListRepository.getAnimeFireForce();
      isLoading.value = false;
    } else if (title == LocaleKeys.TOKYO_GHOUL) {
      isLoading.value = true;
      animeList.value = await animeListRepository.getAnimeTokyoGhoul();
      isLoading.value = true;
    } else if (title == LocaleKeys.FAIRY_TAIL) {
      isLoading.value = true;
      animeList.value = await animeListRepository.getAnimeFairyTail();
      isLoading.value = false;
    } else if (title == LocaleKeys.NANATSU_NO_TAIZAI) {
      isLoading.value = true;
      animeList.value = await animeListRepository.getAnimeNanatsuNoTaizai();
      isLoading.value = true;
    } else if (title == LocaleKeys.BLACK_CLOVER) {
      isLoading.value = true;
      animeList.value = await animeListRepository.getAnimeBlackClover();
      isLoading.value = false;
    } else if (title == LocaleKeys.BLEACH) {
      isLoading.value = true;
      animeList.value = await animeListRepository.getAnimeBleach();
      isLoading.value = true;
    } else if (title == LocaleKeys.ATTACH_ON_TITAN) {
      isLoading.value = true;
      animeList.value = await animeListRepository.getAnimeAttackOnTitan();
      isLoading.value = false;
    } else if (title == LocaleKeys.ONE_PUNCH_MAN) {
      isLoading.value = true;
      animeList.value = await animeListRepository.getAnimeOnePunchMan();
      isLoading.value = true;
    } else if (title == LocaleKeys.KUROKO_NO_BASKET) {
      isLoading.value = true;
      animeList.value = await animeListRepository.getAnimeKurokoNobasket();
      isLoading.value = false;
    } else if (title == LocaleKeys.GINTAMA) {
      isLoading.value = true;
      animeList.value = await animeListRepository.getAnimeGintama();
      isLoading.value = true;
    } else if (title == LocaleKeys.OVERLORD) {
      isLoading.value = true;
      animeList.value = await animeListRepository.getAnimeOverlord();
      isLoading.value = false;
    } else if (title == LocaleKeys.SWORD_ART_ONLINE) {
      isLoading.value = true;
      animeList.value = await animeListRepository.getAnimeSwordArtOnline();
      isLoading.value = true;
    } else if (title == LocaleKeys.RE_ZERO) {
      isLoading.value = true;
      animeList.value = await animeListRepository.getAnimeReZero();
      isLoading.value = false;
    } else if (title == LocaleKeys.NO_GAME_NO_LIFE) {
      isLoading.value = true;
      animeList.value = await animeListRepository.getAnimeNoGameNoLife();
      isLoading.value = true;
    } else if (title == LocaleKeys.KONOSUBA) {
      isLoading.value = true;
      animeList.value = await animeListRepository.getAnimeKonosuba();
      isLoading.value = false;
    } else if (title == LocaleKeys.DATE_A_LIVE) {
      isLoading.value = true;
      animeList.value = await animeListRepository.getAnimeDateALive();
      isLoading.value = true;
    } else if (title == LocaleKeys.KAKEGURUI) {
      isLoading.value = true;
      animeList.value = await animeListRepository.getAnimeKakegurui();
      isLoading.value = true;
    } else if (title == LocaleKeys.POKEMON) {
      isLoading.value = true;
      animeList.value = await animeListRepository.getAnimePokemon();
      isLoading.value = true;
    } else if (title == LocaleKeys.DURARARA) {
      isLoading.value = true;
      animeList.value = await animeListRepository.getAnimeDurarara();
      isLoading.value = true;
    } else if (title == LocaleKeys.MONOGATARI) {
      isLoading.value = true;
      animeList.value = await animeListRepository.getAnimeMonogarari();
      isLoading.value = true;
    } else if (title == LocaleKeys.LOG_HORIZON) {
      isLoading.value = true;
      animeList.value = await animeListRepository.getAnimeLogHorizon();
      isLoading.value = true;
    } else if (title == LocaleKeys.FATE_STAY_NIGHT) {
      isLoading.value = true;
      animeList.value = await animeListRepository.getAnimeFateStayNight();
      isLoading.value = true;
    } else if (title == LocaleKeys.HIGH_SCHOOL_DXD) {
      isLoading.value = true;
      animeList.value = await animeListRepository.getAnimeHighSchoolDXD();
      isLoading.value = true;
    } else if (title == LocaleKeys.TO_LOVE_RU) {
      isLoading.value = true;
      animeList.value = await animeListRepository.getAnimeToLoveRu();
      isLoading.value = true;
    } else if (title == LocaleKeys.SERAPH_OF_THE_END) {
      isLoading.value = true;
      animeList.value = await animeListRepository.getAnimeSeraphOfTheEnd();
      isLoading.value = true;
    } else if (title == LocaleKeys.ZERO_TWO) {
      isLoading.value = true;
      animeList.value = await animeListRepository.getAnimeZeroTwo();
      isLoading.value = true;
    } else if (title == LocaleKeys.KABANERI_OF_THE_IRON_FORTRESS) {
      isLoading.value = true;
      animeList.value = await animeListRepository.getAnimeKabaneri();
      isLoading.value = true;
    }
  }
}
