import 'dart:io';

import 'package:bloc_basic/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_basic/bloc/image_picker/image_picker_event.dart';
import 'package:bloc_basic/bloc/image_picker/image_picker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Image picker Bloc'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 300),
          child: Column(
            children: [
              BlocBuilder<ImagePickerBloc, ImagePickerState>(
                builder: (context, state){
                  if(state.file == null){
                    return InkWell(
                      onTap: (){
                        context.read<ImagePickerBloc>().add(CameraCapture());

                      },
                      child: const CircleAvatar(
                        child: Icon(Icons.camera),
                      ),

                    );
                  }
                  else{
                    return Image.file(File(state.file!.path.toString()));
                  }

                },
              ),
              const SizedBox(
                height: 100,
              ),
              BlocBuilder<ImagePickerBloc, ImagePickerState>(
                builder: (context, state){
                  if(state.file == null){
                    return InkWell(
                      onTap: (){
                        context.read<ImagePickerBloc>().add(GalleryImagePicker());

                      },
                      child: const CircleAvatar(
                        child: Icon(Icons.browse_gallery),
                      ),

                    );
                  }
                  else{
                    return Image.file(File(state.file!.path.toString()));
                  }

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
