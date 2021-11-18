import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Cuenta3 extends StatefulWidget {
  const Cuenta3({Key? key}) : super(key: key);

  @override
  State<Cuenta3> createState() => _Cuenta3State();
}

class _Cuenta3State extends State<Cuenta3> {
  File? imageFile;

  void _getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxHeight: 720,
      maxWidth: 720,
    );
    setState(() {
      imageFile = File(pickedFile!.path);
    });
  }

  void _getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 720,
      maxWidth: 720,
    );
    setState(() {
      imageFile = File(pickedFile!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                imageFile != null
                    ? Image.file(imageFile!)
                    : const Icon(
                        Icons.camera_alt,
                        size: 200,
                        color: Colors.green,
                      ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.green),
                      onPressed: () {
                        _getFromCamera();
                      },
                      child: Text('Get Image From Camera'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.red),
                      onPressed: () {
                        _getFromGallery();
                      },
                      child: Text('Get Image From Gallery'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
