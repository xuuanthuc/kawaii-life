import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wibu_life/modules/common/widgets/effect_widget.dart';
import 'package:wibu_life/modules/common/widgets/logo_text.dart';
import 'package:wibu_life/modules/common/widgets/nav_bar.dart';
import 'package:wibu_life/modules/home_news/controllers/news_controller.dart';
import 'package:wibu_life/modules/home_news/views/widgets/category_news.dart';
import 'package:wibu_life/themes/app_colors.dart';
import 'package:wibu_life/themes/app_icon.dart';
import 'package:wibu_life/themes/app_theme.dart';
import 'package:wibu_life/utils/common/screen_util.dart';

import 'widgets/anime_news_widget.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors



class HomeNews extends StatelessWidget {
  NewsController newsController = Get.find();
  final ScrollController _scrollController = ScrollController();

  Future<void> scrollToTop() async {
    await _scrollController.animateTo(
        _scrollController.position.minScrollExtent,
        duration: Duration(seconds: 1),
        curve: Curves.fastOutSlowIn);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: SafeArea(
        child: Container(
          color: Colors.white,
          child: Obx(() => CustomScrollView(
              physics: ScrollPhysics(),
                controller: _scrollController,
                slivers: [
                  SliverAppBar(
                    bottom: PreferredSize(
                      child: AppBar(
                        elevation: 0,
                        backgroundColor: Colors.white,
                        title: NavBarDesign(),
                      ),
                      preferredSize: Size.fromHeight(h(65)),
                    ),
                    floating: true,
                    pinned: true,
                    centerTitle: true,
                    primary: false,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Center(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: h(60)),
                          child: logoText(),
                          // Image.asset(icon.logo, height: 25,fit: BoxFit.cover,),
                        ),
                      ),
                    ),
                    snap: true,
                    elevation: 0,
                    expandedHeight: h(130),
                    backgroundColor: Colors.white,
                  ),
                  CategoriesNews(),
                  newsController.isLoading.value
                      ? EffectAnimationDesign()
                      : animeListWidget()
                ],
              )),
        ),
      ),
      onWillPop: () async {
        if (_scrollController.position.atEdge) {
          if (_scrollController.position.pixels == 0) {
            return true;
          } else {
            scrollToTop();
            return false;
          }
        } else {
           scrollToTop();
          return false;
        }
      },
    );
  }
}
