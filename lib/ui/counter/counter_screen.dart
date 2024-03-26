

import 'package:bloc_basic/bloc/counter/counter_bloc.dart';
import 'package:bloc_basic/bloc/counter/counter_event.dart';
import 'package:bloc_basic/bloc/counter/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Example'),
      ),
      body: Column(
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
}
