import 'dart:convert';

import 'package:http/http.dart' as http;

import 'api_config.dart';

class ApiServices {
  ApiServices._();

  static final ApiServices _instance = ApiServices._();

  factory ApiServices() => _instance;

  Future<dynamic> get(String endpoint, {Map<String, dynamic>? params}) async {
    var url = Uri.http(ApiConfig.baseUrl, "v2/$endpoint", {
      "apiKey": ApiConfig.apiKey,
      ...?params,
    });

    try {
      final http.Response response = await http.get(url);
      return jsonDecode(response.body) as Map<String, dynamic>;
    } catch (e) {
      throw Exception("failed to load data");
    }
  }
}
