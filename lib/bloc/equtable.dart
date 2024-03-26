import 'package:bloc_basic/model/user.dart';
import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';

class EqutableTesting extends StatefulWidget {
  const EqutableTesting({super.key});

  @override
  State<EqutableTesting> createState() => _EqutableTestingState();
}

class _EqutableTestingState extends State<EqutableTesting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        User user = const User(userId: 12, name: 'Sharif', email: 'sharifdu44@gmail.com');
        User user1 = const User(userId: 12, name: 'Sharif', email: 'sharifdu44@gmail.com');
        print(user.hashCode.toString());
        print(user1.hashCode.toString());
        print(user== user1);
        print(user == user);
        print(user.name);
        /*Person person = const Person(name: 'Rahat', age: 25);
        Person person1 = const Person(name: 'Rahat', age: 25);
        print(person.hashCode.toString());
        print(person1.hashCode.toString());
        print(person == person1);*/
      }),
    );
  }
}
