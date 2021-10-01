import 'package:calistenia_app/screens/entrenamiento/rutinas/rutinasDificil.dart';
import 'package:calistenia_app/screens/entrenamiento/rutinas/rutinasFacil.dart';
import 'package:calistenia_app/screens/entrenamiento/rutinas/rutinasIntermedio.dart';
import 'package:flutter/material.dart';

class Rutinas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text('Nivel Rutinas'),
        ),
        body: ListView(
          //padding: EdgeInsets.all(6.0),
          children: <Widget>[
            titulo(context),
            cardRutinasFacil(context),
            cardRutinasIntermedio(context),
            cardRutinasAvanzado(context)
          ],
        ));
  }
}

Widget cardRutinasFacil(BuildContext context) {
  return Card(
      shadowColor: Colors.orange[600],
      color: Colors.green,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      clipBehavior: Clip.hardEdge,
      elevation: 5,
      margin: EdgeInsets.all(30),
      child: ClipRRect(
        child: Column(
          children: <Widget>[
            Ink.image(
                image: AssetImage('assets/images/rutina1.jpg'),
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
              child: Text('Rutina Fácil',
                  style: TextStyle(
                    fontSize: 18,
                  )),
            ),
          ],
        ),
      ));
}

Widget cardRutinasIntermedio(BuildContext context) {
  return Card(
      shadowColor: Colors.orange[600],
      color: Colors.orange,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.all(30),
      elevation: 10,
      child: ClipRRect(
        child: Column(
          children: <Widget>[
            Ink.image(
                image: AssetImage('assets/images/rutina2.jpg'),
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
              child: Text(
                'Rutina Intermedia',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ));
}

Widget cardRutinasAvanzado(BuildContext context) {
  return Card(
      shadowColor: Colors.orange[600],
      color: Colors.red,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.all(30),
      elevation: 10,
      child: ClipRRect(
        child: Column(
          children: <Widget>[
            Ink.image(
                image: AssetImage('assets/images/rutina3.jpg'),
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
              child: Text('Rutina Avanzada',
                  style: TextStyle(
                    fontSize: 18,
                  )),
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
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
    ),
  ]);
}
