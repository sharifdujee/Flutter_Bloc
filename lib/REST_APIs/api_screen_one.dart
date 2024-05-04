import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_roadmap/model/photos_model.dart';
import 'package:http/http.dart' as http;

import 'api_screen_two.dart';

class ApiScreenOne extends StatefulWidget {
  const ApiScreenOne({super.key});

  @override
  State<ApiScreenOne> createState() => _ApiScreenOneState();
}

class _ApiScreenOneState extends State<ApiScreenOne> {
  List<Photo> photoList = [];

  Future<List<Photo>> getPhotots() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        Photo photo = Photo(title: i['title'], url: i['url'], id: i['id']);
        photoList.add(photo);
      }
      return photoList;
    } else {
      CircularProgressIndicator(
        semanticsLabel: 'Wait',
      );
      return photoList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('API Screen one'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(future: getPhotots(), builder: (context, AsyncSnapshot<List<Photo>>  snapshot){
              return ListView.builder(
                  itemCount: photoList.length,
                  itemBuilder: (context, index){
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(snapshot.data![index].url.toString()),
                  ),
                  title: Text('Note Id is ${snapshot.data![index].id.toString()}'),
                  subtitle: Text(snapshot.data![index].title.toString()),
                );

              });
            }),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const ApiScreenTwo()));
                  },
                  child: const Text('Next')),
            ),
          ),

        ],
      ),
    );
  }
}
