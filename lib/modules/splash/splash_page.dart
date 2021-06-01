import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wibu_life/modules/common/widgets/logo_text.dart';
import 'package:wibu_life/utils/common/screen_util.dart';
import 'package:wibu_life/utils/constants/locale_key.dart';

import '../../app_papes.dart';

class SplashPage extends StatefulWidget {
  // final NewsController newsController = Get.put(NewsController();
  // SplashPage() {
  //   fetchSomething();
  // }

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future<void> fetchSomething() async {
    //TODO Call API from server and do sth
    await Future.delayed(const Duration(milliseconds: 500));
    Get.offAllNamed(Routes.HOME);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: logoText(),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchSomething();
  }
}
