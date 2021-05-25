import 'package:flutter/material.dart';
import 'package:wibu_life/themes/app_colors.dart';
import 'package:wibu_life/themes/app_theme.dart';
import 'package:wibu_life/utils/common/screen_util.dart';
Widget SwitchGenreTag({required String title}) {
  switch (title) {
    case 'Tin tức anime':
      {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(r(4)),
              color: Colors.orange),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              title,
              style: robotoW600(s(10), Colors.white),
            ),
          ),
        );
      }
    case 'Tin tức manga':
      {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(r(4)),
              color: Colors.redAccent),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              title,
              style: robotoW600(s(10), Colors.white),
            ),
          ),
        );
      }
    case 'Cosplay':
      {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(r(4)),
              color: Colors.purple),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              title,
              style: robotoW600(s(10), Colors.white),
            ),
          ),
        );
      }
    case 'Đề cử anime':
      {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(r(4)),
              color: Colors.green),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              title,
              style: robotoW600(s(10), Colors.white),
            ),
          ),
        );
      }
    case 'Nhân vật':
      {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(r(4)),
              color: Colors.pinkAccent),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              title,
              style: robotoW600(s(10), Colors.white),
            ),
          ),
        );
      }
    default:
      {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(r(4)),
              color: Colors.amberAccent),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              title,
              style: robotoW600(s(10), Colors.black),
            ),
          ),
        );
      }
  }
}
