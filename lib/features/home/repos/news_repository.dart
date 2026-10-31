import '../../../core/data_source/remote_data/api_config.dart';
import '../../../core/data_source/remote_data/api_services.dart';
import '../models/news_article_model.dart';

class NewsRepository {
  final ApiServices apiServices = ApiServices();

  Future<List<NewsArticleModel>> getTopHeadline({String? category}) async {
    Map<String, dynamic> result = await apiServices.get(
      ApiConfig.topHeadlines,
      params: {"country": "us", "category": category},
    );

    return (result["articles"] as List)
        .map((e) => NewsArticleModel.fromMap(e))
        .toList();
  }
  Future<List<NewsArticleModel>> getEverything() async {
    Map<String, dynamic> result = await apiServices.get(
      ApiConfig.everything,
      params: {"q": "news"},
    );

    return (result["articles"] as List)
        .map((e) => NewsArticleModel.fromMap(e))
        .toList();

  }
}
