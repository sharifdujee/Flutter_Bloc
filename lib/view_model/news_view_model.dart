
import 'package:news_apps/model/news_channel_headlines_model.dart';
import 'package:news_apps/repository/news_repository.dart';

class NewsViewModel{
  final _rep = NewsRepository();

  Future<NewsChannelHeadlinesModel> fetchNewsChannelHeadLineApi() async{
    final response =  await _rep.fetchNewsChannelHeadLineApi();
    return response;

  }
}