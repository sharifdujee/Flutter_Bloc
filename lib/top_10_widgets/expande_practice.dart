import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListTileWidget extends StatefulWidget {
  const ListTileWidget({super.key});

  @override
  State<ListTileWidget> createState() => _ListTileWidgetState();
}

class _ListTileWidgetState extends State<ListTileWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'List Tile Widget',
          style: TextStyle(fontFamily: 'Pacifico'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            child: Stack(
              alignment: Alignment.centerRight,
              children: [

                Container(
                  height: 200,
                  width: 200,
                  color: Colors.red,
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    height: 180,
                    width: 180,
                    color: Colors.green,
                  ),
                ),
                const Positioned(

                    right: 100,
                    child:  Text('Md Sharif Hossain')),
              ],

            ),
          ),
          Stack(
            children: [

              Container(
                height: 90,
                width: 90,
                color: Colors.green,
              ),
              Container(
                height: 80,
                width: 80,
                color: Colors.blue,
              ),
            ],
          )
        ],
      ),
    );
  }
}
