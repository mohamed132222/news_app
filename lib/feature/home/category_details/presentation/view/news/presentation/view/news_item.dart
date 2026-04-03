import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news_app/core/utils/app_color.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../core/provider/settings/settings_provider.dart';
import '../../../../../../../../core/widget/main_loading_widget.dart';
import '../../data/model/news_response.dart';
import 'news_bottom_sheet.dart';

class NewsItem extends StatelessWidget {
  News news;

  NewsItem({required this.news});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        bottomSheet(context);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: provider.isDark() ? AppColor.white : AppColor.black,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        margin: EdgeInsets.symmetric(
          horizontal: width * .02,
          vertical: height * .01,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: width * .02,
          vertical: height * .02,
        ),
        child: Column(
          spacing: 8,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(8),
              child: CachedNetworkImage(
                imageUrl: news.urlToImage ?? "",
                placeholder: (context, url) => MainLoadingWidget(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Text(
              news.title ?? "",
              style: provider.isDark()
                  ? TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColor.white,
                    )
                  : TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColor.black,
                    ),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "By:${news.author ?? ""}",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColor.grey,
                    ),
                  ),
                ),

                Text(
                  news.publishedAt ?? "",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColor.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void bottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,

      context: context,
      builder: (context) => NewsBottomSheet(news: news),
    );
  }
}
