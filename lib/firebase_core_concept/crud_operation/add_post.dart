import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_roadmap/firebase_core_concept/utils/utils.dart';
import 'package:flutter_roadmap/firebase_core_concept/widgets/round_button.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  bool loading = false;
  final databaseRef = FirebaseDatabase.instance.ref('Post');
  final postController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Post'),
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
              databaseRef.child(id).set({
                'title': postController.text.toString(),
                'Id': id,

              }).then((value){
                Utils.toastMessage('post added');
                setState(() {
                  loading = false;
                });

              }).onError((error, stackTrace){
                Utils.toastMessage(error.toString());
                setState(() {
                  loading = false;
                });
              });
            })
          ],
        ),
      ),
    );
  }

}
