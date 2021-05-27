import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:photo_view/photo_view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wibu_life/models/news/news_model.dart';
import 'package:wibu_life/modules/home_news/controllers/news_controller.dart';
import 'package:wibu_life/modules/home_news/views/widgets/switch_tag_name_genre.dart';
import 'package:wibu_life/themes/app_colors.dart';
import 'package:wibu_life/themes/app_theme.dart';
import 'package:wibu_life/utils/common/screen_util.dart';
import 'package:wibu_life/utils/constants/locale_key.dart';

import '../../../app_papes.dart';

class NewsDetail extends StatelessWidget {
  NewsController newsController = Get.find();
  final ScrollController _scrollController = ScrollController();
  final PhotoViewController _photoViewController = PhotoViewController();

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
    int currentIndex = Get.arguments[8];
    DateTime dateFormat = new DateFormat("yyyy-MM-dd hh:mm:ss").parse(newsDate);
    String datePublics = DateFormat("dd/MM/yyyy").format(dateFormat);
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<NewsController>(
          init: newsController,
          builder: (index) {
            return CustomScrollView(
              controller: _scrollController,
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  // bottom: PreferredSize(
                  //   child: AppBar(
                  //     elevation: 0,
                  //     automaticallyImplyLeading: false,
                  //     centerTitle: true,
                  //     backgroundColor: Colors.white,
                  //   ),
                  //   preferredSize: Size.fromHeight(h(75)),
                  // ),
                  floating: false,
                  pinned: false,
                  centerTitle: true,
                  flexibleSpace: Padding(
                    padding: EdgeInsets.only(bottom: h(10)),
                    child: Image.network(
                      newsThumbnail,
                      fit: BoxFit.cover,
                    ),
                  ),
                  snap: false,

                  elevation: 0,
                  expandedHeight: h(230),
                  backgroundColor: Colors.white,
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => Container(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: w(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: w(4),
                                  height: h(40),
                                  color: primaryColor,
                                ),
                                SizedBox(
                                  width: w(5),
                                ),
                                Flexible(
                                    child: Text(
                                  newsTitle,
                                  maxLines: 3,
                                  style: robotoW700(s(18), primaryTextColor),
                                )),
                              ],
                            ),
                            SizedBox(
                              height: h(13),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: w(10)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SwitchGenreTag(title: '${newsGenre.name}'),
                                  Spacer(),
                                  Text(
                                    datePublics,
                                    style: robotoW500(s(13), Colors.grey),
                                  )
                                ],
                              ),
                            ),
                            Center(
                              child: Container(
                                color: Colors.white,
                                child: Html(
                                  onImageTap: (String? url, RenderContext ctx,
                                      attributes, _) {
                                    Get.dialog(
                                      showDialogImage(url!),
                                    );
                                  },
                                  onLinkTap: (String? url, RenderContext ctx,
                                      attributes, _) async {
                                    await canLaunch('${url}')
                                        ? await launch('${url}')
                                        : throw 'Could not launch $url';
                                  },
                                  data: """ ${newsContent} """,
                                ),
                              ),
                            ),
                            Divider(),
                            Text(
                              LocaleKeys.tinlienquan.tr,
                              style: robotoW600(s(20), primaryTextColor),
                            ),
                            SizedBox(
                              height: h(10),
                            ),
                          ],
                        ),
                      ),
                    ),
                    childCount: 1,
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    int nextIndex = currentIndex + 1 + index;
                    return GestureDetector(
                      onTap: () {
                        Get.offAndToNamed(Routes.NEWS_DETAIL, arguments: [
                          newsController.selectCategory[nextIndex].id,
                          newsController.selectCategory[nextIndex].title,
                          newsController.selectCategory[nextIndex].content,
                          newsController.selectCategory[nextIndex].views,
                          newsController.selectCategory[nextIndex].description,
                          newsController.selectCategory[nextIndex].thumbnail,
                          newsController.selectCategory[nextIndex].genre,
                          newsController.selectCategory[nextIndex].publishedAt,
                          nextIndex,
                        ]);
                      },
                      child: Container(
                          height: h(100),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: w(10), vertical: h(5)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(r(6)),
                                    child: Image.network(
                                        '${newsController.selectCategory[nextIndex].thumbnail}')),
                                SizedBox(
                                  width: w(8),
                                ),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        newsController
                                            .selectCategory[nextIndex].title,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: robotoW600(
                                          s(14),
                                          primaryTextColor,
                                        ),
                                      ),
                                      Spacer(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SwitchGenreTag(
                                              title: '${newsGenre.name}'),
                                          Text(
                                            '${newsController.selectCategory[nextIndex].views} Views',
                                            style:
                                                robotoW500(s(12), Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )),
                    );
                  }, childCount: 7),
                ),
              ],
            );
          }),
    );
  }

  Stack showDialogImage(String url) {
    return Stack(
                                      children: [
                                        Positioned.fill(
                                          child:
                                          PhotoView(
                                            tightMode: true,
                                            enableRotation: true,
                                            controller: _photoViewController,
                                            scaleStateController:
                                                PhotoViewScaleStateController(),
                                            filterQuality: FilterQuality.high,
                                            imageProvider:
                                                NetworkImage('${url}'),
                                            customSize:
                                                Size.fromWidth(w(400)),
                                            backgroundDecoration:
                                                BoxDecoration(
                                              color: Color(0x00ffffff),
                                            ),
                                          ),
                                        ),
                                        Card(
                                          color: Colors.transparent,
                                          elevation: 0,
                                          shape: StadiumBorder(
                                            side: BorderSide(
                                              color: Colors.white,
                                              width: w(3),
                                            ),
                                          ),
                                          child: IconButton(
                                            onPressed: () {
                                              Get.back();
                                            },
                                            icon: Icon(
                                              Icons.close,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
  }
}
