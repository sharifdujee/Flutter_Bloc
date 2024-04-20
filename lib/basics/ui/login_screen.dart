import 'package:flutter/material.dart';
import 'package:flutter_roadmap/basics/ui/forgot_password_screen.dart';
import 'package:flutter_roadmap/basics/ui/sign_up_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: const Text('Log In Screen',
        style: TextStyle(
          fontFamily: 'Pacifico'
        ),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[_loginScreen()],
        ),
      ),
    );
  }

  Widget _loginScreen() {
    return SafeArea(
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 50,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage('assets/images/logo.png'),
                height: 50,
                width: 50,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Maintenance',
                    style: TextStyle(fontSize: 24,
                    fontFamily: 'Rubik Regular'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Box',
                    style: TextStyle(fontSize: 24, color: Colors.deepOrange, fontFamily: 'Rubik Medium'),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          const Center(
              child: Text(
            'Log In',
            style: TextStyle(fontSize: 24, color: Color(0xff203162)),
          )),
          const SizedBox(
            height: 15,
          ),
          const Center(
              child: Text(
            textAlign: TextAlign.center,
            'Lorem ipsum dolor sit amet, \nconsecrate',
            style: TextStyle(fontSize: 16, color: Color(0xff4C5980)),
          )),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30),
            child: TextFormField(
              decoration: InputDecoration(
                fillColor: Colors.grey,
                filled: true,
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.teal,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.green,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                hintText: 'Email',
                hintStyle: const TextStyle(color: Colors.deepOrange),
                prefixIcon: const Icon(
                  Icons.alternate_email,
                  color: Color(0xff323f4d),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            child: TextFormField(
              obscureText: !_isVisible,
              decoration: InputDecoration(
                  fillColor: Colors.grey,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.teal,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.green,
                  )),
                  hintText: 'Password',
                  hintStyle: const TextStyle(color: Colors.deepOrange),
                  prefixIcon: const Icon(
                    Icons.lock_open,
                    color: Color(0xff323f4d),
                  ),
                  suffixIcon: const Icon(Icons.visibility)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 200,
            ),
            child: GestureDetector(
              onLongPress: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ForgotPasswordScreen()));
              },
              child: const Text(
                'Forget Password',
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: GestureDetector(
                  onLongPress: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()));
                  },
                  child: const Text(
                    'Log In',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Dont Have a account?'),
              const SizedBox(
                width: 5,
              ),
              GestureDetector(
                onDoubleTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpScreen()));
                },
                child: const Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.deepOrange),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
