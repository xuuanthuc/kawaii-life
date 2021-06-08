import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wibu_life/models/news/news_model.dart';
import 'package:wibu_life/modules/home_news/controllers/news_controller.dart';
import 'package:wibu_life/themes/app_icon.dart';
import 'package:wibu_life/themes/app_theme.dart';
import 'package:wibu_life/utils/constants/locale_key.dart';

import '/utils/common/screen_util.dart';


 Widget CategoriesNews() {
   final NewsController newsController = Get.find();
    return SliverList(
    delegate: SliverChildBuilderDelegate((context, index) {
      return Padding(
        padding: EdgeInsets.only(left: w(8)),
        child: Container(
          height: h(110),
          child: ListView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: [
              CategoryTileDesign(
                  image: icon.anime_news,
                  title: LocaleKeys.ANIME_NEWS.tr,
                  ontap: () async {
                    await newsController.selectNewsCategories(LocaleKeys.ANIME_NEWS);
                  }),
              CategoryTileDesign(
                  image: icon.manga_news,
                  title: LocaleKeys.MANGA_NEWS.tr,
                  ontap: () async {
                    await newsController.selectNewsCategories(LocaleKeys.MANGA_NEWS);
                  }),
              CategoryTileDesign(
                  image: icon.cosplay_news,
                  title: LocaleKeys.COSPLAY.tr,
                  ontap: () async {
                   await newsController.selectNewsCategories(LocaleKeys.COSPLAY);


                  }),
              CategoryTileDesign(
                  image: icon.nomination_news,
                  title: LocaleKeys.NOMINATION.tr,
                  ontap: ()async {
                   await newsController.selectNewsCategories(LocaleKeys.NOMINATION);


                  }),
              CategoryTileDesign(
                  image: icon.figure_news,
                  title: LocaleKeys.FIGURE.tr,
                  ontap: ()async  {
                   await newsController.selectNewsCategories(LocaleKeys.FIGURE);
                  }),
            ],
          ),
        ),
      );
    }, childCount: 1),
  );
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
