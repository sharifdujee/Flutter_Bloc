import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_roadmap/basics/navigation/home_screen.dart';
import 'package:flutter_roadmap/basics/navigation/screen_three.dart';
class ScreenTwo extends StatefulWidget {
  static const String routeName = 'screen_two';
  const ScreenTwo({super.key});

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Drawer'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget> [
          Expanded(
            child: ListView.builder(
              itemCount: 100,
                itemBuilder: (context, index){
                return ListTile(
                  leading: CircleAvatar(
                      child: Image.asset('assets/images/sharif1.png', fit: BoxFit.cover,)
                  ),
                  title: const Text('Home Screen'),
                  onTap: (){
                    Navigator.pushNamed(context, CreateHomeScreen.routeName);
                  },
                );

            }),
          )
          /*Center(
            child: TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: const Text('Screen Two')),
          ),
          Center(
            child: TextButton(onPressed: (){
              Navigator.pushNamed(context, ScreenThree.routeName);
            }, child: const Text('Screen Three')),
          )*/

        ],
      ),
    );
  }
}
