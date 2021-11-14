import 'package:calistenia_app/screens/entrenamiento/rutinas/rutinas.dart';
import 'package:flutter/material.dart';
import 'ejercicios/ejercicios.dart';

class Entrenamiento extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          shadowColor: Colors.deepOrange,
          backgroundColor: Colors.black,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text('ENTRENAMIENTO'),
        ),
        body: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Selecciona un tipo de entrenamiento',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            Card(
              // CARD EJERCI
              color: Colors.orange,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              clipBehavior: Clip.hardEdge,
              margin: EdgeInsets.all(20),
              elevation: 8,
              child: ClipRRect(
                  child: Column(
                children: <Widget>[
                  Ink.image(
                    height: 180,
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/ejercicio.jpg'),
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
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ],
              )),
            ),
            Card(
              // card rutinas
              color: Colors.orange,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              clipBehavior: Clip.hardEdge,
              margin: EdgeInsets.all(20),
              elevation: 8,
              child: ClipRRect(
                  child: Column(
                children: <Widget>[
                  Ink.image(
                    height: 180,
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
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ],
              )),
            ),
          ],
        ));
  }
}

Widget titulo(context) {
  return Column(children: [
    Align(
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.all(30),
        child: Text(
          '¿Qué tipo de entrenamiento realizarás?',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    ),
  ]);
}
