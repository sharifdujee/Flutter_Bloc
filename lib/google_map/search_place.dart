import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;
class LocationSearchScreen extends StatefulWidget {
  const LocationSearchScreen({super.key});

  @override
  State<LocationSearchScreen> createState() => _LocationSearchScreenState();
}

class _LocationSearchScreenState extends State<LocationSearchScreen> {
  TextEditingController _controller = TextEditingController();
  var uuid = Uuid();
  String _sessionToken = '123456';
  List<dynamic> _places = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(() {
      onChange();
    });
  }
  void onChange(){
    if(_sessionToken == null){
      setState(() {
        _sessionToken = uuid.v4();
      });
    }
    getSuggestion(_controller.text);

  }
  void getSuggestion(String input) async{
    String kPLACES_API_KEY = ''; // My Google Place Api
    String baseURL = 'https://googleapis.com/maps/place/autocomplete/json';
    String request = '$baseURL?input =$input&key=$kPLACES_API_KEY&sessiontoken=$_sessionToken';
    var response = await http.get(Uri.parse(request));
    var data = response.body.toString();
    print('data');
    print(data);
    print(response);

    if(response.statusCode==200){
      setState(() {
        _places = jsonDecode(response.body.toString()) ['predictions'];
      });

    }
    else{
      throw Exception('Failed to load data');
    }

  }
  @override
  Widget build(BuildContext context) {
    // need for enable places API
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Search Place Api'),
        elevation: 0,
      ),
      body: Padding(padding: const  EdgeInsets.symmetric(vertical: 12),
        child: Column(
          children: [
            TextFormField(
              controller: _controller,
              decoration: InputDecoration(

                hintText: 'Search places with name'
              ),
            ),
            Expanded(child: ListView.builder(
              itemCount: _places.length,
                itemBuilder: (context, index){
                return ListTile(
                  onTap: () async{
                    List<Location> locations = await locationFromAddress(_places[index]['description']);
                    print(locations.last.longitude);
                    print(locations.last.latitude);
                  },
                  title: Text(_places[index]['description']),
                  
                );
              
            }))

          ],
        ),
      ),
    );
  }
}
