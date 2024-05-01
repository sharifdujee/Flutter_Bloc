import 'package:flutter/material.dart';
import 'package:flutter_roadmap/basics/calcultor_app/components/round_button.dart';
class CheckComponentScreen extends StatefulWidget {
  static String routeName = '/check';
  const CheckComponentScreen({super.key});

  @override
  State<CheckComponentScreen> createState() => _CheckComponentScreenState();
}

class _CheckComponentScreenState extends State<CheckComponentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Components'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              RoundButtonScreen(name: 'Login', onPress: (){
                print('Click');
              },),
              RoundButtonScreen(name: 'Signup', onPress: (){},),
              RoundButtonScreen(name: 'Continue', onPress: (){},),
              RoundButtonScreen(name: 'Forgot Password', onPress: (){},),

            ],
          ),
        ),
      ),
    );
  }
}
