import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wibu_life/modules/home_news/controllers/news_controller.dart';
import 'package:wibu_life/themes/app_colors.dart';
import 'package:wibu_life/themes/app_theme.dart';
import 'package:wibu_life/utils/common/screen_util.dart';

NewsController newsController = Get.find();

class AnimeListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsController>(
      init: newsController,
      builder: (index) => SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: w(15), vertical: h(5)),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade100,
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(
                        r(20),
                      ),
                      topLeft: Radius.circular(
                        r(20),
                      ),
                    ),
                  ),
                  elevation: 0,
                  child: Column(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                              r(20),
                            ),
                          ),
                          child: Image.network('${newsController.animeNews[index].thumbnail}')),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${newsController.animeNews[index].title}', maxLines: 3, overflow: TextOverflow.ellipsis, style: robotoW600(s(16), primaryTextColor),),
                            Text('${newsController.animeNews[index].description}', maxLines: 3,overflow: TextOverflow.ellipsis,style: robotoW400(s(13),greyTextColor),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          childCount: newsController.animeNews.length,
        ),
      ),
    );
  }
}
