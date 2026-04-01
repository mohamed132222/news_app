import 'package:flutter/material.dart';
import 'package:news_app/feature/drawer/selected_item.dart';

import '../../core/utils/app_asset.dart';
import '../../core/utils/app_color.dart';
import '../../core/utils/app_text.dart';
import 'drawer_divider.dart';
import 'drawer_item.dart';

class DrawerHome extends StatelessWidget {
  VoidCallback OnDrawerClick;

  DrawerHome({required this.OnDrawerClick});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      color: AppColor.black,
      child: Column(
        spacing: height * .02,
        children: [
          Container(
            height: height * .2,
            alignment: Alignment.center,
            color: AppColor.white,
            child: Text("News App", style: AppText.bold24black700),
          ),
          InkWell(
            onTap: () {
              OnDrawerClick();
            },
            child: DrawerItem(title: "Home", image: AppAsset.iconHome),
          ),

          DrawerDivider(),
          DrawerItem(title: "Them", image: AppAsset.iconTheme),
          SelectedItem(title: "Dark", onTap: () {}),
          DrawerDivider(),
          DrawerItem(title: "Language", image: AppAsset.iconLanguage),
          SelectedItem(title: "english", onTap: () {}),
        ],
      ),
    );
  }
}
