import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_roadmap/model/drop_down_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class DropDownFromApiScreen extends StatefulWidget {
  const DropDownFromApiScreen({super.key});

  @override
  State<DropDownFromApiScreen> createState() => _DropDownFromApiScreenState();
}

class _DropDownFromApiScreenState extends State<DropDownFromApiScreen> {
  Future<List<DropDownModel>> getPost() async{
    try{
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      final body = json.decode(response.body) as List;
      if(response.statusCode==200){
        return body.map((e){
          final map = e as Map<String, dynamic>;
          return DropDownModel(
            userId: map['userId'],
              id: map['id'],
          title: map['title'],
          body: map['body']

          );

        }).toList();

      }
    }
    on Exception catch(e){
      print(e.toString());
    }
    throw Exception('error during fetch the data');

    
  }
  var selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Dropdown Api'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder<List<DropDownModel>>(future: getPost(),
                builder: (context, snapshot){
              if(snapshot.hasData){
                return DropdownButton(
                  hint: const Text('select the value'),
                    isExpanded: true,
                    value: selectedValue,
                    icon: const Icon(Icons.add_circle_outline),
                    items: snapshot.data!.map((e){
                      return DropdownMenuItem(
                        value:  e.title.toString(),
                          child: Text(e.title.toString()));

                    }).toList(), onChanged: (value){
                    selectedValue = value;
                    setState(() {

                    });
                });

              }
              else{
                return const Column(
                  children: [
                    SizedBox(
                      height: 200,
                      child: Stack(
                       children: [
                         Center(
                           child: SizedBox(
                             width: 100,
                             height: 100,

                             child: CircularProgressIndicator(
                               strokeWidth: 15,
                               value: 2.0,

                             ),

                           ),
                         ),

                       ],
                      ),
                    ),
                    Center(
                      child: Text('Wait'),
                    )
                  ],
                );
              }
                })

          ],
        ),
      ),
    );
  }
  Widget _circularProgressWithText({required int percentage, String? text}) {
    var value = percentage / 100.0;
    var size = 42.0;

    text ??= '$percentage%';

    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        Center(
          child: SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              value: value,
            ),
          ),
        ),
        Center(child: Text(text)),
      ],
    );
  }
}
