import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/feature/search/presentation/view/search_result_body.dart';
import 'package:provider/provider.dart';

import '../../../../core/api/dio/dio_manager.dart';
import '../../../../core/di/di.dart';
import '../../../../core/provider/settings/settings_provider.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_text.dart';
import '../../../../core/widget/main_error_widget.dart';
import '../../../../core/widget/main_loading_widget.dart';
import '../../../home/category_details/presentation/view/news/presentation/view/news_item.dart';
import '../view_model/search_state.dart';
import '../view_model/search_view_model.dart';

class ShowSearchDelegateScreen extends SearchDelegate {
  late var provider;
  @override
  ThemeData appBarTheme(BuildContext context) {
    provider = Provider.of<SettingsProvider>(context);
    final ThemeData theme = Theme.of(context);

    return theme.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16),
          side: BorderSide(
            width: 2,
            color: provider.isDark() ? AppColor.white : AppColor.black,
          ),
        ),
        iconTheme: IconThemeData(
          color: provider.isDark() ? AppColor.white : AppColor.black,
        ),
        titleTextStyle: theme.textTheme.titleLarge?.copyWith(
          color: provider.isDark() ? AppColor.white : AppColor.black,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(color: AppColor.grey),
        border: InputBorder.none,
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
        icon: Icon(
          Icons.clear,
          color: provider.isDark() ? AppColor.white : AppColor.black,
          size: 25,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      onPressed: () => close(context, null),
      icon: Icon(
        Icons.arrow_back,
        color: provider.isDark() ? AppColor.white : AppColor.black,
        size: 25,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return BlocProvider(
      key: ValueKey(query),
      create: (_) =>
          SearchViewModel(searchNewsRepository: searchNewsRepositoryInject())
            ..getNewsWithSearch(query),
      child: SearchResultBody(query: query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Center(
        child: Text(
          "Search for news...",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      );
    }
    return buildResults(context);
  }
}

// FutureBuilder(
//       future: DioManager.getNewsBySearch(query),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return MainLoadingWidget();
//         } else if (snapshot.hasError) {
//           return MainErrorWidget(
//             errorMessage: "there is something went wrong",
//             onPressed: () => showResults(context),
//           );
//         } else if (snapshot.hasData) {
//           var newsList = snapshot.data!.articles;
//           if (newsList == null || newsList.isEmpty) {
//             return Center(
//               child: Text(
//                 "there is no news to show",
//                 style: AppText.medium24white500,
//               ),
//             );
//           } else {
//             return ListView.builder(
//               itemBuilder: (context, index) => NewsItem(news: newsList[index]),
//               itemCount: newsList.length,
//             );
//           }
//         } else {
//           return Container(
//             child: Text(
//               "starting to fetch data",
//               style: AppText.medium24white500,
//             ),
//           );
//         }
//       },
//     );
