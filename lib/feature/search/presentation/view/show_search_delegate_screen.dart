import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/api/dio/dio_manager.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_text.dart';
import '../../../../core/widget/main_error_widget.dart';
import '../../../../core/widget/main_loading_widget.dart';
import '../../../home/category_details/presentation/view/news/presentation/view/news_item.dart';
import '../view_model/search_state.dart';
import '../view_model/search_view_model.dart';

class ShowSearchDelegateScreen extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return theme.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16),
          side: BorderSide(width: 2, color: AppColor.white),
        ),
        iconTheme: IconThemeData(color: AppColor.white),
        titleTextStyle: theme.textTheme.titleLarge?.copyWith(
          color: AppColor.white,
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
        icon: Icon(Icons.clear, color: AppColor.white, size: 25),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      onPressed: () => close(context, null),
      icon: Icon(Icons.arrow_back, color: AppColor.white, size: 25),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return BlocBuilder<SearchViewModel, SearchState>(
      bloc: SearchViewModel()..getNewsWithSearch(query),
      builder: (context, state) {
        if (state is SearchLoadingState) {
          return MainLoadingWidget();
        } else if (state is SearchErrorState) {
          return MainErrorWidget(
            errorMessage: state.errorMessage!,
            onPressed: () => DioManager.getNewsBySearch(query),
          );
        } else if (state is SearchSuccessState) {
          return ListView.builder(
            itemBuilder: (context, index) =>
                NewsItem(news: state.newsList![index]),
            itemCount: state.newsList!.length,
          );
        }
        return Container();
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Center(
        child: Text("Search for news...", style: AppText.medium24white500),
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
