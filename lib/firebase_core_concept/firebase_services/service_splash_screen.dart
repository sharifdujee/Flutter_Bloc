
import 'dart:async';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_roadmap/firebase_core_concept/fire_store_crud/firestore_list_screen.dart';
import 'package:flutter_roadmap/firebase_core_concept/ui/auth/login_screen.dart';
import 'package:flutter_roadmap/firebase_core_concept/ui/posts/post_screen.dart';
import 'package:flutter_roadmap/firebase_core_concept/upload_image.dart';

class SplashServices{

  void isLogin(BuildContext context){
    final _auth = FirebaseAuth.instance;
    final user = _auth.currentUser;

    if(user!=null){
      Timer(const Duration(seconds: 3), () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const UploadImageScreen()));
      });

    }
    else{
      Timer(const Duration(seconds: 3), () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const FireBaseLoginScreen()));
      });
    }


    


  }
}