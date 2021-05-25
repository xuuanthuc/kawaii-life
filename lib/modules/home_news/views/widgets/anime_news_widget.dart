import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wibu_life/app_papes.dart';
import 'package:wibu_life/modules/common/widgets/effect_widget.dart';
import 'package:wibu_life/modules/home_news/controllers/news_controller.dart';
import 'package:wibu_life/modules/home_news/views/widgets/switch_category_tag.dart';
import 'package:wibu_life/themes/app_colors.dart';
import 'package:wibu_life/themes/app_icon.dart';
import 'package:wibu_life/themes/app_theme.dart';
import 'package:wibu_life/utils/common/screen_util.dart';
import 'package:wibu_life/utils/constants/locale_key.dart';

NewsController newsController = Get.find();
final ScrollController _scrollController = ScrollController();

  Widget  animeListWidget() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          String? dateTime = newsController.selectCategory[index].publishedAt;
          DateTime dateFormat = new DateFormat("yyyy-MM-dd hh:mm:ss").parse(
              dateTime!);
          String datePublics = DateFormat("dd/MM/yyyy").format(dateFormat);
          return Dismissible(
            background: Padding(
              padding: EdgeInsets.symmetric(horizontal: w(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(child: SvgPicture.asset(icon.left,color: primaryColorShade100,)),
                  Center(child: SvgPicture.asset(icon.right,color: primaryColorShade100,)),
                ],
              ),
            ),
            key: UniqueKey(),
            onDismissed: (direction) async {
              if(direction == DismissDirection.endToStart && newsController.index.value <= 3){
                await newsController.incre();
                await newsController.slideNewsPage();
              } else if(direction == DismissDirection.startToEnd && newsController.index.value >= 1) {
                await newsController.decre();
                await newsController.slideNewsPage();
              } else if(direction == DismissDirection.startToEnd && newsController.index.value == 0 ) {
                await newsController.selectNewsCategories(LocaleKeys.ANIME_NEWS);
              } else if(direction == DismissDirection.endToStart && newsController.index.value == 4 ) {
                await newsController.selectNewsCategories(LocaleKeys.FIGURE);

              }
            },
            child: GestureDetector(
              onTap: () {
                Get.toNamed(Routes.NEWS_DETAIL, arguments: [
                  newsController.selectCategory[index].id,
                  newsController.selectCategory[index].title,
                  newsController.selectCategory[index].content,
                  newsController.selectCategory[index].views,
                  newsController.selectCategory[index].description,
                  newsController.selectCategory[index].thumbnail,
                  newsController.selectCategory[index].genre,
                  newsController.selectCategory[index].publishedAt,
                  index,
                ]);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: w(15), vertical: h(5)),
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
                          child: FadeInImage.assetNetwork(
                              placeholder: 'assets/images/loading.gif',
                              image: '${newsController.selectCategory[index]
                                  .thumbnail}'),),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: w(12), vertical: h(10)),
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
                                  Flexible(child: Text(
                                    '${newsController.selectCategory[index]
                                        .title}', maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: robotoW600(
                                        s(15), primaryTextColor),)),
                                ],
                              ),
                              SizedBox(height: h(8),),
                              Text('${newsController.selectCategory[index]
                                  .description}', maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: robotoW400(s(13), greyTextColor),),
                              SizedBox(height: h(5),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  SwitchCagetoryTag(title: '${newsController.selectCategory[index].genre!.name}',),
                                  const Spacer(),
                                  Text('${datePublics}',
                                    style: robotoW500(s(11), Colors.grey),),
                                  SizedBox(width: w(5),),
                                  SvgPicture.asset(icon.time_icon, color: Colors.grey,width: s(15), height: s(15),)
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
            ),
          );
        },
        childCount: newsController.selectCategory.length,
      ),
  );
  }

