import 'package:flutter/material.dart';

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
          Image.asset(image, width: width * .05),
          Text(title, style: AppText.bold20white700),
        ],
      ),
    );
  }
}
