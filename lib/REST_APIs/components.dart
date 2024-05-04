import 'package:flutter/material.dart';

class ReusableRow extends StatelessWidget {
  String title;
  String value;
  ReusableRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [Text(title), Text(value)],
    );
  }
}
