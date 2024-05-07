import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_roadmap/REST_APIs/get_Api/api_screen_three.dart';
import 'package:flutter_roadmap/REST_APIs/components.dart';
import 'package:flutter_roadmap/model/UserModel.dart';
import 'package:http/http.dart' as http;

class ApiScreenTwo extends StatefulWidget {
  const ApiScreenTwo({super.key});

  @override
  State<ApiScreenTwo> createState() => _ApiScreenTwoState();
}

class _ApiScreenTwoState extends State<ApiScreenTwo> {
  List<UserModel> userList = [];
  Future<List<UserModel>> getUserApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        userList.add(UserModel.fromJson(i));
      }

      return userList;
    } else {
      return userList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('API Screen Two'),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                  future: getUserApi(),
                  builder: (context, AsyncSnapshot<List<UserModel>> snapshot){
                    if(!snapshot.hasData){
                      return const CircularProgressIndicator(
                        semanticsLabel: 'Wait',
                      );
                    }
                    else{
                      return ListView.builder(
                        itemCount: userList.length,
                          itemBuilder: (context, index){
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  ReusableRow(title: 'name', value: snapshot.data![index].name.toString()),
                                  ReusableRow(title: 'userName', value: snapshot.data![index].username.toString()),
                                  ReusableRow(title: 'email', value: snapshot.data![index].email.toString()),
                                  ReusableRow(title: 'Address', value: snapshot.data![index].address!.geo!.lat.toString())

                                ],
                              ),
                            ),

                          );

                      });
                    }

              },
                  )),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const ApiScreenThree()));
                  },
                  child: const Text('Next')),
            ),
          ),
        ],
      ),
    );
  }
}
