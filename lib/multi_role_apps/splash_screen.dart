import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_roadmap/multi_role_apps/mult_role_apps_login_screen.dart';
import 'package:flutter_roadmap/multi_role_apps/multi_role_home_screen.dart';
import 'package:flutter_roadmap/multi_role_apps/student_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SplashScreen extends StatefulWidget {
  static String routeName = '/splash';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _isLogin();
    /*Timer(Duration(seconds: 5), () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=> const MultiRoleAppsLoginScreen() ));
    });*/

  }
  void _isLogin() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool isLogin = sharedPreferences.getBool('isLogin')?? false;
    String userType = sharedPreferences.getString('userType')??'';
    if(isLogin){
      if(userType == 'student'){
        Timer(const Duration(seconds: 5), () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const StudentScreen() ));
        });

      }
      else{
        Timer(const Duration(seconds: 5), () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const MultiRoleAppsLoginScreen() ));
        });
      }


    }
    else{
      Timer(const Duration(seconds: 5), () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const MultiRoleAppsLoginScreen() ));
      });
    }

  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Image(
        height: double.infinity,
        image: NetworkImage('https://images.pexels.com/photos/1400172/pexels-photo-1400172.jpeg?auto=compress&cs=tinysrgb&w=600'),
      fit: BoxFit.fitHeight,),

    );
  }
}
