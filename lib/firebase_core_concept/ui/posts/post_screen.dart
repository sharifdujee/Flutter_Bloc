import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_roadmap/firebase_core_concept/crud_operation/add_post.dart';
import 'package:flutter_roadmap/firebase_core_concept/ui/auth/login_screen.dart';
import 'package:flutter_roadmap/firebase_core_concept/utils/utils.dart';

class FireBasePostScreen extends StatefulWidget {
  const FireBasePostScreen({super.key});

  @override
  State<FireBasePostScreen> createState() => _FireBasePostScreenState();
}

class _FireBasePostScreenState extends State<FireBasePostScreen> {
  final _auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('Post');
  final searchFilter = TextEditingController();
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
        title: const Text('Firebase Post Screen'),
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
          /*Expanded(
              child: StreamBuilder(
                  stream: ref.onValue,
                  builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                    if (!snapshot.hasData) {
                      return const Column(
                        children: [
                          CircularProgressIndicator(),
                          Text('please wait')
                        ],
                      );
                    } else {
                      Map<dynamic, dynamic> map =
                          snapshot.data!.snapshot.value as dynamic;
                      List<dynamic> list = [];
                      list.clear();
                      list = map.values.toList();
                      return ListView.builder(
                          itemCount: snapshot.data!.snapshot.children.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(list[index]['title']),
                              subtitle: Text(list[index]['Id']),
                            );
                          });
                    }
                  })),*/
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              controller: searchFilter,
              decoration: const InputDecoration(
                  hintText: 'Search', border: OutlineInputBorder()),
              onChanged: (String value) {
                setState(() {});
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: FirebaseAnimatedList(
                query: ref,
                defaultChild: Text('Loading'),
                itemBuilder: (context, snapshot, animation, index) {
                  final title = snapshot.child('title').value.toString();

                  if (searchFilter.text.isEmpty) {
                    return ListTile(
                      subtitle: Text(snapshot.child('Id').value.toString()),
                      title: Text(snapshot.child('title').value.toString()),
                      trailing: PopupMenuButton(
                        icon: const Icon(Icons.more_vert),
                        itemBuilder: (context) => [
                           PopupMenuItem(
                              value: 1,
                              child: ListTile(
                                onTap: (){
                                  Navigator.pop(context);
                                  showMyDialog(title, snapshot.child('Id').value.toString());

                                },
                                leading: const Icon(Icons.edit),
                                title: const Text('Edit'),
                              ),
                          ),
                           PopupMenuItem(
                            value: 1,
                            child: ListTile(
                              onTap: (){
                                Navigator.pop(context);
                                ref.child(snapshot.child('Id').value.toString()).remove();
                              },
                              leading: const Icon(Icons.delete),
                              title: const Text('Delete'),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (title.toLowerCase().contains(
                      searchFilter.text.toLowerCase().toLowerCase())) {
                    return ListTile(
                      subtitle: Text(snapshot.child('Id').value.toString()),
                      title: Text(snapshot.child('title').value.toString()),
                      trailing: PopupMenuButton(
                        icon: const Icon(Icons.more_vert),
                        itemBuilder: (context) => [],
                      ),
                    );
                  } else {
                    return Container();
                  }
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddPostScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
  Future<void> showMyDialog(String title, String id) async{
    editingController.text = title;
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text('Update'),
        content: Container(
          child: TextField(
            controller: editingController,
            decoration: InputDecoration(
              hintText: 'Edit'
            ),

          ),
        ),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text('Cancel')),
          TextButton(onPressed: (){
            Navigator.pop(context);
            ref.child(id).update({
              'title': editingController.text.toLowerCase()

            }).then((value){
              Utils.toastMessage('Post updated');

            }).onError((error, stackTrace){
              Utils.toastMessage(error.toString());
            });
          }, child: const Text('Update')),

        ],

      );

    });
  }
}
