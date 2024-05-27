import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_roadmap/firebase_notification/notification_services.dart';
import 'package:http/http.dart' as http;
class NotificationHomeScreen extends StatefulWidget {
  const NotificationHomeScreen({super.key});

  @override
  State<NotificationHomeScreen> createState() => _NotificationHomeScreenState();
}

class _NotificationHomeScreenState extends State<NotificationHomeScreen> {
  NotificationServices notificationServices = NotificationServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notificationServices.requestNotificationPermission();
    notificationServices.firebaseInit(context);
    notificationServices.setupInteractMessage(context);
    notificationServices.isTokenRefresh();
    notificationServices.getDeviceToken().then((value){
      print('Device token');
      print(value);

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Notification'),
      ),
      body: Center(
        child: TextButton(onPressed: (){
          notificationServices.getDeviceToken().then((value) async{
            var data = {
              'to': value.toString(),
              // receiver device token
              'priority': 'high',
              'notification': {
                'title': 'sharif',
                'body': 'subscribe'
              },
              'data': {
                'type': 'msj',
                'id': '123'
              }
            };
            await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
              body: jsonEncode(data) ,
              headers: {
                    'Content-Type': 'application/json; charset=UTF-8',
                     'Authorization': 'key='
                // set the server key here

              }
            );

          });
        }, child: const Text('send notification')),
      ),



    );
  }
}
