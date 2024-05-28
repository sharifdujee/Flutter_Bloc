
import 'package:news_apps/model/categories_news_model.dart';
import 'package:news_apps/model/news_channel_headlines_model.dart';
import 'package:news_apps/repository/news_repository.dart';

class NewsViewModel{
  final _rep = NewsRepository();

  //String get name => '';

  Future<NewsChannelHeadlinesModel> fetchNewsChannelHeadLineApi(String name) async{
    final response =  await _rep.fetchNewsChannelHeadLineApi(name);
    return response;

  }

  Future<CategoriesNewsModel> fetchCategoriesNewsApi(String category) async{
    final response =  await _rep.fetchCategoriesNewsApi(category);
    return response;

  }
}