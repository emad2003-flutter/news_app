import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constants.dart';
import 'package:news_app/api/end_points.dart';
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
}
