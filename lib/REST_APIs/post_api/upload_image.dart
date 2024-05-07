import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_roadmap/basics/calcultor_app/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:http/http.dart' as http;

class ImageUploadScreen extends StatefulWidget {
  const ImageUploadScreen({super.key});

  @override
  State<ImageUploadScreen> createState() => _ImageUploadScreenState();
}

class _ImageUploadScreenState extends State<ImageUploadScreen> {
  File? image;
  final _picker = ImagePicker();
  bool showSpinner = false;
  Future getImage() async{
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if(pickedFile!=null){
      image = File(pickedFile.path);
      setState(() {

      });

    }
    else{
      print('no image selected');

    }
  }

  Future<void> uploadImage() async{
    setState(() {
      showSpinner = true;
    });
   var stream = new http.ByteStream(image!.openRead());
   stream.cast();
   var length = await image!.length();

   var uri = Uri.parse('https://fakestoreapi.com/products');

   var request = new http.MultipartRequest('POST', uri);
   request.fields['title'] = 'Static title';

   var multiPort = new http.MultipartFile('image', stream, length);

   request.files.add(multiPort);

   var response = await request.send();
   print(response.stream.toString());
   
   if(response.statusCode==200){
     setState(() {
       showSpinner = false;
     });
     print('image uploaded');
     
   }
   else{
     setState(() {
       showSpinner = false;
     });
     print('failed');
     
   }

  }
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(

      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('upload Image'),
        ),
        body: Column(
          children: [
            GestureDetector(
              onTap: (){
                getImage();
              },
              child: Container(
                child: image == null? Center(child: Text('Pick Image'),)
                        :Container(
                  child: Center(
                    child: Image.file(File(image!.path).absolute,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,),
                  ),

                ),

              ),
            ),
            SizedBox(
              height: 150,
            ),
            GestureDetector(
              onTap: (){
                uploadImage();
              },
              child: Container(
                width: 200,
                color: greenColor,
                child: Center(child: Text('Upload')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
