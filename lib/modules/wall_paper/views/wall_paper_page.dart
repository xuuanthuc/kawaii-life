
import 'package:flutter/material.dart';
import 'package:wibu_life/modules/common/widgets/nav_bar.dart';
import 'package:wibu_life/utils/common/screen_util.dart';
class WallPaperPage extends StatelessWidget {
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
        body: Container(),
      ),
    );
  }
}
