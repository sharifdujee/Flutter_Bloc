import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_roadmap/firebase_core_concept/crud_operation/add_post.dart';
import 'package:flutter_roadmap/firebase_core_concept/fire_store_crud/add_firestore_data.dart';
import 'package:flutter_roadmap/firebase_core_concept/ui/auth/login_screen.dart';
import 'package:flutter_roadmap/firebase_core_concept/utils/utils.dart';

class FireStoreScreen extends StatefulWidget {
  const FireStoreScreen({super.key});

  @override
  State<FireStoreScreen> createState() => _FireStoreScreenState();
}

class _FireStoreScreenState extends State<FireStoreScreen> {
  final _auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance.collection('Users').snapshots();
  CollectionReference reference = FirebaseFirestore.instance.collection('Users');
  final ref = FirebaseFirestore.instance.collection('Users');
  final editingController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.lightGreen,
        title: const Text(' FireStore  Post Screen'),
        actions: [
          IconButton(
              onPressed: () {
                _auth.signOut().then((value) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FireBaseLoginScreen()));
                }).onError((error, stackTrace) {
                  Utils.toastMessage(error.toString());
                });
              },
              icon: const Icon(Icons.logout)),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          StreamBuilder<QuerySnapshot>(
              stream: fireStore,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Column(
                    children: [
                      CircularProgressIndicator(),
                      Text('please wait')
                    ],
                  );
                }
                if(snapshot.hasError){
                  return Text('Some error');
                }
                return Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: (){
                              reference.doc(snapshot.data!.docs[index]['Id'].toString()).update({
                                'title': 'I am not good in flutter'
                              }).then((value){
                                Utils.toastMessage('user updated');

                              }).onError((error, stackTrace){
                                Utils.toastMessage(error.toString());
                              });
                              reference.doc(snapshot.data!.docs[index]['Id'].toString()).delete();
                            },
                            title: Text(snapshot.data!.docs[index]['Id'].toString()),
                            subtitle: Text(snapshot.data!.docs[index]['title'].toString()),
                          );
                        }));
              }),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddFireStoreData()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> showMyDialog(String title, String id) async {
    editingController.text = title;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Update'),
            content: Container(
              child: TextField(
                controller: editingController,
                decoration: InputDecoration(hintText: 'Edit'),
              ),
            ),
          );
        });
  }
}
