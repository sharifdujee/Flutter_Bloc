import 'package:flutter/material.dart';
import 'package:flutter_roadmap/basics/navigation/screen_three.dart';
import 'package:flutter_roadmap/basics/navigation/screen_two.dart';

class CreateHomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';
  const CreateHomeScreen({super.key});

  @override
  State<CreateHomeScreen> createState() => _CreateHomeScreenState();
}

class _CreateHomeScreenState extends State<CreateHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.green.withOpacity(.5),
        centerTitle: true,
        title: const Text('Navigation Drawer'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
           /* DrawerHeader(child: Text('Sharif Hossain'),
            ),*/
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.2)
              ),
                currentAccountPicture: CircleAvatar(
                    child: Image.asset('assets/images/sharif1.png', fit: BoxFit.cover,)
                ),
                accountName: const Text('Sharif Hossain'), accountEmail: const Text('sharifdu44@gmail.com')),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home Screen'),
              onTap: (){
                Navigator.pushNamed(context, CreateHomeScreen.routeName);
              },
            ),
            ListTile(
              leading: const Icon(Icons.calculate),
              title: const Text('Screen Two'),
              onTap: (){
                Navigator.pushNamed(context, ScreenTwo.routeName);
              },
            ),
            ListTile(
              leading: const Icon(Icons.school),
              title: const Text('Screen Three'),
              onTap: (){
                Navigator.pushNamed(context, ScreenThree.routeName);
              },
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: TextButton(onPressed: () {
              Navigator.pushNamed(context, ScreenTwo.routeName);
              /*Navigator.push(context, MaterialPageRoute(builder: (context)=> const ScreenTwo()
              ));*/

            }, child: const Text('Screen 1')),
          )
        ],
      ),
    );
  }
}
