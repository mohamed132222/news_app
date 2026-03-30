import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constant.dart';
import 'package:news_app/api/endpoints.dart';
import 'package:news_app/models/news_response.dart';
import 'package:news_app/models/source_response.dart';

class ApiManager {
  /*
https://newsapi.org/v2/top-headlines/sources?apiKey=fd303e72a8ac4f28baf9509e65fd21c8
*/
  static Future<SourceResponse> getSources(String categoryid) async {
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
  static Future<NewsResponse> getNews(String sourceId) async {
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
}
