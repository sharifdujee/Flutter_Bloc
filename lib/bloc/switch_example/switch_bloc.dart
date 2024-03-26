
import 'package:bloc/bloc.dart';
import 'package:bloc_basic/bloc/switch_example/switch_event.dart';
import 'package:bloc_basic/bloc/switch_example/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvents, SwitchStates> {
  SwitchBloc(): super( const SwitchStates()){
    on<EnableOrDisableNotification>(_enableOrDisableNotification);
    on<SliderEvent> (_slider);

  }
  void _enableOrDisableNotification(EnableOrDisableNotification events, Emitter<SwitchStates> emitter){
    emitter(state.copyWith(isSwitch: !state.isSwitch));

  }
  void _slider(SliderEvent events, Emitter<SwitchStates> emitter){
    emitter(state.copyWith(slider: events.slider));

  }
}