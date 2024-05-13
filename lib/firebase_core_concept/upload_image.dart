import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_roadmap/firebase_core_concept/ui/auth/login_screen.dart';
import 'package:flutter_roadmap/firebase_core_concept/utils/utils.dart';
import 'package:flutter_roadmap/firebase_core_concept/widgets/round_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({super.key});

  @override
  State<UploadImageScreen> createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  bool loading = false;
  File? _image;
  final _picker = ImagePicker();
  firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
  DatabaseReference reference = FirebaseDatabase.instance.ref('Post');
  final _auth = FirebaseAuth.instance;

  Future getImageGallery() async{
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    setState(() {
      if(pickedFile !=null){
        _image = File(pickedFile.path);

      }
      else{
        print('no image selected');
      }

    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        title: const Text('upload image'),
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

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: InkWell(
                onTap: (){
                  getImageGallery();

                },
                child:  _image != null ? Image.file(_image!.absolute) :Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Colors.lightGreen
                    )
                  ),
                  child: Center(
                    child: Icon(
                      Icons.image

                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            RoundButton(title: 'Upload', loading: loading, onTap: () async{
              setState(() {
                loading = true;
              });
              // /user + for override
              // /user/ new upload
              firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance.ref('/User/' + DateTime.now().millisecondsSinceEpoch.toString());
              firebase_storage.UploadTask uploadTask = ref.putFile(_image!.absolute);
              await Future.value(uploadTask).then((value) async{
                var newUrl =  await ref.getDownloadURL();
                reference.child('1').set({
                  'id' : '1212',
                  'title': newUrl.toString()
                }).then((value){
                  setState(() {
                    loading = false;
                  });
                  Utils.toastMessage('Uploaded');

                }).onError((error, stackTrace){
                  setState(() {
                    loading = false;
                  });
                  Utils.toastMessage(error.toString());

                });

              });






            })

          ],
        ),
      ),
    );
  }
}
