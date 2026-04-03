import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../core/provider/settings/settings_provider.dart';
import '../../../../../../../../core/utils/app_color.dart';
import '../../../../../../../../core/utils/app_text.dart';
import '../../../../../../../../core/widget/main_error_widget.dart';
import '../../../../../../../../core/widget/main_loading_widget.dart';
import '../../../source/data/model/source_response.dart';
import '../view_model/news_state.dart';
import '../view_model/news_view_model.dart';
import 'news_item.dart';

class NewsViewBody extends StatefulWidget {
  final Source source;

  const NewsViewBody({required this.source});

  @override
  State<NewsViewBody> createState() => _NewsViewBodyState();
}

class _NewsViewBodyState extends State<NewsViewBody> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      if (_controller.position.pixels >=
          _controller.position.maxScrollExtent - 200) {
        context.read<NewsViewModel>().loadMore(widget.source.id ?? "");
      }
    });
  }

  @override
  void didUpdateWidget(covariant NewsViewBody oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.source.id != widget.source.id) {
      context.read<NewsViewModel>().reset(widget.source.id ?? "");
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);

    return BlocBuilder<NewsViewModel, NewsState>(
      builder: (context, state) {
        if (state.isLoading && state.newsList.isEmpty) {
          return MainLoadingWidget();
        }

        if (state.errorMessage != null && state.newsList.isEmpty) {
          return MainErrorWidget(
            errorMessage: state.errorMessage!,
            onPressed: () {
              context.read<NewsViewModel>().getNews(widget.source.id ?? "");
            },
          );
        }

        if (state.newsList.isEmpty) {
          return Center(
            child: Text(
              "The News List Is Empty",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            context.read<NewsViewModel>().reset(widget.source.id ?? "");
          },
          child: ListView.builder(
            controller: _controller,
            itemCount: state.newsList.length + 1,
            itemBuilder: (context, index) {
              if (index < state.newsList.length) {
                return NewsItem(news: state.newsList[index]);
              }

              if (state.isLoadingMore) {
                return Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: provider.isDark()
                          ? AppColor.white
                          : AppColor.black,
                    ),
                  ),
                );
              }

              if (!state.hasMore) {
                return Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(
                    child: Text(
                      "No more news",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                );
              }

              return SizedBox();
            },
          ),
        );
      },
    );
  }
}
