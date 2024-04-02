
import 'package:bloc_basic/bloc/counter/counter_state.dart';
import 'package:equatable/equatable.dart';

class ArithmeticState extends Equatable{
  final int firstNumber;
  final int secondNumber;


  const ArithmeticState({
     this.firstNumber = 5,
     this.secondNumber = 6,

});
  ArithmeticState copyWith({int? firstNumber, int? secondNumber}){
    return ArithmeticState(
        firstNumber: firstNumber?? this.firstNumber,
        secondNumber: secondNumber?? this.secondNumber);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [firstNumber, secondNumber];

}
