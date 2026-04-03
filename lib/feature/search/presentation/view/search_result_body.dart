import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/utils/app_color.dart';
import 'package:provider/provider.dart';

import '../../../../core/provider/settings/settings_provider.dart';
import '../../../../core/widget/main_error_widget.dart';
import '../../../../core/widget/main_loading_widget.dart';
import '../../../home/category_details/presentation/view/news/presentation/view/news_item.dart';
import '../view_model/search_state.dart';
import '../view_model/search_view_model.dart';

class SearchResultBody extends StatefulWidget {
  final String query;

  const SearchResultBody({required this.query});

  @override
  State<SearchResultBody> createState() => _SearchResultBodyState();
}

class _SearchResultBodyState extends State<SearchResultBody> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      if (_controller.position.pixels >=
          _controller.position.maxScrollExtent - 200) {
        context.read<SearchViewModel>().loadMore(widget.query);
      }
    });
  }

  @override
  void didUpdateWidget(covariant SearchResultBody oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.query != widget.query) {
      context.read<SearchViewModel>().reset(widget.query);
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

    return BlocBuilder<SearchViewModel, SearchState>(
      builder: (context, state) {
        if (state.isLoading && state.newsList.isEmpty) {
          return MainLoadingWidget();
        }

        if (state.errorMessage != null && state.newsList.isEmpty) {
          return MainErrorWidget(
            errorMessage: state.errorMessage!,
            onPressed: () {
              context.read<SearchViewModel>().getNewsWithSearch(widget.query);
            },
          );
        }

        if (state.newsList.isEmpty) {
          return Center(
            child: Text(
              "No results found",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          );
        }

        return ListView.builder(
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
                    color: provider.isDark() ? AppColor.white : AppColor.black,
                  ),
                ),
              );
            }

            if (!state.hasMore) {
              return Padding(
                padding: EdgeInsets.all(16),
                child: Center(
                  child: Text(
                    "No more results",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              );
            }

            return SizedBox();
          },
        );
      },
    );
  }
}
