import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_roadmap/basics/calcultor_app/constants.dart';
import 'package:flutter_roadmap/navigation_routing/navigation_screen-two.dart';
import 'package:flutter_roadmap/navigation_routing/navigation_screen_one.dart';
import 'package:flutter_roadmap/navigation_routing/route_names.dart';

class NavigationHomeScreen extends StatefulWidget {
 // static const String routeName = '/navigation';
  const NavigationHomeScreen({super.key});

  @override
  State<NavigationHomeScreen> createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Subscribe'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RouteName.screenTwo,
                  arguments: {
                  'node': 'Js module',
                    'flutter': 'Good for apps'
                  }
                );

               // Navigator.pushNamed(context, NavigationScreenOne.routeName);
                /*Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NavigationScreenTwo(name: 'Md Sharif', number: 2,)));*/
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: greenColor,
                ),
                child: const Center(
                  child: Text('Home'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
