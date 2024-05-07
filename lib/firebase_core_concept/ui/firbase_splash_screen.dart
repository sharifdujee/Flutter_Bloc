import 'package:flutter/material.dart';
import 'package:flutter_roadmap/firebase_core_concept/firebase_services/service_splash_screen.dart';
class FireBaseSplashScreen extends StatefulWidget {
  const FireBaseSplashScreen({super.key});

  @override
  State<FireBaseSplashScreen> createState() => _FireBaseSplashScreenState();
}

class _FireBaseSplashScreenState extends State<FireBaseSplashScreen> {
  SplashServices splashServices = SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashServices.isLogin(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('FireBase Tutorials', style: TextStyle(
          fontSize: 30
        ),),
      ),
    );
  }
}
