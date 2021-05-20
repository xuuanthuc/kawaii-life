import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wibu_life/modules/home_news/controllers/news_controller.dart';
import 'package:wibu_life/themes/app_theme.dart';
import 'package:wibu_life/utils/constants/locale_key.dart';

import '/utils/common/screen_util.dart';

class CategoriesNews extends StatelessWidget {
  NewsController newsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Padding(
          padding: EdgeInsets.only(left: w(8)),
          child: Container(
            height: h(110),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CategoryTileDesign(
                    image: 'assets/images/anime_news_category.jpg',
                    title: LocaleKeys.ANIME_NEWS.tr,
                    ontap: () {
                      newsController.selectNewsCategories(LocaleKeys.ANIME_NEWS);

                    }),
                CategoryTileDesign(
                    image: 'assets/images/manga_news_category.jpg',
                    title: LocaleKeys.MANGA_NEWS.tr,
                    ontap: () {
                      newsController.selectNewsCategories(LocaleKeys.MANGA_NEWS);
                    }),
                CategoryTileDesign(
                    image: 'assets/images/cosplay_category.jpg',
                    title: LocaleKeys.COSPLAY.tr,
                    ontap: () {
                      newsController.selectNewsCategories(LocaleKeys.COSPLAY);
                    }),
                CategoryTileDesign(
                    image: 'assets/images/nomination_category.jpg',
                    title: LocaleKeys.NOMINATION.tr,
                    ontap: () {
                      newsController.selectNewsCategories(LocaleKeys.NOMINATION);
                    }),
                CategoryTileDesign(
                    image: 'assets/images/figure_category.jpg',
                    title: LocaleKeys.FIGURE.tr,
                    ontap: () {
                      newsController.selectNewsCategories(LocaleKeys.FIGURE);
                    }),
              ],
            ),
          ),
        );
      }, childCount: 1),
    );
  }
}

Widget CategoryTileDesign(
    {required String image,
    required String title,
    required Function()? ontap}) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      width: w(180),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(r(10)),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(r(10)),
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
          ),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(r(10)),
                  color: Color(0x40000000),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: robotoW700(s(16), Colors.white),
                    ),
                    Container(
                      width: w(70),
                      height: h(1),
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
