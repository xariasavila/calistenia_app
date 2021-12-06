import 'package:flutter/material.dart';
import 'ejercicios/ejercicios.dart';
import 'rutinas/rutinas.dart';

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
        body: Center(
            child: ListView(children: <Widget>[
          Column(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'Selecciona Tipo De Entrenamiento',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Ubuntu',
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
              const Divider(
                height: 10,
                thickness: 5,
                indent: 10,
                endIndent: 10,
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
                      height: 170,
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/ejercicio.jpg'),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Ejercicios()),
                          );
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text('EJERCICIOS',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ],
                )),
              ),
              const Divider(
                height: 20,
                thickness: 5,
                indent: 20,
                endIndent: 20,
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
                      height: 170,
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
                      child: Text('RUTINAS',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ],
                )),
              ),
            ],
          )
        ])));
  }
}
