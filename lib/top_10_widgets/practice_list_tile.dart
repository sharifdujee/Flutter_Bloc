import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class PracticeListTile extends StatefulWidget {
  const PracticeListTile({super.key});

  @override
  State<PracticeListTile> createState() => _PracticeListTileState();
}

class _PracticeListTileState extends State<PracticeListTile> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('List Tile '),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,

        children: [

          Expanded(
            flex: 3,
            child: ListView.builder(
              itemCount: 50,
                itemBuilder: (context, index){
                  return  ListTile(
                    leading: const CircleAvatar(

                      child: Image(image: AssetImage('assets/images/sharif1.png'),
                        fit: BoxFit.cover,),
                    ),
                    title: Text('Sharif Hossain'),
                    subtitle: Text('Subscribe to My Channel'),
                    trailing: Text(DateTime.now().toString()),

                  );
            
                }
            
                ),
          ),

        ],
      ),
    );
  }
}
