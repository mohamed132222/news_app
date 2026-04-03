import 'package:news_app/feature/home/category_details/presentation/view/news/data/model/news_response.dart';

abstract class NewsRemoteDataSource {
  Future<NewsResponse> getNews(
    String sourceId, {
    String page = "1",
    String pageSize = "10",
  });
}
