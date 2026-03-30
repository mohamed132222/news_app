import 'package:flutter/material.dart';
import 'package:news_app/models/news_response.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news_app/utils/app_color.dart';

import '../../../utils/app_text.dart';
import '../../../widget/main_loading_widget.dart';

class NewsItem extends StatelessWidget {
  News news;

  NewsItem({required this.news});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.white, width: 2),
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
          Text(news.title ?? "", style: AppText.bold16white700),
          Row(
            children: [
              Expanded(
                child: Text(news.author ?? "", style: AppText.medium12grey500),
              ),

              Text(news.publishedAt ?? "", style: AppText.medium12grey500),
            ],
          ),
        ],
      ),
    );
  }
}
