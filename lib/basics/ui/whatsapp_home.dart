
import 'package:flutter/material.dart';
import 'package:flutter_roadmap/basics/ui/call_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        actions: const [
          Row(
            children: [
              Icon(Icons.camera_alt_outlined),
              SizedBox(
                width: 10,
              ),
              Icon(Icons.search_outlined),
              SizedBox(
                width: 10,
              ),
              Icon(Icons.more_vert)
            ],
          )
        ],
        centerTitle: true,
        title: const Text(
          'DashBoard',
        ),
      ),
      drawer: Drawer(
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.all(12.0),
          children: <Widget>[
            const UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.grey),
                currentAccountPicture:
                    Image(image: AssetImage('assets/images/img.png')),
                accountName: Text('Md Sharif Hossain'),
                accountEmail: Text('sharifdu44@gmail.com')),
            ListTile(
              leading: const Text('Home'),
              title: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  },
                  child: const Icon(Icons.accessibility)),
              trailing: const Icon(Icons.drive_file_move),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              //  _userList(),
              const Divider(
                color: Colors.transparent,
              ),
              _bottomNavigation()
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.green,
          child: const Icon(Icons.chat_sharp),
        ),
      ),
    );
  }

  Widget _userList() {
    return Column(
      children: [
        Flexible(
          fit: FlexFit.loose,
          child: ListView(),
        ),
      ],
    );
  }

  Widget _bottomNavigation() {
    int selectedIndex = 0;
    if(selectedIndex==0){
      GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));
        },
      );
    }
    if(selectedIndex==1){
      GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const CallingScreen()));
        },
      );

    }
    return Padding(

      padding: const EdgeInsets.only(top: 580),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats'),
          BottomNavigationBarItem(icon: Icon(Icons.phone), label: 'Calls'),
          BottomNavigationBarItem(
              icon: Icon(Icons.update_rounded), label: 'Updates'),
          BottomNavigationBarItem(
              icon: Icon(Icons.pan_tool_sharp), label: 'Tools'),
        ],
      ),
    );
  }
}
