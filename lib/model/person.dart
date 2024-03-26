
import 'package:equatable/equatable.dart';

class Person extends Equatable{
  final String name;
  final int age;

  const Person({required this.name, required this.age});

  @override
  List<Object?> get props =>  [name, age ];

/*@override
  bool operator ==(Object other){
    return identical(this, other) ||
        other is Person &&
            runtimeType == other.runtimeType &&
            name == other.name &&
            age == other.age;

  }
  @override
  int get hashCode => name.hashCode ^ age.hashCode;*/
}