import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_roadmap/REST_APIs/components.dart';
import 'package:http/http.dart' as http;
class ApiScreenThree extends StatefulWidget {
  const ApiScreenThree({super.key});

  @override
  State<ApiScreenThree> createState() => _ApiScreenThreeState();
}

class _ApiScreenThreeState extends State<ApiScreenThree> {
  var data;
  
  Future<void> getUserApi() async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if(response.statusCode==200){
      data = jsonDecode(response.body.toString());

    }
    else{

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('API Screen Three'),
      ),
      body: Column(
        children: [
          Expanded(child: FutureBuilder(
              future: getUserApi(), builder: (context, snapshot){
                if(snapshot.connectionState== ConnectionState.waiting){
                  return Text('loading');

                }
                else{
                  return ListView.builder(
                    itemCount: data.length,
                      itemBuilder: (context, index){

                    return Card(
                      child: Column(
                        children: [
                          ReusableRow(title: 'name', value: data[index]['name'].toString()),
                          ReusableRow(title: 'userName', value: data[index]['username'].toString()),
                          ReusableRow(title: 'Address', value: data[index]['address']['zipcode'].toString()),

                        ],
                      ),
                    );
                  });

                }

          }))
        ],
      ),
    );
  }
}
