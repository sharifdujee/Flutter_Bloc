import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class PracticeColumnWidget extends StatefulWidget {
  const PracticeColumnWidget({super.key});

  @override
  State<PracticeColumnWidget> createState() => _PracticeColumnWidgetState();
}

class _PracticeColumnWidgetState extends State<PracticeColumnWidget> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Column Widget'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
            color: Colors.red,

            child: Center(
              child: Text('Container'),
            ),
          ),


          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Container(
                
                //alignment: Alignment.topLeft,
                transform: Matrix4.rotationZ(.4),
                //margin: EdgeInsets.only(left:10, top: 100, right: 200),
                decoration:  BoxDecoration(
                    color: Colors.orange,
                    borderRadius:  BorderRadius.circular(10,
                    ),
                    border: Border.all(
                      color: Colors.red,
                      width: 1,
                    ),
                    image: const DecorationImage(image: AssetImage('assets/images/img.png'),
                        fit: BoxFit.cover),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.teal,
                          blurRadius: 10
                      )
                    ]
            
            
                ),
                child: const Center(
                  child:  Text('Log In'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
