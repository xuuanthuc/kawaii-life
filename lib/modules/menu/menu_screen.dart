

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wibu_life/modules/common/widgets/nav_bar.dart';
import 'package:wibu_life/modules/home_news/controllers/news_controller.dart';
import 'package:wibu_life/modules/wall_paper/controllers/wall_paper_controller.dart';

class MenuScreen extends StatelessWidget {
  final WallPaperController wallPaperController = Get.find();
  final NewsController newsController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
