import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_roadmap/firebase_core_concept/ui/auth/login_screen.dart';
import 'package:flutter_roadmap/firebase_core_concept/widgets/round_button.dart';

class FireBaseSignUpScreen extends StatefulWidget {
  const FireBaseSignUpScreen({super.key});

  @override
  State<FireBaseSignUpScreen> createState() => _FireBaseSignUpScreenState();
}

class _FireBaseSignUpScreenState extends State<FireBaseSignUpScreen> {
  final _formField = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /*Expanded(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Center(
                      child: Image(image: AssetImage('assets/images/food.jpg'),
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,),
                    ),
                  ),
                ],
              ),
            ),*/
            Form(
              key: _formField,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter email';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.alternate_email),
                        hintText: 'Email',
                        helperText: 'enter email e.g: dipu42@gmail.com',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter password';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    controller: passwordController,
                    obscureText: true,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        hintText: 'password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ],
              ),
            ),
            RoundButton(
              title: 'Signup',
              onTap: () {
                if (_formField.currentState!.validate()) {
                  _auth.createUserWithEmailAndPassword(
                      email: emailController.text.toString(),
                      password: passwordController.text.toString()).then((value){

                  }).onError((error, stackTrace){

                  });
                }
              },
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FireBaseLoginScreen()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already  have a account?'),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'login',
                      style: TextStyle(
                          color: Colors.red[200],
                          decoration: TextDecoration.underline),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
