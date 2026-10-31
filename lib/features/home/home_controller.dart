import 'package:flutter/material.dart';
import 'package:news_app/features/home/repos/news_repository.dart';

import '../../core/enums/request_status_enum.dart';
import 'models/news_article_model.dart';

class HomeController with ChangeNotifier {
  List<NewsArticleModel> newsTopHeadlineList = [];
  List<NewsArticleModel> newsEverythingList = [];
  String? errorMessage;
  RequestStatusEnum everythingStatus = RequestStatusEnum.loading;
  RequestStatusEnum topHeadlineStatus = RequestStatusEnum.loading;
  String? selectedCategory;
  NewsRepository newsRepository = NewsRepository();

  init() {
    _getTopHeadline();
    _getEverything();
  }

  Future<void> _getTopHeadline({String? category = "general"}) async {
    try {
      topHeadlineStatus = RequestStatusEnum.loading;
      newsTopHeadlineList = await newsRepository.getTopHeadline(
        category: category,
      );
      topHeadlineStatus = RequestStatusEnum.loaded;
      errorMessage = null;
    } catch (e) {
      topHeadlineStatus = RequestStatusEnum.error;
      errorMessage = e.toString();
    }
    notifyListeners();
  }

  Future<void> _getEverything() async {
    try {
      newsEverythingList = await newsRepository.getEverything();
      everythingStatus = RequestStatusEnum.loaded;
      errorMessage = null;
    } catch (e) {
      everythingStatus = RequestStatusEnum.error;
      errorMessage = e.toString();
    }
    notifyListeners();
  }

  void updateSelectedCategory(String category) {
    selectedCategory = category;
    _getTopHeadline(category: selectedCategory);
    notifyListeners();
  }
}
