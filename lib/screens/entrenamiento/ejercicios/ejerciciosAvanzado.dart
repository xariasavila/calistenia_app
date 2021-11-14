import 'package:calistenia_app/screens/entrenamiento/ejercicios/ejerciciosFacil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EjerciciosAvanzado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text('Ejercicios avanzados'),
      ),
      body: buildPages(),
    );
  }
}

Widget buildPages() {
  return EjerciciosFacil();
}
