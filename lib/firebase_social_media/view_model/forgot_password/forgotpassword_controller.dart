
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_roadmap/firebase_social_media/utils/routes/route_name.dart';
import 'package:flutter_roadmap/firebase_social_media/utils/utils.dart';
import 'package:flutter_roadmap/firebase_social_media/view_model/services/session_manager.dart';

class ForgotPasswordController with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('User');

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void forgotPassword(BuildContext context, String email) async {
    setLoading(true);
    try {
      auth.sendPasswordResetEmail(email: email)
          .then((value) {

        setLoading(false);
        Navigator.pushNamed(context, RouteNames.loginScreen);
        Utils.toastMessage('please check your email to recover your password');
      })
          .onError((error, stackTrace) {
        setLoading(false);
        Utils.toastMessage(error.toString());
      });

    } catch (e) {
      setLoading(false);
      Utils.toastMessage(e.toString());
    }
  }
}
