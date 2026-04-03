import 'package:dio/dio.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../feature/home/category_details/presentation/view/news/data/model/news_response.dart';
import '../../../feature/home/category_details/presentation/view/source/data/model/source_response.dart';
import '../../constant/api_constant.dart';
import '../../constant/endpoints.dart';
import 'dio_interceptor.dart';

class DioManager {
  DioManager._();

  //todo=> singleton
  static DioManager? instance;

  static DioManager getInstance() {
    instance ??= DioManager._();
    return instance!;
  }

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

  Future<NewsResponse> getNews(
    String sourceId, {
    String page = "1",
    String pageSize = "10",
  }) async {
    try {
      var response = await dio.get(
        Endpoints.newsServices,
        queryParameters: {
          "sources": sourceId,
          "page": page,
          "pageSize": pageSize,
        },
      );

      return NewsResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<NewsResponse> getNewsBySearch(
    String query, {
    String page = "1",
    String pageSize = "10",
  }) async {
    try {
      var response = await dio.get(
        Endpoints.newsServices,
        queryParameters: {"q": query, "page": page, "pageSize": pageSize},
      );

      return NewsResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
