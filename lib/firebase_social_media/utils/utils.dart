import 'package:flutter/material.dart';
import 'package:flutter_roadmap/firebase_social_media/resource/color.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils{

  static void fieldFocus(BuildContext context, FocusNode currentNode,  FocusNode nextFocus){
    currentNode.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);

  }
  static toastMessage(String message){
    Fluttertoast.showToast(msg: message,
      backgroundColor: AppColor.primaryColor,
      textColor:  AppColor.whiteColor,
      fontSize: 16,

    );

  }
}