import 'dart:async';
import 'dart:io';

import 'package:bloc_basic/model/posts_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class PostRepository{
  
  Future<List<PostModel>> fetchPost() async{
    try{
      final response =  await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'),
      );
      if(response.statusCode==200){
        final body = json.decode(response.body) as List;
        return body.map((e){
          return PostModel(
            postId: e['postId'] as int,
            id: e['id'],
            name: e['name'],
            email: e['email'] as String,
            body: e['body'] as String,
          );

        }).toList();

      }
      
    }
    on SocketException{
      throw Exception('an error occurring fetching the data');
    }
    on  TimeoutException{
      ('an error occurring fetching the data');

    }

    catch(e){
      print(e.toString());
    }
    throw Exception('error while fetching the data');
  }
  
}