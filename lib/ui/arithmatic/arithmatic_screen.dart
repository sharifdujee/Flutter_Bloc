import 'package:bloc_basic/bloc/arithmatic/arithmetic_bloc.dart';
import 'package:bloc_basic/bloc/arithmatic/arithmetic_event.dart';
import 'package:bloc_basic/bloc/arithmatic/arithmetic_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArithmeticScreen extends StatefulWidget {
  const ArithmeticScreen({super.key});

  @override
  State<ArithmeticScreen> createState() => _ArithmeticScreenState();
}

class _ArithmeticScreenState extends State<ArithmeticScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Arithmetic Function'),
      ),
      body: BlocBuilder<ArithmeticBloc, ArithmeticState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Center(
              child: Column(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      context
                          .read<ArithmeticBloc>()
                          .add(IncrementEvent(incrementValue: 5));
                      //print(context.read<ArithmeticBloc>().add(IncrementEvent(incrementValue: 5)));
                    },
                    label: const Text('Summation'),
                    icon: const Icon(Icons.add_circle),
                  ),
                  ElevatedButton.icon(
                      onPressed: () {
                        context
                            .read<ArithmeticBloc>()
                            .add(DecrementEvent(decrementValue: 2));
                      },
                      icon: const Icon(Icons.remove_circle),
                      label: const Text('Subtraction')),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      '${state.firstNumber}',
                      style: const TextStyle(
                          color: Colors.greenAccent,
                          fontWeight: FontWeight.w600,
                          fontSize: 30),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
/*
import 'package:bloc_basic/bloc/todo/to_do_bloc.dart';
import 'package:bloc_basic/bloc/todo/to_do_event.dart';
import 'package:bloc_basic/bloc/todo/to_do_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Todo App',
        ),
      ),
      body: BlocBuilder<ToDoBloc, ToDoState>(
        builder: (context, state){
          if(state.todosList.isEmpty){
            return const Center(
              child: Text('No to do found') ,
            );
          }
          else if(state.todosList.isNotEmpty){
            return ListView.builder(
              itemCount: state.todosList.length,
              itemBuilder: ( context,index) {
                return ListTile(
                  title: Text(state.todosList[index]),
                  trailing: IconButton(onPressed: (){
                    context.read<ToDoBloc>().add(RemoveToDoEvent(task: state.todosList[index]));

                  }, icon: const Icon(Icons.delete)),

                );
              }, );

          }
          else{
            return const SizedBox();
          }

        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        for(int i = 0; i<20; i++){
          context.read<ToDoBloc>().add( AddToDoEvent(task: 'Task$i'));

        }

      },
      child: const Icon(Icons.add),),
    );
  }
}

 */
