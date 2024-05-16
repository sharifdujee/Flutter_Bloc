import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_roadmap/firebase_social_media/resource/color.dart';
import 'package:flutter_roadmap/firebase_social_media/utils/routes/route_name.dart';
import 'package:flutter_roadmap/firebase_social_media/view_model/services/session_manager.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
class SocialMediaDashBoard extends StatefulWidget {
  const SocialMediaDashBoard({super.key});

  @override
  State<SocialMediaDashBoard> createState() => _SocialMediaDashBoardState();
}

class _SocialMediaDashBoardState extends State<SocialMediaDashBoard> {
  final controller = PersistentTabController(initialIndex: 0);
 List<Widget> _buildScreen(){
   return [
     SafeArea(child: Text('Home', style: Theme.of(context).textTheme.subtitle1,)),
     Text('Chat'),
     Text('Add'),
     Text('Message'),
     Text('Profile'),


   ];


  }
  List<PersistentBottomNavBarItem> _navBarItem(){
   return [
     PersistentBottomNavBarItem(icon: Icon(Icons.home,),
     activeColorPrimary: AppColor.primaryIconColor,
     inactiveIcon: Icon(Icons.home, color: AppColor.textFieldDefaultBorderColor,)),
     PersistentBottomNavBarItem(icon: Icon(Icons.message),
         activeColorPrimary: AppColor.primaryIconColor,
     inactiveIcon: Icon(Icons.message, color: AppColor.textFieldDefaultBorderColor,)),
     PersistentBottomNavBarItem(icon: Icon(Icons.add),
         activeColorPrimary: AppColor.primaryIconColor,
     inactiveIcon: Icon(Icons.add, color: AppColor.textFieldDefaultBorderColor,)),
     PersistentBottomNavBarItem(icon: Icon(Icons.message),
         activeColorPrimary: AppColor.primaryIconColor,
    inactiveIcon: Icon(Icons.message, color: AppColor.textFieldDefaultBorderColor,)),
     PersistentBottomNavBarItem(icon: Icon(Icons.person),
         activeColorPrimary: AppColor.primaryIconColor,
    inactiveIcon: Icon(Icons.add, color: AppColor.textFieldDefaultBorderColor,)),


   ];

  }
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(context, screens: _buildScreen(),
      items: _navBarItem(),
      controller: controller,
      backgroundColor: AppColor.otpHintColor,
      decoration: NavBarDecoration(
        colorBehindNavBar: Colors.red,
        borderRadius: BorderRadius.circular(1),
      ),
      navBarStyle: NavBarStyle.style15,
    );
    /*Scaffold(
      appBar: AppBar(
        title: Text(SessionController().userId.toString()),
        actions: [
          IconButton(onPressed: (){
            FirebaseAuth auth = FirebaseAuth.instance;
            auth.signOut().then((value){
              SessionController().userId = '';
              Navigator.pushNamed(context, RouteNames.loginScreen);

            });

          }, icon: const Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [

        ],
      ),
    );*/
  }
}
