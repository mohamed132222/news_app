import 'package:news_app/feature/home/category_details/presentation/view/news/data/model/news_response.dart';
import 'package:news_app/feature/search/data/repository/search_news/search_news_data_source/remote/search_news_data_source.dart';

import '../search_news_repository.dart';

class SearchNewsRepositoryImpl implements SearchNewsRepository {
  SearchNewsDataSource searchNewsDataSource;

  SearchNewsRepositoryImpl({required this.searchNewsDataSource});

  @override
  Future<NewsResponse> getNewsWithSearch(
    String query, {
    page = "1",
    pageSize = "10",
  }) {
    return searchNewsDataSource.getNewsWithSearch(
      query,
      page: page,
      pageSize: pageSize,
    );
  }
}
