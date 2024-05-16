
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_roadmap/firebase_social_media/utils/routes/route_name.dart';
import 'package:flutter_roadmap/firebase_social_media/view_model/services/session_manager.dart';


class SplashService{


  void isLogin(BuildContext context){
    FirebaseAuth auth = FirebaseAuth.instance;

    final user = auth.currentUser;
    if(user != null){
      SessionController().userId = user.uid.toString();
      Timer(const Duration(seconds: 3), () => Navigator.pushNamed(context, RouteNames.dashboard));

    }
    else{
      Timer(const Duration(seconds: 3), () => Navigator.pushNamed(context, RouteNames.loginScreen));

    }

  }
}