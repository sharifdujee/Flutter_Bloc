

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_roadmap/firebase_social_media/utils/routes/route_name.dart';
import 'package:flutter_roadmap/firebase_social_media/utils/utils.dart';
import 'package:flutter_roadmap/firebase_social_media/view_model/services/session_manager.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

class SignUpController with  ChangeNotifier{
 FirebaseAuth  auth = FirebaseAuth.instance;
 DatabaseReference ref = FirebaseDatabase.instance.ref().child('User');

  bool _loading = false;
  bool get loading => _loading;

  setLoading (bool value){
    _loading = value;
    notifyListeners();

  }
  void  signup( BuildContext context, String userName, String email, String password) async{
    setLoading(true);
    try{
      auth.createUserWithEmailAndPassword(email: email, password: password).
      then((value){
        SessionController().userId = value.user!.uid.toString();
        ref.child(value.user!.uid.toString()).set({
          'uid': value.user!.uid.toString(),
          'email': value.user!.email.toString(),
          'onlineStatus': 'noOne',
          'userName': userName,
          'phone': '',
          'profile': ''

        }).then((value){
          setLoading(false);
          Navigator.pushNamed(context, RouteNames.dashboard);


        }).onError((error, stackTrace){
          setLoading(false);
          Utils.toastMessage(error.toString());

        });
        Utils.toastMessage('User create successfully');
        setLoading(false);

      }).onError((error, stackTrace){
        setLoading(false);
        Utils.toastMessage(error.toString());
      });


    }
    catch(e){
      setLoading(false);
      Utils.toastMessage(e.toString());

    }


  }
}