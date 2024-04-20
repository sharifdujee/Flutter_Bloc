import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,

        //TimePickerScreen(),
        home: Scaffold(
          //backgroundColor: Colors.teal,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.blueGrey,
            leading: const Icon(Icons.accessibility),
            title: const Text(
              'Research Hacks',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  decoration: TextDecoration.lineThrough),
            ),
          ),
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'Md Sharif Hossain',
                    ),
                    Icon(Icons.ac_unit),
                    Text('Subscribe Me')
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.pink,
                  child: const Center(child: Text('Container 1')),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.blue,
                  child: const Center(child: Text('Container 2')),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.teal,
                  child: const Center(child: Text('Container 3')),
                ),
              ],
            ),
          ),
          /* body: Center(
            child: Container(
              margin: const EdgeInsets.all(10.0),
              color: Colors.amber[600],
              width: 100,
              height: 100,
              child: const Center(child: Text('Container')),
            ),
          ),*/
          /*body: const Center(
            //child: Text('Hello World'),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
              */ /*  Expanded(
                    child: Image(image: AssetImage('assets/images/img.png'))),
                SizedBox(
                  height: 5,
                ),*/ /*
               */ /* Expanded(
                    child:
                        Image(image: AssetImage('assets/images/sharif.png'))),
                SizedBox(
                  height: 5,
                ),*/ /*
                */ /*Expanded(
                    child:
                        Image(image: AssetImage('assets/images/sharif.png'))),
                SizedBox(
                  height: 5,
                ),
                Expanded(
                    child:
                        Image(image: AssetImage('assets/images/sharif.png'))),
                SizedBox(
                  height: 5,
                ),*/ /*
                Expanded(
                    child:
                        Image(image: AssetImage('assets/images/sharif.png'))),
              ],
            ),
          ),*/
        ));
  }
}
