import 'package:calistenia_app/controllers/filtroEvento.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Eventos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        shadowColor: Colors.deepOrange,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('EVENTOS CALISTENIA APP'),
      ),
      body: bodyEvento(),
    );
  }
}

Widget bodyEvento() {
  return FiltroEvento();
}

Widget titulo(BuildContext context) {
  return Column(children: [
    Align(
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(
          'Ultimos eventos Calistenia Chile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
    ),
  ]);
}
