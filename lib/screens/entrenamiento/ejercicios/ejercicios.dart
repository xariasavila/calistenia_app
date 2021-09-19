import 'package:calistenia_app/constant.dart';
import 'package:calistenia_app/screens/entrenamiento/ejercicios/ejerciciosAvanzado.dart';
import 'package:calistenia_app/screens/entrenamiento/ejercicios/ejerciciosIntermedio.dart';

import 'package:flutter/material.dart';

import 'ejerciciosFacil.dart';

class Ejercicios extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: contentColorLightTheme,
        appBar: AppBar(
          centerTitle: true,
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
      color: Colors.green,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
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
                      MaterialPageRoute(
                          builder: (context) => EjerciciosFacil()),
                    );
                  },
                )),
            Container(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: Text('Ejercicio fácil',
                    style: TextStyle(
                      fontSize: 18,
                    ))),
          ],
        ),
      ));
}

Widget cardEjerciciosIntermedio(BuildContext context) {
  return Card(
      color: Colors.orange,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
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
                          builder: (context) => EjerciciosIntermedio()),
                    );
                  },
                )),
            Container(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: Text('Ejercicio intermedio',
                    style: TextStyle(
                      fontSize: 18,
                    ))),
          ],
        ),
      ));
}

Widget cardEjerciciosAvanzado(BuildContext context) {
  return Card(
      color: Colors.red,
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
                          builder: (context) => EjerciciosAvanzado()),
                    );
                  },
                )),
            Container(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: Text('Ejercicio avanzado',
                    style: TextStyle(
                      fontSize: 18,
                    ))),
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
