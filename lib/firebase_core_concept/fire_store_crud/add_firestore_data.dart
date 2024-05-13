import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_roadmap/firebase_core_concept/utils/utils.dart';
import 'package:flutter_roadmap/firebase_core_concept/widgets/round_button.dart';

class AddFireStoreData extends StatefulWidget {
  const AddFireStoreData({super.key});

  @override
  State<AddFireStoreData> createState() => _AddFireStoreDataState();
}

class _AddFireStoreDataState extends State<AddFireStoreData> {
  bool loading = false;
  final postController = TextEditingController();
  final fireStore = FirebaseFirestore.instance.collection('Users');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add FireStore Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: postController,
              maxLines: 4,
              decoration: InputDecoration(
                  hintText: 'What is in your mind',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(
              height: 30,
            ),
            RoundButton(title: 'Add', loading: loading, onTap: () {
              setState(() {
                loading = true;
              });
              String id = DateTime.now().millisecondsSinceEpoch.toString();
              fireStore.doc(id).set({
                'title': postController.text.toString(),
                'Id': id,

    }).then((value) {
      setState(() {
        loading = false;
      });
      Utils.toastMessage('post added');

    }).onError((error, stackTrace){
      setState(() {
        loading = false;
      });
      Utils.toastMessage(error.toString());
    });

              }),


          ],
        ),
      ),
    );
  }

}
