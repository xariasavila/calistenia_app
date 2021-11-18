import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Cuenta5 extends StatefulWidget {
  @override
  _Cuenta5State createState() => _Cuenta5State();
}

class _Cuenta5State extends State<Cuenta5> {
  var _image;

  Future camaraImage() async {
    XFile? image = await ImagePicker()
        .pickImage(source: ImageSource.camera, maxWidth: 400, imageQuality: 50);

    setState(() {
      _image = File(image!.path);
    });
  }

  Future galleryImage() async {
    XFile? image = await ImagePicker().pickImage(
        source: ImageSource.gallery, maxWidth: 400, imageQuality: 50);

    setState(() {
      _image = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 500,
            width: double.infinity,
            color: Colors.blue,
            child: _image == null
                ? Center(child: Text('No Image Selected'))
                : Image.file(
                    _image,
                    width: 200.0,
                    height: 200.0,
                    fit: BoxFit.fitHeight,
                  ),
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: () {
                  camaraImage();
                },
                child: Icon(Icons.camera),
              ),
              SizedBox(
                width: 50,
              ),
              FloatingActionButton(
                onPressed: () {
                  galleryImage();
                },
                child: Icon(Icons.photo_library),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
