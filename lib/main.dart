import 'dart:io';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  File? imagefile;

  Future pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image != null) {
      setState(
        () {
          imagefile = File(image.path);
          GallerySaver.saveImage(imagefile!.path, albumName: 'Myapp');
          // setState(() {});
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Camera'),
        ),
      ),
      body: imagefile == null
          ? Center(child: Text('Add a Image'))
          : Image.file(imagefile!),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pickImage(ImageSource.camera);
        },
        child: Icon(Icons.camera_enhance),
      ),
    );
  }
}
