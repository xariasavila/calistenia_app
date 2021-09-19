import 'package:calistenia_app/screens/entrenamiento/ejercicios/ejercicios.dart';
import 'package:calistenia_app/screens/entrenamiento/rutinas/rutinas.dart';
import 'package:flutter/material.dart';

Widget cardEjercicios(BuildContext context) {
  return Card(
      color: Colors.blue.shade600,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.all(30),
      elevation: 10,
      child: ClipRRect(
        child: Column(
          children: <Widget>[
            Ink.image(
              height: 200,
              fit: BoxFit.cover,
              image: AssetImage('assets/images/ejercicios.jpg'),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Ejercicios()),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text('Ejercicios',
                  style: TextStyle(
                    fontSize: 18,
                  )),
            ),
          ],
        ),
      ));
}

Widget cardRutinas(BuildContext context) {
  return Card(
      color: Colors.blue.shade600,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.all(30),
      elevation: 10,
      child: ClipRRect(
        child: Column(
          children: <Widget>[
            Ink.image(
              height: 200,
              fit: BoxFit.cover,
              image: AssetImage('assets/images/rutina.jpg'),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Rutinas()),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text('Rutinas',
                  style: TextStyle(
                    fontSize: 18,
                  )),
            ),
          ],
        ),
      ));
}

Widget titulo() {
  return Column(children: [
    Align(
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(
          '¿Qué tipo de entrenamiento realizarás?',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    ),
  ]);
}

Widget dificultad() {
  return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(12.0),
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Colors.green),
          child: Text(
            "Facil",
            style: TextStyle(color: Colors.yellowAccent, fontSize: 25),
          ),
        ),
        Container(
          margin: EdgeInsets.all(15.0),
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Colors.green),
          child: Text(
            "Intermedio",
            style: TextStyle(color: Colors.yellowAccent, fontSize: 25),
          ),
        ),
        Container(
          margin: EdgeInsets.all(12.0),
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Colors.green),
          child: Text(
            "Dificil",
            style: TextStyle(color: Colors.yellowAccent, fontSize: 25),
          ),
        )
      ]);
}
