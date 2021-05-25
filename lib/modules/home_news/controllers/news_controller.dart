import 'package:get/get.dart';
import 'package:wibu_life/models/news/news_model.dart';
import 'package:wibu_life/utils/constants/locale_key.dart';

import '../news_repository.dart';

class NewsController extends GetxController {
  // var movies = List<MoviePopularModel>();
  // var animeNews = News().obs;

  var selectCategory = <News>[].obs;
  final INewsRepository newsRepository = Get.find();
  RxString _title = LocaleKeys.ANIME_NEWS.obs;
  String get title => _title.value;
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    selectNewsCategories(title);
  }
  RxInt index = 0.obs;

  Future<void> incre() async {

    isLoading.value = true;
    await index.value++;
    isLoading.value = false;

  }
  Future<void> decre() async{
    isLoading.value = true;
    await index.value--;
    isLoading.value = false;
  }

  Future<void> slideNewsPage() async {
    isLoading.value = true;
    if(index.value == 0){
      selectCategory.value = await newsRepository.getAnimeNews();
    } else if (index.value == 1){
      selectCategory.value = await newsRepository.getMangaNews();
    } else if (index.value == 2){
      selectCategory.value = await newsRepository.getCosplay();
    } else if (index.value == 3){
      selectCategory.value = await newsRepository.getNomination();
    } else if (index.value == 4){
      selectCategory.value = await newsRepository.getFigure();
    } else if (index.value == -1){
      index.value == 1;
    }
    else if (index.value == 5){
      index.value == 0;
    }
    print(index.value);
    isLoading.value = false;
    update();
  }

  Future<void> selectNewsCategories(String category) async {
    isLoading.value = true;
    if (category == LocaleKeys.ANIME_NEWS) {
      selectCategory.value = await newsRepository.getAnimeNews();
    } else if (category == LocaleKeys.MANGA_NEWS) {
      selectCategory.value = await newsRepository.getMangaNews();
    } else if (category == LocaleKeys.COSPLAY) {
      selectCategory.value = await newsRepository.getCosplay();
    } else if (category == LocaleKeys.FIGURE) {
      selectCategory.value = await newsRepository.getFigure();
    } else if (category == LocaleKeys.NOMINATION) {
      selectCategory.value = await newsRepository.getNomination();
    }
    isLoading.value = false;

    update();
  }
}
