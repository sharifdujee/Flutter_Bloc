import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_roadmap/REST_APIs/api_screen_one.dart';
import 'package:flutter_roadmap/basics/calcultor_app/constants.dart';
import 'package:flutter_roadmap/model/postModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RestApiHomeScreen extends StatefulWidget {
  const RestApiHomeScreen({super.key});

  @override
  State<RestApiHomeScreen> createState() => _RestApiHomeScreenState();
}

class _RestApiHomeScreenState extends State<RestApiHomeScreen> {
  List<PostModel> postList = [];
  Future<List<PostModel>> getPostAPi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = json.decode(response.body.toString());
    if (response.statusCode == 200) {
      postList.clear();
      for (Map i in data) {
        postList.add(PostModel.fromJson(i));
      }
      return postList;
    } else {
      return postList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: const Text('API'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPostAPi(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: postList.length,
                        itemBuilder: (context, index) {
                          return Card(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /*const Text(
                                  'ID',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(' ${postList[index].id.toString()}'),*/
                                const Text(
                                  'Title',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(' ${postList[index].title.toString()}'),

                                const Text(
                                  'Description',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(' ${postList[index].body.toString()}'),
                                //Text(postList[index].title.toString()),
                              ],
                            ),
                          ));
                        });
                  } else {
                    return const Text('loading');
                  }
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const ApiScreenOne()));
                },
                  child: const Text('Next')),
            ),
          ),
        ],
      ),
    );
  }
}
