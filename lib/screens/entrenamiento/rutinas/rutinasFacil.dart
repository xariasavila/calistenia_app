import 'package:calistenia_app/screens/entrenamiento/ejercicios/ejerciciosFacil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RutinasFacil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('Rutinas Fácil'),
      ),
      body: buildPages(),
    );
  }
}

Widget buildPages() {
  return EjerciciosFacil();
}
