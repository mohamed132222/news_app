import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/di/di.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../core/utils/app_text.dart';
import '../../../../../../../../core/widget/main_error_widget.dart';
import '../../../../../../../../core/widget/main_loading_widget.dart';
import '../../../source/data/model/source_response.dart';

import '../view_model/news_state.dart';
import '../view_model/news_view_model.dart';
import 'news_item.dart';

class NewsWidget extends StatefulWidget {
  Source source;

  NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsViewModel, NewsState>(
      bloc: NewsViewModel(newsRepository: newsRepositoryInject())
        ..getNews(widget.source.id ?? ""),
      builder: (context, state) {
        if (state is NewsLoadingState) {
          return MainLoadingWidget();
        } else if (state is NewsErrorState) {
          return MainErrorWidget(
            errorMessage: state.errorMessage ?? "",
            onPressed: () =>
                NewsViewModel(newsRepository: newsRepositoryInject())
                  ..getNews(widget.source.id ?? ""),
          );
        } else if (state is NewsEmptyState) {
          return Center(
            child: Text(
              "The News List Is Empty",
              style: AppText.medium24white500,
            ),
          );
        } else if (state is NewsSuccessState) {
          return ListView.builder(
            itemCount: state.newsList!.length,
            itemBuilder: (context, index) =>
                NewsItem(news: state.newsList![index]),
          );
        }
        return Container();
      },
    );
  }
}

//   FutureBuilder(
//   future: DioManager.getNews(widget.source.id ?? ""),
//   builder: (context, snapshot) {
//     if (snapshot.connectionState == ConnectionState.waiting) {
//       return MainLoadingWidget();
//     } else if (snapshot.hasError) {
//       return MainErrorWidget(
//         errorMessage: "something went wrong",
//         onPressed: () {
//           DioManager.getNews(widget.source.id ?? "");
//           setState(() {});
//         },
//       );
//     } else if (snapshot.data?.status != "ok") {
//       return MainErrorWidget(
//         errorMessage: snapshot.data!.message!,
//         onPressed: () {
//           DioManager.getNews(widget.source.id ?? "");
//           setState(() {});
//         },
//       );
//     }
//     var newsList = snapshot.data?.articles ?? [];
//     if (newsList.isEmpty) {
//       return Center(
//         child: Text(
//           "The News List Is Empty",
//           style: AppText.medium24white500,
//         ),
//       );
//     } else {
//       return ListView.builder(
//         itemBuilder: (context, index) => NewsItem(news: newsList[index]),
//         itemCount: newsList.length,
//       );
//     }
//   },
// );

// ChangeNotifierProvider(
//       key: ValueKey(widget.source.id),
//       create: (context) => NewsViewModel()..getNews(widget.source.id ?? ""),
//       builder: (context, child) => Consumer<NewsViewModel>(
//         builder: (context, value, child) {
//           if (value.errorMessage != null) {
//             return MainErrorWidget(
//               errorMessage: value.errorMessage!,
//               onPressed: () => value.getNews(widget.source.id ?? ""),
//             );
//           } else if (value.newsList == null) {
//             return MainLoadingWidget();
//           } else if (value.newsList!.isEmpty) {
//             return Center(
//               child: Text(
//                 "The News List Is Empty",
//                 style: AppText.medium24white500,
//               ),
//             );
//           } else {
//             return ListView.builder(
//               itemCount: value.newsList!.length,
//               itemBuilder: (context, index) =>
//                   NewsItem(news: value.newsList![index]),
//             );
//           }
//         },
//       ),
//     );
