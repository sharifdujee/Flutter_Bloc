
import 'package:equatable/equatable.dart';

class User extends Equatable{
  final int userId;
  final String name;
  final String email;

  const User({
    required this.userId,
    required this.name,
    required this.email
  });
  @override
  List<Object?> get props => [userId, name, email];
/*@override
  bool operator == (Object other){
    return identical(this, other) ||
    other is User &&
    runtimeType == other.runtimeType &&
    userId == other.userId &&
    name == other.name &&
    email == other.email;
  }

  @override
  int get hashCode => userId.hashCode ^ name.hashCode ^ email.hashCode;*/
}

