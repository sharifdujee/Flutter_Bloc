import 'package:flutter/material.dart';
class CircularAvatarPractice extends StatefulWidget {
  const CircularAvatarPractice({super.key});

  @override
  State<CircularAvatarPractice> createState() => _CircularAvatarPracticeState();
}

class _CircularAvatarPracticeState extends State<CircularAvatarPractice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Circular Avatar'),
      ),
      body:  const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,

          ),
          Divider(
            color: Colors.black,
            thickness: 3,
          ),
          SizedBox(
            height: 100,
            child: VerticalDivider(
              color: Colors.black,
              thickness: 2,
            ),
          ),
          Divider(
            color: Colors.black,
            thickness: 3,
          ),
          SizedBox(
            height: 100,

          ),

          Center(
            child: CircleAvatar(
              radius: 100,
              backgroundColor: Colors.red,
              //child: Icon(Icons.person),
              backgroundImage: AssetImage('assets/images/sharif1.png'),
            ),
          )
        ],
      ),
    );
  }
}
