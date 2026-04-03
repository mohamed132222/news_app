import 'package:news_app/core/api/dio/dio_manager.dart';
import 'package:news_app/core/api/http/api_manager.dart';
import 'package:news_app/feature/home/category_details/data/repository/news/news_data_source/remote/news_remote_data_source.dart';
import 'package:news_app/feature/home/category_details/presentation/view/news/data/model/news_response.dart';

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  DioManager dioManager;

  NewsRemoteDataSourceImpl({required this.dioManager});

  @override
  Future<NewsResponse> getNews(
    String sourceId, {
    String page = "1",
    String pageSize = "10",
  }) async {
    var reponse = await dioManager.getNews(
      sourceId,
      page: page,
      pageSize: pageSize,
    );
    return reponse;
  }
}

class NewsRemoteDataSourceImpl1 implements NewsRemoteDataSource {
  ApiManager apiManager;

  NewsRemoteDataSourceImpl1({required this.apiManager});

  @override
  Future<NewsResponse> getNews(
    String sourceId, {
    String page = "1",
    String pageSize = "10",
  }) async {
    var reponse = await apiManager.getNews(sourceId);
    return reponse;
  }
}
