import 'package:bloc_basic/bloc/counter_bloc.dart';
import 'package:bloc_basic/event/counter_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /*Center(
              child: BlocBuilder<CounterBloc, int>(
                builder: (context, count) {
                  return Text(
                    '$count',
                    style: Theme.of(context).textTheme.headline1,
                  );
                },
              ),
            ),*/
            const SizedBox(height: 20),
            _button(),
          ],
        ),
      ),
    );
  }

  Widget _button() {
    return Padding(
      padding: const EdgeInsets.only(left: 50, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton.icon(
            onPressed: (){},

            icon: const Icon(Icons.add),
            label: const Text('Add'),
          ),
          const SizedBox(width: 15),
          ElevatedButton.icon(
            onPressed: (){},

            icon: const Icon(Icons.remove),
            label: const Text('Remove'),
          ),
        ],
      ),
    );
  }
  void _printCount() {
    //final currentState = context.read<CounterBloc>().state;
   // print('Current count: ${currentState.counter}');
  }
}
