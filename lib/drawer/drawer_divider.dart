import 'package:flutter/material.dart';
import 'package:news_app/utils/app_color.dart';

class DrawerDivider extends StatelessWidget {
  const DrawerDivider({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Divider(
      color: AppColor.white,
      thickness: width * .004,
      indent: width * .04,
      endIndent: width * .04,
    );
  }
}
