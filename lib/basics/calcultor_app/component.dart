import 'package:flutter/material.dart';
import 'package:flutter_roadmap/basics/calcultor_app/constants.dart';

class MyButton extends StatelessWidget {
  final String title;
  const MyButton({Key?key, required this.title,  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 50,
        child:  Center(
            child: Text(
          title,
          style: buttonTextStyle,
        )),
      ),
    );
  }
}
