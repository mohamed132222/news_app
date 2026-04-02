import 'package:news_app/feature/home/category_details/data/repository/news/news_repository/news_repository.dart';
import 'package:news_app/feature/home/category_details/presentation/view/news/data/model/news_response.dart';

import '../../news_data_source/remote/news_remote_data_source.dart';

class NewsRepositoryImpl implements NewsRepository {
  NewsRemoteDataSource newsRemoteDataSource;

  NewsRepositoryImpl({required this.newsRemoteDataSource});

  @override
  Future<NewsResponse> getNews(String sourceId) {
    return newsRemoteDataSource.getNews(sourceId);
  }
}
