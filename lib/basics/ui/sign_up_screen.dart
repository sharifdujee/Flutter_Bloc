
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_roadmap/basics/ui/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Sign Up Screen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[_signUp()],
        ),
      ),
    );
  }

  Widget _signUp() {
    return SafeArea(
        child: Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Image(
              image: AssetImage(
                'assets/images/logo.png',
              ),
              height: 50,
              width: 50,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Maintenance',
                  style: TextStyle(fontSize: 24, color: Colors.grey),
                ),
                Text(
                  'Box',
                  style: TextStyle(fontSize: 24, color: Colors.deepOrange[200]),
                )
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        Center(
          child: Text(
            'Sign Up',
            style: TextStyle(fontSize: 24, color: Colors.deepOrange[300]),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Center(
          child: Text(
            'Lorem ipsum dolor sit amet, \nconsecrate',
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: TextFormField(
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.teal,
                hintText: 'User Name',
                hintStyle: TextStyle(color: Colors.deepOrange[300]),
                prefixIcon: Icon(
                  Icons.supervised_user_circle,
                  color: Colors.blueGrey[600],
                ),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.deepOrange,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 5),
                ),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red))),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: TextFormField(
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.teal,
                hintText: 'Email',
                hintStyle: TextStyle(color: Colors.deepOrange[300]),
                prefixIcon: Icon(
                  Icons.alternate_email,
                  color: Colors.blueGrey[600],
                ),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.deepOrange,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 5),
                ),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red))),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: TextFormField(
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.teal,
                hintText: 'Mobile',
                hintStyle: TextStyle(color: Colors.deepOrange[300]),
                prefixIcon: Icon(
                  Icons.phone,
                  color: Colors.blueGrey[600],
                ),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.deepOrange,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 5),
                ),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red))),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: TextFormField(
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.teal,
                hintText: 'Address',
                hintStyle: TextStyle(color: Colors.deepOrange[300]),
                prefixIcon: Icon(
                  Icons.location_on,
                  color: Colors.blueGrey[600],
                ),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.deepOrange,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 5),
                ),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red))),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: TextFormField(
            obscureText: !_isVisible,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.teal,
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.deepOrange[300]),
                prefixIcon: Icon(
                  Icons.lock_open,
                  color: Colors.blueGrey[600],
                ),
                suffixIcon: const Icon(Icons.visibility),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.deepOrange,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 5),
                ),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red))),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: TextFormField(
            obscureText: !_isVisible,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.teal,
                hintText: 'Confirm Password',
                hintStyle: TextStyle(color: Colors.deepOrange[300]),
                prefixIcon: Icon(
                  Icons.lock_open,
                  color: Colors.blueGrey[600],
                ),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.deepOrange,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 5),
                ),
                suffixIcon: const Icon(Icons.visibility),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red))),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 200),
          child: Text(
            'Forget Password',
            style: TextStyle(decoration: TextDecoration.underline),
          ),
        ),
        Container(
          height: 50,
          width: 300,
          decoration: const BoxDecoration(
            color: Colors.deepOrange
          ),
          child:  Center(
            child: GestureDetector(
              onLongPress: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LogInScreen()));
              },
              child: const Text('Sign Up',
                style: TextStyle(
                ),
                  ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
         Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Already Have a Account?'),

            GestureDetector(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LogInScreen()));
              },
                child:  Text('\tLog In',
                style: TextStyle(
                  color: Colors.deepOrange[300]
                ),)),
          ],
        )
      ],
    ));
  }
}
