import 'package:calistenia_app/constant.dart';

import 'package:flutter/material.dart';

class Rutinas extends StatefulWidget {
  Rutinas({Key? key}) : super(key: key);

  @override
  _RutinasState createState() => _RutinasState();
}

class _RutinasState extends State<Rutinas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: contentColorLightTheme,
        appBar: AppBar(
          title: Text('Rutinas Nivel'),
        ),
        body: ListView(
          children: <Widget>[
            cardRutinasFacil(context),
            cardRutinasIntermedio(context),
            cardRutinasAvanzado(context)
          ],
        ));
  }
}

Widget cardRutinasFacil(BuildContext context) {
  return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      margin: EdgeInsets.all(30),
      elevation: 10,
      child: ClipRRect(
        child: Column(
          children: <Widget>[
            Ink.image(
              image: NetworkImage(
                'https://i.dietdoctor.com/wp-content/uploads/2018/08/man_kettlebell.jpg?auto=compress%2Cformat&w=800&h=449&fit=crop',
              ),
              height: 150,
              fit: BoxFit.cover,
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Text('RUTINAS'),
            ),
          ],
        ),
      ));
}

Widget cardRutinasIntermedio(BuildContext context) {
  return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      margin: EdgeInsets.all(30),
      elevation: 10,
      child: ClipRRect(
        child: Column(
          children: <Widget>[
            Ink.image(
              image: NetworkImage(
                'https://i.dietdoctor.com/wp-content/uploads/2018/08/man_kettlebell.jpg?auto=compress%2Cformat&w=800&h=449&fit=crop',
              ),
              height: 150,
              fit: BoxFit.cover,
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Text('RUTINAS'),
            ),
          ],
        ),
      ));
}

Widget cardRutinasAvanzado(BuildContext context) {
  return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      margin: EdgeInsets.all(30),
      elevation: 10,
      child: ClipRRect(
        child: Column(
          children: <Widget>[
            Ink.image(
              image: NetworkImage(
                'https://i.dietdoctor.com/wp-content/uploads/2018/08/man_kettlebell.jpg?auto=compress%2Cformat&w=800&h=449&fit=crop',
              ),
              height: 150,
              fit: BoxFit.cover,
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Text('RUTINAS'),
            ),
          ],
        ),
      ));
}
