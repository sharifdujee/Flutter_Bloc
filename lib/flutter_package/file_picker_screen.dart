import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FilePickerScreen extends StatefulWidget {
  const FilePickerScreen({super.key});

  @override
  State<FilePickerScreen> createState() => _FilePickerScreenState();
}

class _FilePickerScreenState extends State<FilePickerScreen> {
  String? _fileName;
  File? _file;
  VideoPlayerController? _videoPlayerController;
  AudioPlayer? _audioPlayer;
  bool _isPlaying = false;

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    _audioPlayer?.dispose();
    super.dispose();
  }

  Future<void> pickSingleFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        _file = File(result.files.single.path!);
        _fileName = result.files.single.name;
        _initializeFile();
      });
    }
  }

  void _initializeFile() {
    final fileExtension = _fileName!.split('.').last.toLowerCase();
    if (['mp4', 'mov', 'avi'].contains(fileExtension)) {
      _videoPlayerController = VideoPlayerController.file(_file!)
        ..initialize().then((_) {
          setState(() {});
          _videoPlayerController!.play();
        });
    } else if (['mp3', 'wav', 'aac'].contains(fileExtension)) {
      _audioPlayer = AudioPlayer();
      _audioPlayer!.play(_file!.path as Source,);
      setState(() {
        _isPlaying = true;
      });
    } else {
      _videoPlayerController = null;
      _audioPlayer = null;
    }
  }

  Widget _buildFileDisplay() {
    if (_file != null) {
      final fileExtension = _fileName!.split('.').last.toLowerCase();
      if (['jpg', 'jpeg', 'png', 'gif'].contains(fileExtension)) {
        return Image.file(
          _file!,
          width: 200,
          height: 200,
          fit: BoxFit.cover,
        );
      } else if (['mp4', 'mov', 'avi'].contains(fileExtension)) {
        return _videoPlayerController != null && _videoPlayerController!.value.isInitialized
            ? Container(
          width: 300,
          height: 300,
          child: AspectRatio(
            aspectRatio: _videoPlayerController!.value.aspectRatio,
            child: VideoPlayer(_videoPlayerController!),
          ),
        )
            : const Center(child: CircularProgressIndicator());
      } else if (['mp3', 'wav', 'aac'].contains(fileExtension)) {
        return Container(
          width: 200,
          height: 50,
          color: Colors.grey[200],
          child: Row(
            children: [
              IconButton(
                icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
                onPressed: () {
                  if (_isPlaying) {
                    _audioPlayer!.pause();
                  } else {
                    _audioPlayer!.play(_file!.path as Source,);
                  }
                  setState(() {
                    _isPlaying = !_isPlaying;
                  });
                },
              ),
              Text('Playing: $_fileName'),
            ],
          ),
        );
      } /*else if (fileExtension == 'pdf') {
        return Container(
          width: 300,
          height: 400,
          child: PDF.file(
            _file!,
            height: 400,
            width: 300,
          ),
        );
      }*/ else {
        return Container(
          width: 200,
          height: 200,
          color: Colors.grey[200],
          child: Center(
            child: Text(
              'Selected file: $_fileName',
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        );
      }
    } else {
      return Container(
        width: 200,
        height: 200,
        color: Colors.grey[200],
        child: const Center(
          child: Text(
              'No file selected',

              style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
  }

  // upload Multiple File



  Future<void> uploadMultipleFile() async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if(result != null){
      List<File> files = result.paths.map((path) => File(path!)).toList();
    }

  }

  // saveFile
  Future<void> saveFile () async{
    String? outputFile = await FilePicker.platform.saveFile(
        dialogTitle: 'Please select an output file',
        fileName: 'output-file.pdf'

    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('File Picker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: pickSingleFile,
              child: const Text('Pick a file'),
            ),
            const SizedBox(height: 20),
            _buildFileDisplay(),
          ],
        ),
      ),
    );
  }
}