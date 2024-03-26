
import 'package:bloc/bloc.dart';
import 'package:bloc_basic/bloc/todo/to_do_event.dart';
import 'package:bloc_basic/bloc/todo/to_do_state.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState>{
  final List<String> todoList = [];
  ToDoBloc(): super(const ToDoState()){
    on<AddToDoEvent> (_addToDoEvent);
    on<RemoveToDoEvent>(_removeToDo);
  }
  void _addToDoEvent(AddToDoEvent event, Emitter<ToDoState> emitter){
    todoList.add(event.task);
    emitter(state.copyWith(todoList: List.from(todoList)));
    
  }
  void _removeToDo(RemoveToDoEvent event, Emitter<ToDoState> emitter){
    todoList.remove(event.task);
    emitter(state.copyWith(todoList: List.from(todoList)));
  }

}