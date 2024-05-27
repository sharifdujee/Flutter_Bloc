import 'package:flutter/material.dart';

class PsychologicalAdvice extends StatelessWidget {
  final String adviceCategory;
  final Widget content ;
  const PsychologicalAdvice({super.key, required this.adviceCategory, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          ElevatedButton(
            onPressed: () {
              showDialog(context: context, builder: (BuildContext context){
                return AlertDialog(
                  title: Text(adviceCategory,
                  style: TextStyle(
                    fontSize: 20
                  ),
                  ),
                  content: content,
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Ok'),
                    ),
                  ],
                );
              });
            },
            child: Text('Mental Health'),
          ),
        ],
      );

  }
}
