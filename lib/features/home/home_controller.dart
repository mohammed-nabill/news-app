import 'package:flutter/material.dart';

import '../../core/data_source/remote_data/api_config.dart';
import '../../core/data_source/remote_data/api_services.dart';
import 'models/news_article_model.dart';

class HomeController with ChangeNotifier {
  List<NewsArticleModel> newsTopHeadlineList = [];
  List<NewsArticleModel> newsEverythingList = [];
  final ApiServices apiServices = ApiServices();
  bool topHeadlineLoading = true;
  bool everythingLoading = true;
  String? errorMessage;

  init() {
    _getTopHeadline();
    _getEverything();
  }

  Future<void> _getTopHeadline() async {
    try {
      Map<String, dynamic> result = await apiServices.get(
        ApiConfig.topHeadlines,
        params: {"country": "us"},
      );

      newsTopHeadlineList = (result["articles"] as List)
          .map((e) => NewsArticleModel.fromMap(e))
          .toList();

      topHeadlineLoading = false;
      errorMessage = null;
    } catch (e) {
      topHeadlineLoading = false;
      errorMessage = e.toString();
    }
    notifyListeners();
  }

  Future<void> _getEverything() async {
    try {
      Map<String, dynamic> result = await apiServices.get(
        ApiConfig.everything,
        params: {"q": "news"},
      );

      newsEverythingList = (result["articles"] as List)
          .map((e) => NewsArticleModel.fromMap(e))
          .toList();
      everythingLoading = false;
      errorMessage = null;
    } catch (e) {
      everythingLoading = false;
      errorMessage = e.toString();
    }
  }
}
