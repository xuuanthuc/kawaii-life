import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wibu_life/modules/common/widgets/nav_bar.dart';
import 'package:wibu_life/modules/home_news/controllers/news_controller.dart';
import 'package:wibu_life/themes/app_colors.dart';
import 'package:wibu_life/utils/common/screen_util.dart';

import 'widgets/anime_news_widget.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class HomeNews extends StatelessWidget {
  NewsController newsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CustomScrollView(
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
            title: Text(
              'Kawaii News',
              style: TextStyle(color: primaryColor),
            ),
            snap: true,
            elevation: 0,
            expandedHeight: h(110),
            backgroundColor: Colors.white,
          ),
          SliverList(delegate: SliverChildBuilderDelegate(
              (context, index){
                return Container(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        child: Card(
                          child: Text('hellofadsfdsafdsafsda'),
                        ),
                      ),
                      Container(
                        child: Card(child: Text('Hellofdasfadsfasdfs')),
                      ),
                      Container(
                        child: Card(child: Text('Helladfsdafsdao')),
                      ),
                      Container(
                        child: Card(child: Text('Helladfsdafsdao')),
                      ),
                    ],
                  ),
                );
              },
            childCount: 1
          ),),
          AnimeListWidget()
        ],
      ),
    );
  }
}
