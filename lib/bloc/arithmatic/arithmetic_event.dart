
import 'package:equatable/equatable.dart';

abstract class ArithmeticEvent extends Equatable{

  @override
  List<Object> get props => [];
}

class IncrementEvent extends ArithmeticEvent{
  final int incrementValue;
  IncrementEvent({required this.incrementValue});
}

class DecrementEvent extends ArithmeticEvent{
  final int decrementValue;

  DecrementEvent({required this.decrementValue});
}