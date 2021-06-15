import 'package:flutter/material.dart';

class Entrenamiento extends StatefulWidget {
  Entrenamiento({Key? key}) : super(key: key);

  @override
  _EntrenamientoState createState() => _EntrenamientoState();
}

class _EntrenamientoState extends State<Entrenamiento> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text("Trainign APP"),
    ));
  }
}
