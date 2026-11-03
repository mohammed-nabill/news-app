import 'package:flutter/material.dart';

import '../../core/enums/request_status_enum.dart';
import '../../core/mixins/safe_notify_mixin.dart';
import '../../core/repos/news_repository.dart';
import 'models/news_article_model.dart';

class HomeController with ChangeNotifier, SafeNotifyMixin {
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
    safeNotify();
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
    safeNotify();
  }

  void updateSelectedCategory(String category) {
    selectedCategory = category;
    _getTopHeadline(category: selectedCategory);
    safeNotify();
  }
}
