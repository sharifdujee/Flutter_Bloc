import 'package:flutter/material.dart';
class ReusableProperties extends StatelessWidget {
  final String title;
  String value;
   ReusableProperties({Key?key, required this.title, required this.value}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value)

            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Divider(
            height: 5,
            color: Colors.transparent,

          )
        ],

      ),
    );
  }
}

