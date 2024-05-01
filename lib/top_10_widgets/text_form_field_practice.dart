import 'package:flutter/material.dart';
class PracticeTextFormField extends StatefulWidget {
  const PracticeTextFormField({super.key});

  @override
  State<PracticeTextFormField> createState() => _PracticeTextFormFieldState();
}

class _PracticeTextFormFieldState extends State<PracticeTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Text Form Field'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              keyboardType: TextInputType.text,
              cursorColor: Colors.green,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black
              ),
              decoration: InputDecoration(
                fillColor: Colors.green.withOpacity(0.2),
                //filled: true,
                prefixIcon: const Icon(Icons.alternate_email),
                icon: const Icon(Icons.add),
                suffixIcon: const Icon(Icons.visibility),
                hintText: 'Email',
                labelText: 'Email',
                hintStyle: const TextStyle(
                  fontSize: 14,
                  color: Colors.red,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.yellow,
                    width: 2,

                  ),
                  borderRadius: BorderRadius.circular(10)

                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.green,
                    width: 2
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Colors.red,
                    width: 5
                  )
                )
              ),
              onChanged: (value){
                //print(value);

              },

            ),
          ),
        ],
      ),
    );
  }
}
