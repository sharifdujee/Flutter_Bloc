import 'package:flutter/material.dart';
import 'package:flutter_roadmap/basics/calcultor_app/constants.dart';
import 'package:flutter_roadmap/navigation_routing/navigation_home_screen.dart';
import 'package:flutter_roadmap/navigation_routing/navigation_screen-two.dart';
import 'package:flutter_roadmap/navigation_routing/route_names.dart';
import 'package:flutter_roadmap/services/news_paper.dart';

class NavigationScreenOne extends StatefulWidget {
  static const String routeName = '/screen_one';
  const NavigationScreenOne({super.key});

  @override
  State<NavigationScreenOne> createState() => _NavigationScreenOneState();
}

class _NavigationScreenOneState extends State<NavigationScreenOne> {

  @override
  void initState() {
    // TODO: implement initState
    _getWorldNews();
    super.initState();
  }
  void _getWorldNews() async{
    try{
      print('Hi');
      var response = await NewsPaperService.getNews();
      print('the world news is ${response.body}');

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
        title: const Text('Screen one'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RouteName.screenTwo,
                );
                /* Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NavigationHomeScreen()));*/
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: greenColor,
                ),
                child: const Center(
                  child: Text('Screen 1'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
