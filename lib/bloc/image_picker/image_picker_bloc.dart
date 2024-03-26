
import 'package:bloc_basic/bloc/image_picker/image_picker_event.dart';
import 'package:bloc_basic/bloc/image_picker/image_picker_state.dart';
import 'package:bloc_basic/utils/image_picker_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState>{
  final ImagePickerUtils imagePickerUtils;
  ImagePickerBloc(this.imagePickerUtils): super(const ImagePickerState()){
    on<CameraCapture> (cameraCapture);
    on<GalleryImagePicker>(galleryImagePicker);
  }

  void cameraCapture(CameraCapture cameraCapture, Emitter<ImagePickerState> emitter) async{
    XFile? file =  await imagePickerUtils.cameraCapture();
    emitter(state.copyWith(file: file));


  }
  void galleryImagePicker(GalleryImagePicker cameraCapture, Emitter<ImagePickerState> emitter) async{
    XFile? file =  await imagePickerUtils.pickImageFromGallery();
    emitter(state.copyWith(file: file));


  }
}