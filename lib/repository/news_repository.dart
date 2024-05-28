import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:news_apps/model/categories_news_model.dart';
import 'package:news_apps/model/news_channel_headlines_model.dart';
class NewsRepository{


  Future<NewsChannelHeadlinesModel> fetchNewsChannelHeadLineApi(String newsChannel) async{

    String url = 'https://newsapi.org/v2/top-headlines?sources=$newsChannel&apiKey=ffb1b40693b041929efdeaf2f781c15e';

    final response = await http.get(Uri.parse(url));
    if(kDebugMode){
     // print('the response is ${response.body}');
    }

    if(response.statusCode==200){
      final body = jsonDecode(response.body);
      return NewsChannelHeadlinesModel.fromJson(body);

    }
    throw Exception('Error');

  }
  Future<CategoriesNewsModel> fetchCategoriesNewsApi(String category) async{

    String url = 'https://newsapi.org/v2/top-headlines?category=$category&apiKey=ffb1b40693b041929efdeaf2f781c15e';

    final response = await http.get(Uri.parse(url));
    if(kDebugMode){
      // print('the response is ${response.body}');
    }

    if(response.statusCode==200){
      final body = jsonDecode(response.body);
      return CategoriesNewsModel.fromJson(body);

    }
    throw Exception('Error');

  }


}