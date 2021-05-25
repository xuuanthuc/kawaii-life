import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wibu_life/utils/constants/locale_key.dart';

import '../../app_papes.dart';

class SplashPage extends StatelessWidget {
  SplashPage() {
    fetchSomething();
  }

  void fetchSomething() async {
    //TODO Call API from server and do sth
    await new Future.delayed(const Duration(seconds: 2));
    Get.offAllNamed(Routes.HOME);
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(LocaleKeys.hello.tr));
  }
}
