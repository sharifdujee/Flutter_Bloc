import 'package:flutter/material.dart';
import 'package:flutter_roadmap/firebase_social_media/resource/font.dart';
import 'package:flutter_roadmap/firebase_social_media/view_model/services/splash_services.dart';

class SocialMediaSplashScreen extends StatefulWidget {
  const SocialMediaSplashScreen({Key? key}) : super(key: key);

  @override
  State<SocialMediaSplashScreen> createState() =>
      _SocialMediaSplashScreenState();
}

class _SocialMediaSplashScreenState extends State<SocialMediaSplashScreen> {
  SplashService splashService = SplashService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashService.isLogin(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(image: AssetImage('assets/images/sharif.png')),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Center(
                child: Text(
              'Social  Media',
              style: TextStyle(
                  fontFamily: AppFont.sfProDisplayBold,
                  fontSize: 40,
                  fontWeight: FontWeight.w700),
            )),
          )
        ],
      )),
    );
  }
}
