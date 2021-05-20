import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wibu_life/app_papes.dart';
import 'package:wibu_life/modules/home_news/controllers/news_controller.dart';
import 'package:wibu_life/themes/app_colors.dart';
import 'package:wibu_life/themes/app_theme.dart';
import 'package:wibu_life/utils/common/screen_util.dart';
import 'package:wibu_life/utils/constants/locale_key.dart';

NewsController newsController = Get.find();

class AnimeListWidget extends StatelessWidget {
  // String title;
  // AnimeListWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<NewsController>(
      init: newsController,
      builder: (index) => SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            String? dateTime = newsController.selectCategory[index].publishedAt;
            DateTime dateFormat = new DateFormat("yyyy-MM-dd hh:mm:ss").parse(dateTime!);
            String datePublics = DateFormat("dd/MM/yyyy").format(dateFormat);
            return GestureDetector(
              onTap: (){
                Get.toNamed(Routes.NEWS_DETAIL, arguments: [
                  newsController.selectCategory[index].id,
                  newsController.selectCategory[index].title,
                  newsController.selectCategory[index].content,
                  newsController.selectCategory[index].views,
                  newsController.selectCategory[index].description,
                  newsController.selectCategory[index].thumbnail,
                  newsController.selectCategory[index].genre,
                  newsController.selectCategory[index].publishedAt,
                ]);
              },
              child: Padding(
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
                    elevation: 0,
                    child: Column(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                r(4),
                              ),
                              topRight: Radius.circular(
                                r(4),
                              ),
                            ),
                            child: FadeInImage.assetNetwork(placeholder: 'assets/images/loading.gif',image: '${newsController.selectCategory[index].thumbnail}'),),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: w(12), vertical: h(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: w(2),
                                    height: h(20),
                                    color: primaryColor,
                                  ),
                                  SizedBox(width: w(5),),
                                  Flexible(child: Text('${newsController.selectCategory[index].title}', maxLines: 3, overflow: TextOverflow.ellipsis, style: robotoW600(s(15), primaryTextColor),)),
                                ],
                              ),
                              SizedBox(height: h(8),),
                              Text('${newsController.selectCategory[index].description}', maxLines: 3,overflow: TextOverflow.ellipsis,style: robotoW400(s(13),greyTextColor),),
                              SizedBox(height: h(5),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('${newsController.selectCategory[index].genre!.name}', style: robotoW500(s(11), primaryColor),),
                                  Spacer(),
                                  Text('${datePublics}',style: robotoW500(s(11), Colors.grey),),
                                  SizedBox(width: w(5),),
                                  Icon(Icons.access_time, color: Colors.grey,size: s(17),),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          childCount: newsController.selectCategory.length,
        ),
      ),
    );
  }
}
