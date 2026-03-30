import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/home/category/source/source_widget.dart';
import 'package:news_app/models/category.dart';
import 'package:news_app/widget/main_error_widget.dart';
import '../../widget/main_loading_widget.dart';

class CategoryDetailsScreen extends StatefulWidget {
  static const String routeName = "/category_details_screen";
  Category category;

  CategoryDetailsScreen({required this.category});

  @override
  State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(widget.category.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MainLoadingWidget();
        } else if (snapshot.hasError) {
          return MainErrorWidget(
            errorMessage: "there is something went wrong",
            onPressed: () {
              ApiManager.getSources(widget.category.id);
              setState(() {});
            },
          );
        } else if (snapshot.data?.status != "ok") {
          return MainErrorWidget(
            errorMessage: snapshot.data!.message!,
            onPressed: () {
              ApiManager.getSources(widget.category.id);
              setState(() {});
            },
          );
        }
        var sourceList = snapshot.data?.sources ?? [];
        return SourceWidget(sourcesList: sourceList);
      },
    );
  }
}
