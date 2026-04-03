import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_color.dart';

import '../../core/utils/app_text.dart';

class DrawerItem extends StatelessWidget {
  String title;
  String image;

  DrawerItem({required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        spacing: width * .03,
        children: [
          Image.asset(image, width: width * .06),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: AppColor.white,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
