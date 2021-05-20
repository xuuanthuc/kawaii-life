import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:wibu_life/modules/common/widgets/nav_bar.dart';
import 'package:wibu_life/modules/home_news/controllers/news_controller.dart';
import 'package:wibu_life/modules/home_news/views/widgets/category_news.dart';
import 'package:wibu_life/themes/app_colors.dart';
import 'package:wibu_life/utils/common/screen_util.dart';
import 'package:wibu_life/utils/constants/locale_key.dart';

import 'widgets/anime_news_widget.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class HomeNews extends StatelessWidget {
  NewsController newsController = Get.find();
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Container(
        color: Colors.white,
        child: CustomScrollView(
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
              title: Padding(
                padding:  EdgeInsets.only(bottom: h(10)),
                child: Text(
                  'Kawaii News',
                  style: TextStyle(color: primaryColor),
                ),
              ),
              snap: true,
              elevation: 0,
              expandedHeight: h(110),
              backgroundColor: Colors.white,
            ),
            CategoriesNews(),
            AnimeListWidget()
          ],
        ),
      ),
      onWillPop: () async {
        if(_scrollController.position.atEdge){
          return true;
        } else {
          _scrollController.animateTo(_scrollController.position.minScrollExtent, duration: Duration(seconds: 2), curve: Curves.fastOutSlowIn);
          return false;
        }
      },
    );
  }


}
