import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../feature/home/category_details/presentation/view/news/data/model/news_response.dart';
import '../../../feature/home/category_details/presentation/view/source/data/model/source_response.dart';
import '../../constant/api_constant.dart';
import '../../constant/endpoints.dart';

class ApiManager {
  /*
https://newsapi.org/v2/top-headlines/sources?apiKey=fd303e72a8ac4f28baf9509e65fd21c8
*/
  Future<SourceResponse> getSources(String categoryid) async {
    Uri url = Uri.https(ApiConstant.baseUrl, Endpoints.sourceServices, {
      "apiKey": ApiConstant.apiKey,
      "category": categoryid,
    });
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return SourceResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  /*
https://newsapi.org/v2/everything?q=bitcoin&apiKey=fd303e72a8ac4f28baf9509e65fd21c8
  */
  Future<NewsResponse> getNews(String sourceId) async {
    Uri url = Uri.https(ApiConstant.baseUrl, Endpoints.newsServices, {
      "apiKey": ApiConstant.apiKey,
      "sources": sourceId,
    });
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  Future<NewsResponse> getNewsWithSearch(String query) async {
    Uri url = Uri.https(ApiConstant.baseUrl, Endpoints.newsServices, {
      "apiKey": ApiConstant.apiKey,

      "q": query,
    });
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}
