import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';

import 'dart:io';
import 'package:image_picker/image_picker.dart';

class Cuenta4 extends StatefulWidget {
  @override
  _Cuenta4State createState() => _Cuenta4State();
}

class _Cuenta4State extends State<Cuenta4> {
  var image;

  @override
  void initState() {
    super.initState();

    _getAppDir.then((value) {
      setState(() => image = '$value/eje1.jpg');
    });
  }

  get _getAppDir async {
    final appDir = await getApplicationDocumentsDirectory();

    return appDir.path;
  }

  void _uploadImage() async {
    ImagePicker picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    File file = File(pickedImage!.path);

    final savedImage = await file.copy('$_getAppDir/eje1.jpg');

    setState(() => image = savedImage.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: image != null ? Image.file(File(image)) : null),
      floatingActionButton: FloatingActionButton(
        onPressed: _uploadImage,
        tooltip: 'Increment',
        child: Icon(Icons.image),
      ),
    );
  }
}
