import 'package:calistenia_app/controllers/filtroNoticia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Noticias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        shadowColor: Colors.deepOrange,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('NOTICIAS CALISTENIA APP'),
      ),
      body: bodyNoticias(),
    );
  }
}

Widget bodyNoticias() {
  return FiltroNoticia();
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
