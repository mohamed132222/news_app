import 'package:dio/dio.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../feature/home/category_details/presentation/view/news/data/model/news_response.dart';
import '../../../feature/home/category_details/presentation/view/source/data/model/source_response.dart';
import '../../constant/api_constant.dart';
import '../../constant/endpoints.dart';
import 'dio_interceptor.dart';

class DioManager {
  static final Dio dio =
      Dio(
          BaseOptions(
            baseUrl: ApiConstant.baseUrl,
            // headers: {
            //               "X-Api-Key":ApiConstant.apiKey
            // },
            connectTimeout: Duration(seconds: 5),
            receiveTimeout: Duration(seconds: 5),
          ),
        )
        ..interceptors.add(DioInterceptor())
        ..interceptors.add(
          PrettyDioLogger(
            request: true,
            responseBody: true,
            requestBody: true,
            error: true,
            requestHeader: true,
            responseHeader: true,
          ),
        );

  // ..interceptors.add(
  //   LogInterceptor(
  //     error: true,
  //     requestBody: true,
  //     requestUrl: true,
  //     responseBody: true,
  //     responseUrl: true,
  //     request: true,
  //   ),
  // );
  Future<SourceResponse> getSources(String categoryid) async {
    try {
      var response = await dio.get(
        Endpoints.sourceServices,
        queryParameters: {"category": categoryid},
      );
      var json = response.data;
      return SourceResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  Future<NewsResponse> getNews(String sourceId) async {
    try {
      var response = await dio.get(
        Endpoints.newsServices,
        queryParameters: {"sources": "$sourceId"},
      );
      var json = response.data;
      return NewsResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  Future<NewsResponse> getNewsBySearch(String query) async {
    try {
      var reponse = await dio.get(
        Endpoints.newsServices,
        queryParameters: {"q": query},
      );
      var json = reponse.data;
      return NewsResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}
