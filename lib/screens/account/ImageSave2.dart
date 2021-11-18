import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class ImageSave2 extends StatefulWidget {
  @override
  _ImageSave2State createState() => _ImageSave2State();
}

class _ImageSave2State extends State<ImageSave2> {
  File? image;
  final picker = ImagePicker();

  Future _getImage() async {
    final image = await ImagePicker()
        .pickImage(source: ImageSource.camera, maxWidth: 400, imageQuality: 50);

    if (image == null) return;

    final imagePermanent = await saveImagePermanently(image.path);
    setState(() => this.image = imagePermanent);
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final imageFile = File('${directory.path}/$name');

    return File(imagePath).copy(imageFile.path);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      title: 'ImagePicker - Save Image',
      home: Scaffold(
        appBar: AppBar(
          title: Text('ImagePicker - Save Image'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: image != null
                  ? Container(
                      height: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.file(
                          image!,
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('No Image found'),
                    ),
            ),
            ElevatedButton(
              child: Text('Capture and Store Image'),
              onPressed: _getImage,
            ),
          ],
        ),
      ),
    );
  }
}
