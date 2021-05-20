import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wibu_life/models/news/news_model.dart';
import 'package:wibu_life/modules/home_news/controllers/news_controller.dart';
import 'package:wibu_life/themes/app_colors.dart';
import 'package:wibu_life/themes/app_theme.dart';
import 'package:wibu_life/utils/common/screen_util.dart';
class NewsDetail extends StatelessWidget {
  NewsController newsController = Get.find();
  @override
  Widget build(BuildContext context) {
    int newsId = Get.arguments[0];
    String newsTitle = Get.arguments[1];
    String newsContent = Get.arguments[2];
    int newsViews = Get.arguments[3];
    String newsDesc = Get.arguments[4];
    String newsThumbnail = Get.arguments[5];
    Genre newsGenre = Get.arguments[6];
    String newsDate = Get.arguments[7];
    DateTime dateFormat = new DateFormat("yyyy-MM-dd hh:mm:ss").parse(newsDate);
    String datePublics = DateFormat("dd/MM/yyyy").format(dateFormat);
    return Scaffold(

      body: GetBuilder<NewsController>(
        init: newsController,
        builder: (index) => CustomScrollView(
          slivers: [
            SliverAppBar(
              bottom: PreferredSize(
                child: AppBar(
                  elevation: 0,
                  automaticallyImplyLeading: false,
                  centerTitle: true,
                  backgroundColor: Colors.white,
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: w(4),
                        height: h(40),
                        color: primaryColor,
                      ),
                      SizedBox(width: w(5),),
                      Flexible(child: Text(newsTitle,maxLines: 3, style: robotoW500(s(16), primaryTextColor),)),
                    ],
                  ),
                ),
                preferredSize: Size.fromHeight(h(75)),
              ),
              floating: false,
              pinned: false,
              centerTitle: true,
              flexibleSpace: Padding(
                padding:  EdgeInsets.only(bottom: h(10)),
                child: Image.network(newsThumbnail, fit: BoxFit.cover,),
              ),
              snap: false,
              elevation: 0,
              expandedHeight: h(290),
              backgroundColor: Colors.white,
            ),
            SliverList(delegate: SliverChildBuilderDelegate(
                (context, index) => Container(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: w(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: w(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(r(4)),
                                  color: Colors.amberAccent
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text('${newsGenre.name}',style: robotoW600(s(10), Colors.black),),
                                ),
                              ),
                              Spacer(),
                              Text(datePublics, style: robotoW500(s(13), Colors.grey),)
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          child: Html(
                            data: """ ${newsContent} """,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              childCount: 1
            ),)
          ],
        ),
      ),
    );
  }
}
