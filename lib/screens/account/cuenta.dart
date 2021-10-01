import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
//import 'package:image_picker/image_picker.dart';

class Cuenta extends StatefulWidget {
  Cuenta({Key? key}) : super(key: key);

  @override
  _CuentaState createState() => _CuentaState();
}

class _CuentaState extends State<Cuenta> {
  String nombreUsuario = 'Xaviera Arias';
  bool _isHidden = true;
  late PickedFile _imageFile;

  void takePhoto(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    setState(() {
      _imageFile = pickedFile as PickedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Mi Cuenta"),
          automaticallyImplyLeading: false,
          centerTitle: true),
      body: ListView(children: <Widget>[
        Container(
          margin: const EdgeInsets.all(10.0),
          child: avatar(context),
          padding: const EdgeInsets.all(8.0),
          // color: Colors.black,
        ),
        Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
              Text('$nombreUsuario', style: TextStyle(fontSize: 40)),
            ])),
        SizedBox(
          height: 20,
        ),
        formulario(context),
      ]),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  Widget formulario(BuildContext context) {
    return Column(children: <Widget>[
      TextField(
        obscureText: _isHidden,
        onChanged: (value) {},
        decoration: InputDecoration(
          filled: true,
          labelText: 'Nueva contraseña',
          suffixIcon: InkWell(
            onTap: _togglePasswordView,
            child: Icon(
              _isHidden ? Icons.visibility : Icons.visibility_off,
              color: Colors.white,
            ),
          ),
          //  controller: _actualizaController,
        ),
      ),
      SizedBox(
        height: 16,
      ),
      TextField(
        decoration: InputDecoration(
          filled: true,
          labelText: 'Confirmar contraseña',
          suffixIcon: InkWell(
            onTap: _togglePasswordView,
            child: Icon(
              _isHidden ? Icons.visibility : Icons.visibility_off,
              color: Colors.white,
            ),
          ),
        ),
        obscureText: true,
      ),
// spacer
      SizedBox(height: 50.0),

      ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.orange),
        child: Text('Guardar'),
        onPressed: () {
          //  _actualizaController.clear();
          // _confirmaController.clear();
        },
      )
    ]);
  }

  Widget avatar(BuildContext context) {
    return Center(
        child: Stack(children: <Widget>[
      CircleAvatar(
        radius: 80,
        backgroundImage: AssetImage("assets/images/rutinas.jpg"),
      ),
      Positioned(
          bottom: 20.0,
          right: 20.0,
          child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: ((builder) => bottomSheet(context)),
                );
              },
              child: Icon(
                Icons.camera_alt,
                color: Colors.orange,
                size: 28,
              ))),
    ]));
  }

  Widget avatar2() {
    return Center(
      child: Stack(children: <Widget>[
        CircleAvatar(
          radius: 80.0,
          backgroundImage: AssetImage("assets/images/rutinas.jpg"),
        ),
        Positioned(
          bottom: 20.0,
          right: 20.0,
          child: InkWell(
            onTap: () {},
            child: Icon(
              Icons.camera_alt,
              color: Colors.teal,
              size: 28.0,
            ),
          ),
        ),
      ]),
    );
  }

  Widget bottomSheet(BuildContext context) {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            TextButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }
}
