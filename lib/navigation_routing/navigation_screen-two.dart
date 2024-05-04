import 'package:flutter/material.dart';
import 'package:flutter_roadmap/basics/calcultor_app/constants.dart';
import 'package:flutter_roadmap/navigation_routing/navigation_screen_one.dart';
import 'package:flutter_roadmap/services/news_paper.dart';
import 'dart:convert';

class NavigationScreenTwo extends StatefulWidget {
  static const String routeName = '/screen_two';
  dynamic data;
   NavigationScreenTwo({Key? key, required this.data}): super(key: key);

  @override
  State<NavigationScreenTwo> createState() => _NavigationScreenTwoState();
}

class _NavigationScreenTwoState extends State<NavigationScreenTwo> {
  String title = '';
  @override
  void initState() {
    // TODO: implement initState
   // _getWorldNews();
    super.initState();
  }
  void _getWorldNews() async{
    try{
      //print('Hi');
      var response = await NewsPaperService.getNews();
      if(response.statusCode==200){
        var jsonData = json.decode(response);

        if(jsonData!=null && jsonData.isNotEmpty){
          setState(() {
            title = jsonData[0]['title'].toString();
            print('the title is$title');
          });
        }
      }
      //print('the world news is ${response.body}');

    }
    on Exception catch(e){
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text(widget.data['flutter']),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
                /*Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NavigationScreenOne()));*/
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: greenColor,
                ),
                child: const Center(
                  child: Text('Screen 2'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


}
