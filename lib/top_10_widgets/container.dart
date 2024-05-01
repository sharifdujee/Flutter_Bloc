
import 'package:flutter/material.dart';

class ColumnWidget extends StatefulWidget {
  const ColumnWidget({super.key});

  @override
  State<ColumnWidget> createState() => _ColumnWidgetState();
}

class _ColumnWidgetState extends State<ColumnWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Column Widget'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget> [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Center(
                  child: Container(
                    height: 250,
                
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
              const SizedBox(
                width: 20,
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Container(
                    height: 250,
                
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
              const SizedBox(
                width: 20,
              ),
              Expanded(
                flex: 3,
                child: Center(
                  child: Container(
                    height: 250,

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


          const SizedBox(
            height: 50,
          ),
          Column(
            children: [
              Center(
                child: Container(
                  height: 250,
                  width: 250,
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

            ],
          ),
          const SizedBox(
            height: 50,
          ),

         /* Column(

            children: [
              Center(
                child: Container(
                  height: 250,
                  width: 250,
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
                      image: DecorationImage(image: AssetImage('assets/images/img.png'),
                          fit: BoxFit.cover),
                      boxShadow: [
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
            ],
          ),*/

        ],
      ),
    );
  }
}
