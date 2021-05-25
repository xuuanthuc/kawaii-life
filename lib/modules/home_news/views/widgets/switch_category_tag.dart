import 'package:flutter/material.dart';
import 'package:wibu_life/themes/app_colors.dart';
import 'package:wibu_life/themes/app_theme.dart';
import 'package:wibu_life/utils/common/screen_util.dart';
Widget SwitchCagetoryTag({required String title}) {
  switch (title) {
    case 'Tin tức anime':
      {
        return Text(title,
          style: robotoW500(s(11), Colors.orange),);
      }
    case 'Tin tức manga':
      {
        return Text(title,
          style: robotoW500(s(11), Colors.redAccent),);
      }
    case 'Cosplay':
      {
        return Text(title,
          style: robotoW500(s(11), Colors.purple),);
      }
    case 'Đề cử anime':
      {
        return Text(title,
          style: robotoW500(s(11), Colors.green),);
      }
    case 'Nhân vật':
      {
        return Text(title,
          style: robotoW500(s(11), Colors.pinkAccent),);
      }
    default:
      {
        return Text(title,
          style: robotoW500(s(11), primaryColor),);
      }
  }
}
