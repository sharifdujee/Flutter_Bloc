import 'package:flutter/material.dart';
import 'package:flutter_roadmap/basics/calcultor_app/constants.dart';

class CalculatorButton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onPress;
  const CalculatorButton(
      {Key? key, required this.title, this.color = const Color(0xffa5a5a5a),
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: InkWell(
          onTap: onPress,
          child: Container(
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
            height: 80,
            child: Center(
              child: Text(
                title,
                style: numberTextStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
