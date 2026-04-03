import 'package:flutter/material.dart';
import 'package:news_app/feature/drawer/selected_item.dart';
import 'package:provider/provider.dart';

import '../../core/provider/settings/settings_provider.dart';
import '../../core/utils/app_asset.dart';
import '../../core/utils/app_color.dart';
import 'drawer_divider.dart';
import 'drawer_item.dart';

class DrawerHome extends StatelessWidget {
  VoidCallback OnDrawerClick;

  DrawerHome({required this.OnDrawerClick});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
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
            child: Text(
              "News App",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppColor.black,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              OnDrawerClick();
            },
            child: DrawerItem(title: "Home", image: AppAsset.iconHome),
          ),

          DrawerDivider(),
          DrawerItem(title: "Them", image: AppAsset.iconTheme),
          SelectedItem(
            title: provider.isDark() ? "Dark" : "Light",
            options: ["Dark", "Light"],
            onChanged: (value) {
              if (value == "Dark") {
                provider.changeTheme(ThemeMode.dark);
              } else {
                provider.changeTheme(ThemeMode.light);
              }
              Navigator.pop(context);
            },
          ),
          // DrawerDivider(),
          // DrawerItem(title: "Language", image: AppAsset.iconLanguage),
          // SelectedItem(title: "english", onTap: () {}),
        ],
      ),
    );
  }
}
