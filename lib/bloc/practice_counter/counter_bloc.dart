import 'package:bloc/bloc.dart';
import 'package:bloc_basic/bloc/practice_counter/counter_event.dart';
import 'package:bloc_basic/bloc/practice_counter/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState>{
  CounterBloc() : super(const CounterState()){
    on<IncrementEvent> (_increment);
    on<DecrementEvent> (_decrement);

  }

  void _increment(IncrementEvent counter, Emitter<CounterState> emitter){
    emitter(state.copyWith(counter: state.counter +1));
  }
  void _decrement(DecrementEvent counter, Emitter<CounterState> emitter){
    emitter(state.copyWith(counter:  state.counter -1));
  }

}

/*
import 'package:bloc/bloc.dart';
import 'package:bloc_basic/bloc/counter/counter_event.dart';
import 'package:bloc_basic/bloc/counter/counter_state.dart';
class CounterBloc extends Bloc<CounterEvent, CounterState>{
  CounterBloc() :  super(const CounterState()){
    on<IncrementCounter>(_increment);
    on<DecrementCounter>(_decrement);

  }
  void _increment(IncrementCounter counter, Emitter<CounterState> emitter){
    emitter(state.copyWith(counter: state.counter +1));
  }
  void _decrement(DecrementCounter counter, Emitter<CounterState> emitter){
    emitter(state.copyWith(counter: state.counter -1));
  }
}
 */