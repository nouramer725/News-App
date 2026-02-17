import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constants.dart';
import 'package:news_app/api/api_end_points.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/model/news_response.dart';

class ApiManager {
  static Future<NewsModel> getNews(String category) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiEndPoints.sourceApi, {
      'apiKey': ApiConstants.apiKey,
      'category': category,
    });
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewsModel.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  static Future<NewsResponse> getNewsByIdWithPages(
    String sourceId, {
    int page = 1,
    int pageSize = 10,
  }) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiEndPoints.everythingApi, {
      'apiKey': ApiConstants.apiKey,
      'sources': sourceId,
      'page': page.toString(),
      'pageSize': pageSize.toString(),
    });

    var response = await http.get(url);
    var json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }

  static Future<NewsResponse> searchForNews(String query) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiEndPoints.everythingApi, {
      'apiKey': ApiConstants.apiKey,
      'q': query,
    });

    var response = await http.get(url);
    var json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }
}
