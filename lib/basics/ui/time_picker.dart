import 'package:flutter/material.dart';

class TimePickerScreen extends StatefulWidget {
  const TimePickerScreen({super.key});

  @override
  State<TimePickerScreen> createState() => _TimePickerScreenState();
}

class _TimePickerScreenState extends State<TimePickerScreen> {
  final TextEditingController startAfterNoonController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Choose the time'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _timePicker(),
            const Divider(
              color: Colors.transparent,
            ),
            _afternoon(),
          ],
        ),
      ),
    );
  }

  Widget _timePicker() {
    return const Padding(
      padding: EdgeInsets.all(50.0),
      child: Column(
        children: <Widget>[
          Text('Morning'),
          Row(
            children: <Widget>[
              Text('From'),
              Flexible(
                  child: TimePickerDialog(
                      initialTime: TimeOfDay(hour: 06, minute: 00)))
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[
              Text('To'),
              Flexible(
                  child: TimePickerDialog(
                      initialTime: TimeOfDay(hour: 12, minute: 59)))
            ],
          ),
        ],
      ),
    );
  }

  Widget _afternoon() {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        children: <Widget>[
          const Text('After Noon'),
          Row(
            children: <Widget>[
              const Text('From'),
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const CheckTimePicker()));
                  },
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const CheckTimePicker()));
                    },
                    child: TextFormField(
                      controller: startAfterNoonController,
                      decoration: const InputDecoration(
                          labelText: 'Start Time', border: OutlineInputBorder()),
                    ),
                  ),
                ),
              ),
              const Flexible(
                  child: TimePickerDialog(
                      initialTime: TimeOfDay(hour: 3, minute: 00)))
            ],
          ),
          const Row(
            children: <Widget>[
              Text('To'),
              Flexible(
                  child: TimePickerDialog(
                      initialTime: TimeOfDay(hour: 6, minute: 59)))
            ],
          )
        ],
      ),
    );
  }

  dynamic _selectTheTime(){
    return Flexible(child: TimePickerDialog(initialTime: TimeOfDay(hour: 10, minute: 00)));
  }
}

class CheckTimePicker extends StatefulWidget {
  const CheckTimePicker({super.key});

  @override
  State<CheckTimePicker> createState() => _CheckTimePickerState();
}

class _CheckTimePickerState extends State<CheckTimePicker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text('To'),
                Flexible(
                    child: TimePickerDialog(
                        initialTime: TimeOfDay(hour: 6, minute: 59)))
              ],
            )

          ],
        ),
      ),
    );
  }
}

