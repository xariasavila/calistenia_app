import 'package:flutter/material.dart';
import 'rutinasFacil.dart';
import 'rutinasIntermedio.dart';
import 'rutinasAvanzado.dart';

class Rutinas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          backgroundColor: Colors.black,
          shadowColor: Colors.deepOrange,
          centerTitle: true,
          title: Text('NIVEL RUTINAS'),
        ),
        body: ListView(
          //padding: EdgeInsets.all(6.0),
          children: <Widget>[
            titulo(context),
            const Divider(
              height: 20,
              thickness: 5,
              indent: 20,
              endIndent: 20,
            ),
            cardRutinasFacil(context),
            const Divider(
              height: 20,
              thickness: 5,
              indent: 20,
              endIndent: 20,
            ),
            cardRutinasIntermedio(context),
            const Divider(
              height: 20,
              thickness: 5,
              indent: 20,
              endIndent: 20,
            ),
            cardRutinasAvanzado(context)
          ],
        ));
  }
}

Widget cardRutinasFacil(BuildContext context) {
  return Card(
      color: Colors.green,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      clipBehavior: Clip.hardEdge,
      elevation: 5,
      margin: EdgeInsets.all(20),
      child: ClipRRect(
        child: Column(
          children: <Widget>[
            Ink.image(
                image: AssetImage('assets/images/rutina1.jpg'),
                height: 150,
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
              child: Text('RUTINA FÁCIL',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ],
        ),
      ));
}

Widget cardRutinasIntermedio(BuildContext context) {
  return Card(
      color: Colors.orange,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.all(20),
      elevation: 10,
      child: ClipRRect(
        child: Column(
          children: <Widget>[
            Ink.image(
                image: AssetImage('assets/images/rutina2.jpg'),
                height: 150,
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
                'RUTINA INTERMEDIA',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ));
}

Widget cardRutinasAvanzado(BuildContext context) {
  return Card(
      color: Colors.red,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.all(20),
      elevation: 10,
      child: ClipRRect(
        child: Column(
          children: <Widget>[
            Ink.image(
                image: AssetImage('assets/images/rutina3.jpg'),
                height: 150,
                //width: 200,
                fit: BoxFit.cover,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RutinasAvanzado()),
                    );
                  },
                )),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text('RUTINA AVANZADA',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
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
            fontSize: 22,
          ),
        ),
      ),
    ),
  ]);
}
