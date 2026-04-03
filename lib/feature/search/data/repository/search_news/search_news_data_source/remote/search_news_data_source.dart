import 'package:news_app/feature/home/category_details/presentation/view/news/data/model/news_response.dart';

abstract class SearchNewsDataSource {
  Future<NewsResponse> getNewsWithSearch(
    String query, {
    page = "1",
    pageSize = "10",
  });
}
