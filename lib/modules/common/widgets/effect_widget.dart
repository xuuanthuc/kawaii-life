import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wibu_life/modules/wall_paper/controllers/wall_paper_controller.dart';
import 'package:wibu_life/themes/app_colors.dart';
import 'package:wibu_life/utils/common/screen_util.dart';

final WallPaperController wallPaperController = Get.find();

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
          height: h(210),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: w(10)),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return  Padding(
                  padding: EdgeInsets.symmetric(horizontal: w(6)),
                  child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(r(8)),

                    color: Colors.grey.shade100,
                  ),
                  height: h(210),
                  width: w(110),
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
                );  },
              itemCount: 5,
            ),
          ),
        );
  }
}

class EffectAnimationWallpaperListDesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w(30), vertical: h(15)),
      child: GridView.builder(
        itemBuilder: (BuildContext context, int index) { return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(r(10)),
            color: Colors.grey.shade100,
          ),
          height: h(210),
          width: w(110),
          child: Shimmer(
            period: Duration(milliseconds: 600),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(r(10)),
                color: Colors.grey.shade100,
              ),
            ),
            direction: ShimmerDirection.ltr,
            gradient: shimmerGradient,
          ),
        ); },
        itemCount: 15, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 9 / 16,
        crossAxisCount: wallPaperController.animeSelect.value? 3 : 2,
          mainAxisSpacing: w(12),
          crossAxisSpacing: w(12),

      ),
      ),
    );
  }
}
class EffectAnimationAnimeListDesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w(30), vertical: h(15)),
      child: GridView.builder(
        itemBuilder: (BuildContext context, int index) { return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(r(10)),
            color: Colors.grey.shade100,
          ),
          height: h(210),
          width: w(110),
          child: Shimmer(
            period: Duration(milliseconds: 600),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(r(10)),
                color: Colors.grey.shade100,
              ),
            ),
            direction: ShimmerDirection.ltr,
            gradient: shimmerGradient,
          ),
        ); },
        itemCount: 15, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 9 / 16,
        crossAxisCount: 3,
        mainAxisSpacing: w(12),
        crossAxisSpacing: w(12),

      ),
      ),
    );
  }
}