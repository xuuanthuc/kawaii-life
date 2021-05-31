import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:wibu_life/modules/common/widgets/nav_bar.dart';
import 'package:wibu_life/modules/wall_paper/controllers/wall_paper_controller.dart';
import 'package:wibu_life/utils/common/screen_util.dart';
class WallPaperPage extends StatelessWidget {
  final WallPaperController wallPaperController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            child: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              title: NavBarDesign(),
            ),
            preferredSize: Size.fromHeight(h(85)),
          ),
        body: Container(
          child: Obx(() => ListView.builder(itemBuilder: (_, index){
            return ListTile(
              title: Image.network(wallPaperController.wallpaperAnime[index].thumbUrl),
            );
          } , itemCount: wallPaperController.wallpaperAnime.length,)),
        ),
      ),
    );
  }
}
