import 'package:flutter/material.dart';
import 'package:wibu_life/themes/app_colors.dart';
class NavBarDesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: (){}, icon: Icon(Icons.fiber_new_sharp, color: primaryColor,)),
        IconButton(onPressed: (){}, icon: Icon(Icons.stars, color: primaryColor,)),
        IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border_rounded, color: primaryColor,)),
        IconButton(onPressed: (){}, icon: Icon(Icons.account_circle_sharp, color: primaryColor,)),
      ],
    );
  }
}
