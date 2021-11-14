import 'package:calistenia_app/controllers/filtroEjercicio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EjerciciosIntermedio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('EJERCICIOS FÁCILES'),
      ),
      body: bodyEjercicio(),
    );
  }
}

Widget bodyEjercicio() {
  return FiltroEjercicio();
}
