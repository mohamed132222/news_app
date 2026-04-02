import 'package:news_app/core/api/dio/dio_manager.dart';
import 'package:news_app/core/api/http/api_manager.dart';
import 'package:news_app/feature/home/category_details/presentation/view/news/data/model/news_response.dart';
import 'package:news_app/feature/search/data/repository/search_news/search_news_data_source/remote/search_news_data_source.dart';

class SearchNewsDataSourceImpl implements SearchNewsDataSource {
  DioManager dioManager;

  SearchNewsDataSourceImpl({required this.dioManager});

  @override
  Future<NewsResponse> getNewsWithSearch(String query) async {
    var response = await dioManager.getNewsBySearch(query);
    return response;
  }
}

class SearchNewsDataSourceImpl1 implements SearchNewsDataSource {
  ApiManager apiManager;

  SearchNewsDataSourceImpl1({required this.apiManager});

  @override
  Future<NewsResponse> getNewsWithSearch(String query) async {
    var response = await apiManager.getNewsWithSearch(query);
    return response;
  }
}
