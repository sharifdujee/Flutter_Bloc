import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_roadmap/REST_APIs/post_api/upload_image.dart';
import 'package:flutter_roadmap/basics/calcultor_app/constants.dart';
import 'package:http/http.dart';

class APISignUpScreen extends StatefulWidget {
  const APISignUpScreen({super.key});

  @override
  State<APISignUpScreen> createState() => _APISignUpScreenState();
}

class _APISignUpScreenState extends State<APISignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void _login(String email, String password) async {
    try {
      Response response =
          await post(Uri.parse('https://reqres.in/api/register'), body: {
        'email': email,
        'password': password,
      });
      if(response.statusCode==200){
        var data  = jsonDecode(response.body.toString());
        print(data['token']);
        print('Account created Successfully');

      }
      else{
        print('failed');
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Sign Up Api'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(hintText: 'Email'),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(hintText: 'Password'),
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                _login(emailController.text.toString(),
                    passwordController.text.toString());
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: greenColor),
                child: const Center(
                  child: Text('signup'),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const ImageUploadScreen()));
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: greenColor),
                child: const Center(
                  child: Text('upload'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
