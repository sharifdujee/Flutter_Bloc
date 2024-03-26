import 'package:bloc_basic/bloc/switch_example/switch_bloc.dart';
import 'package:bloc_basic/bloc/switch_example/switch_event.dart';
import 'package:bloc_basic/bloc/switch_example/switch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchExampleScreen extends StatefulWidget {
  const SwitchExampleScreen({super.key});

  @override
  State<SwitchExampleScreen> createState() => _SwitchExampleScreenState();
}

class _SwitchExampleScreenState extends State<SwitchExampleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example Two'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Notification'),
                  const SizedBox(
                    width: 70,
                  ),
                  BlocBuilder<SwitchBloc, SwitchStates>(
                    buildWhen: (previous, current)=> previous.isSwitch != current.isSwitch,
                      builder: (context, state) {
                    return Switch(
                        value: state.isSwitch,
                        onChanged: (newValue) {
                          print('notification');
                          context
                              .read<SwitchBloc>()
                              .add(EnableOrDisableNotification());
                        });
                  })
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              BlocBuilder<SwitchBloc, SwitchStates>(
                  buildWhen: (previous, current)=> previous.slider != current.slider,
                  builder: (context, state) {
                print('slider');
                return Container(
                  height: 200,
                  color: Colors.red.withOpacity(state.slider),
                );
              }),
              const SizedBox(
                height: 50,
              ),
              BlocBuilder<SwitchBloc, SwitchStates>(builder: (context, state) {
                return Slider(
                    value: state.slider,
                    onChanged: (value) {
                      context
                          .read<SwitchBloc>()
                          .add(SliderEvent(slider: value));
                    });
              })
            ]),
      ),
    );
  }
}
