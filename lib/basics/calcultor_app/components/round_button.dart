import 'package:flutter/material.dart';
import 'package:flutter_roadmap/basics/calcultor_app/constants.dart';
class RoundButtonScreen extends StatelessWidget {
  String name;
  VoidCallback onPress;
   RoundButtonScreen({required this.name, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        onTap: onPress,
        child: Container(
          height: 50,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: greenColor,
          ),
          child: Center(
            child: Text(name,
            style: buttonTextStyle,),
          ),

        ),
      ),
    );
  }
}
