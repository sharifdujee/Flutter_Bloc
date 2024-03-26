import 'package:bloc_basic/bloc/practice_counter/counter_bloc.dart';
import 'package:bloc_basic/bloc/practice_counter/counter_event.dart';
import 'package:bloc_basic/bloc/practice_counter/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PracticeCounterScreen extends StatefulWidget {
  const PracticeCounterScreen({super.key});

  @override
  State<PracticeCounterScreen> createState() => _PracticeCounterScreenState();
}

class _PracticeCounterScreenState extends State<PracticeCounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practice Counter Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state){
                return Center(
                  child: Text(state.counter.toString(),
                  style: const TextStyle(fontSize: 60),),
                );
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                context.read<CounterBloc>().add(IncrementEvent());
              },
                  child: const Text('Add')),
              const SizedBox(width: 20,),
              ElevatedButton(onPressed: (){
                context.read<CounterBloc>().add(DecrementEvent());
              },
                  child: const Text('Remove')),

            ],
          )
        ],
      ),
    );
  }
}
/*
Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
            return Center(
                child: Text(
              state.counter.toString(),
              style: const TextStyle(fontSize: 60),
            ));
          }
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                  onPressed: () {
                    context.read<CounterBloc>().add(IncrementCounter());
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Increment')),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    context.read<CounterBloc>().add(DecrementCounter());
                  },
                  icon: const Icon(Icons.remove),
                  label: const Text('Decrement')),
            ],
          ),
        ],
      ),
    );
  }
 */