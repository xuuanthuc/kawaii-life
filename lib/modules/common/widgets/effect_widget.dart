import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wibu_life/themes/app_colors.dart';
import 'package:wibu_life/utils/common/screen_util.dart';
class EffectAnimationDesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: w(15), vertical: h(5)),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(r(8)),
              color: Colors.grey.shade100,
            ),
            height: h(250),
            child: Shimmer(
              period: Duration(milliseconds: 600),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(r(8)),
                  color: Colors.grey.shade100,
                ),
              ),
              direction: ShimmerDirection.ltr,
              gradient: shimmerGradient,
            ),
          ),
        );
      }, childCount: 5),);
  }
}

class EffectAnimationWallpaperDesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
          ),
          height: h(210),
          child: Shimmer(
            period: Duration(milliseconds: 600),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
              ),
            ),
            direction: ShimmerDirection.ltr,
            gradient: shimmerGradient,
          ),
        );
  }
}