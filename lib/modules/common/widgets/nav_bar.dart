import 'package:flutter/material.dart';
import 'package:wibu_life/themes/app_colors.dart';
class NavBarDesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: (){}, icon: Icon(Icons.menu, color: primaryColor,)),
        IconButton(onPressed: (){}, icon: Icon(Icons.menu, color: primaryColor,)),
        IconButton(onPressed: (){}, icon: Icon(Icons.menu, color: primaryColor,)),
        IconButton(onPressed: (){}, icon: Icon(Icons.menu, color: primaryColor,)),
      ],
    );
  }
}
