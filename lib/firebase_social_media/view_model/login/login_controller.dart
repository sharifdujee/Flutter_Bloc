import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_roadmap/firebase_social_media/utils/routes/route_name.dart';
import 'package:flutter_roadmap/firebase_social_media/utils/utils.dart';
import 'package:flutter_roadmap/firebase_social_media/view_model/services/session_manager.dart';

class LoginController with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('User');

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void login(BuildContext context, String email, String password) async {
    setLoading(true);
    try {
      auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
            SessionController().userId = value.user!.uid.toString();
            setLoading(false);
            Navigator.pushNamed(context, RouteNames.dashboard);
          })
          .then((value) {})
          .onError((error, stackTrace) {
            setLoading(false);
            Utils.toastMessage(error.toString());
          });
      Utils.toastMessage('Successfully Login');
      setLoading(false);
    } catch (e) {
      setLoading(false);
      Utils.toastMessage(e.toString());
    }
  }
}
