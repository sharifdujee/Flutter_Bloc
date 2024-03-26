
import 'package:equatable/equatable.dart';

class ToDoState extends Equatable{
  final List<String> todosList;
  const ToDoState({
    this.todosList = const  []
});
  ToDoState copyWith({List<String>? todoList}){
    return ToDoState(
      todosList: todoList?? this.todosList
    );
}

  @override
  List<Object> get props => [todosList];
}