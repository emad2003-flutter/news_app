import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constants.dart';
import 'package:news_app/api/end_points.dart';
import 'package:news_app/models/news_response.dart';
import 'package:news_app/models/source_response.dart';

class ApiManager {
  // Get Sources
  static Future<SourceResponse> getSources() async {
    try {
      Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.sourcesApi, {
        "apiKey": ApiConstants.apiKey,
      });
      var response = await http.get(url);
      return SourceResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      rethrow;
    }
  }

  // Get News by Source ID
  static Future<NewsResponse> getNewsBySourceId(String sourceId) async {
    try {
      Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.newsApi, {
        "apiKey": ApiConstants.apiKey,
        "sources": sourceId,
        // "sources": sourceId,
      });
      var response = await http.get(url);
      return NewsResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      rethrow;
    }
  }
}
