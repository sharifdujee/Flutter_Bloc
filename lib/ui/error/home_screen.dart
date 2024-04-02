/*

import 'package:bloc_basic/model/person_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PersonModel> personList = [


  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var data = [
      {
        'name': 'Sharif Hossain'

      },
      {
        'name': null,

      },
      {
        'name': 'Rohan'

      },

    ];
    for(int i = 0; i<data.length; i++){
      personList.add(PersonModel.fromJson(data[i]));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: personList.length,
            itemBuilder: (context, index){
            return ListTile(
              title: Text(personList[index].name??''),
            );
        }),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        //PersonModel personModel = PersonModel(name: 'Md Sharif Hossain');
        //PersonModel personModel1 = PersonModel(name: 'Md Sharif Hossain');
        Map<String, dynamic> data = {
          'name': null,

        };
        PersonModel model = PersonModel.fromJson(data);
        print('value ' + model.name.toString());
       model =  model.copyWith(name: 'new Value');
        print( 'new value is '+model.name.toString());
       // print(personModel.name.toString());
        //print(personModel1.name.toString());
        //print(personModel1.hashCode);
       // print(personModel.hashCode);
        //print(personModel1 == personModel);
      }),
    );
  }
}

*/
