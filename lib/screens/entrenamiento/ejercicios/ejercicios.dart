import 'package:calistenia_app/constant.dart';
import 'package:calistenia_app/screens/entrenamiento/rutinas/rutinasDificil.dart';
import 'package:calistenia_app/screens/entrenamiento/rutinas/rutinasFacil.dart';
import 'package:calistenia_app/screens/entrenamiento/rutinas/rutinasIntermedio.dart';

import 'package:flutter/material.dart';

class Ejercicios extends StatefulWidget {
  Ejercicios({Key? key}) : super(key: key);

  @override
  _EjerciciosState createState() => _EjerciciosState();
}

class _EjerciciosState extends State<Ejercicios> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: contentColorLightTheme,
        appBar: AppBar(
          title: Text('Nivel Ejercicio'),
        ),
        body: ListView(
          children: <Widget>[
            titulo(context),
            cardEjerciciosFacil(context),
            cardEjerciciosIntermedio(context),
            cardEjerciciosAvanzado(context)
          ],
        ));
  }
}

Widget cardEjerciciosFacil(BuildContext context) {
  return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      margin: EdgeInsets.all(30),
      elevation: 10,
      clipBehavior: Clip.hardEdge,
      child: ClipRRect(
        child: Column(
          children: <Widget>[
            Ink.image(
                image: AssetImage('assets/images/rutinas.jpg'),
                height: 200,
                //width: 200,
                fit: BoxFit.cover,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RutinasFacil()),
                    );
                  },
                )),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text('Fácil'),
            ),
          ],
        ),
      ));
}

Widget cardEjerciciosIntermedio(BuildContext context) {
  return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.all(30),
      elevation: 10,
      child: ClipRRect(
        child: Column(
          children: <Widget>[
            Ink.image(
                image: AssetImage('assets/images/rutinas.jpg'),
                height: 200,
                //width: 200,
                fit: BoxFit.cover,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RutinasIntermedio()),
                    );
                  },
                )),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text('Intermedio'),
            ),
          ],
        ),
      ));
}

Widget cardEjerciciosAvanzado(BuildContext context) {
  return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.all(30),
      elevation: 10,
      child: ClipRRect(
        child: Column(
          children: <Widget>[
            Ink.image(
                image: AssetImage('assets/images/rutinas.jpg'),
                height: 200,
                //width: 200,
                fit: BoxFit.cover,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RutinasDificil()),
                    );
                  },
                )),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text('Avanzado'),
            ),
          ],
        ),
      ));
}

Widget titulo(BuildContext context) {
  return Column(children: [
    Align(
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(
          'Selecciona la dificultad',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    ),
  ]);
}
