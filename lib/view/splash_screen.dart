import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_apps/view/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));


    });
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height *1;
    final width = MediaQuery.of(context).size.width *1;
    return Scaffold(
      body: Container(
        child: Column(/* width: width * .9,*/
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/splash_pic.jpg',
            fit: BoxFit.cover,
            height: height * .5,
           ),
            SizedBox(
              height:  height * 0.04,
            ),
            Text('Top Headline', style: GoogleFonts.anton(
              color: Colors.grey.shade700,
              letterSpacing: 6,

            ),),
            SizedBox(
              height:  height * 0.04,
            ),
            SpinKitChasingDots(
              size: 40,
              color: Colors.blue,
            )
          ],
        ),
      ),

    );
  }
}
