import 'package:calistenia_app/screens/entrenamiento/ejercicios/ejercicios.dart';
import 'package:calistenia_app/screens/entrenamiento/rutinas/rutinas.dart';
import 'package:flutter/material.dart';

Widget cardRutinas(BuildContext context) {
  return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      margin: EdgeInsets.all(30),
      elevation: 10,
      child: ClipRRect(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(50),
        child: Column(
          children: <Widget>[
            Ink.image(
              height: 200,
              fit: BoxFit.fitWidth,
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
              child: Text('RUTINAS'),
            ),
          ],
        ),
      ));
}

Widget cardEjercicios(BuildContext context) {
  return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      margin: EdgeInsets.all(30),
      elevation: 10,
      child: ClipRRect(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(20),
        child: Column(
          children: <Widget>[
            Ink.image(
              image: NetworkImage(
                'https://i0.wp.com/blog.alexdevero.com/wp-content/uploads/2016/02/CalisthenicsWhy-It-Is-The-Best-Hobby-post.jpg?fit=1024%2C576&ssl=1',
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Ejercicios()),
                  );
                },
              ),
              height: 200,
              fit: BoxFit.fitWidth,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text('EJERCICIOS'),
            ),
          ],
        ),
      ));
}

Widget cardRutinasImage(BuildContext context) {
  return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      margin: EdgeInsets.all(30),
      elevation: 10,
      child: ClipRRect(
        clipBehavior: Clip.hardEdge,
        child: Column(
          children: <Widget>[
            Ink.image(
              image: NetworkImage(
                'https://i.dietdoctor.com/wp-content/uploads/2018/08/man_kettlebell.jpg?auto=compress%2Cformat&w=800&h=449&fit=crop',
              ),
              height: 200,
              fit: BoxFit.fitWidth,
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Text('RUTINAS'),
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
