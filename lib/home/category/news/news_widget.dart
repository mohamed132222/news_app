import 'package:flutter/material.dart';
import 'package:news_app/home/category/news/news_item.dart';
import 'package:news_app/widget/main_loading_widget.dart';

import '../../../api/api_manager.dart';
import '../../../models/source_response.dart';
import '../../../widget/main_error_widget.dart';

class NewsWidget extends StatefulWidget {
  Source source;

  NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getNews(widget.source.id ?? ""),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MainLoadingWidget();
        } else if (snapshot.hasError) {
          return MainErrorWidget(
            errorMessage: "something went wrong",
            onPressed: () {
              ApiManager.getNews(widget.source.id ?? "");
              setState(() {});
            },
          );
        } else if (snapshot.data?.status != "ok") {
          return MainErrorWidget(
            errorMessage: snapshot.data!.message!,
            onPressed: () {
              ApiManager.getNews(widget.source.id ?? "");
              setState(() {});
            },
          );
        }
        var newsList = snapshot.data?.articles ?? [];
        return ListView.builder(
          itemBuilder: (context, index) => NewsItem(news: newsList[index]),
          itemCount: newsList.length,
        );
      },
    );
  }
}
