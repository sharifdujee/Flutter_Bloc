
import 'package:bloc/bloc.dart';
import 'package:bloc_basic/bloc/arithmatic/arithmetic_event.dart';
import 'package:bloc_basic/bloc/arithmatic/arithmetic_state.dart';

class ArithmeticBloc extends Bloc<ArithmeticEvent, ArithmeticState>{
  ArithmeticBloc (): super(const ArithmeticState()){
    on<IncrementEvent> (_summation);
    on<DecrementEvent> (_subtraction);

  }

  void _summation(IncrementEvent event, Emitter<ArithmeticState> emitter){
    int sum = event.incrementValue + state.firstNumber  + state.secondNumber;
    emitter(state.copyWith(firstNumber: sum, secondNumber: state.secondNumber));
  }

  void _subtraction(DecrementEvent event , Emitter<ArithmeticState> emitter){
    int difference = state.firstNumber - event.decrementValue - state.secondNumber;
    emitter(state.copyWith(firstNumber: difference, secondNumber: state.secondNumber));
  }
}

