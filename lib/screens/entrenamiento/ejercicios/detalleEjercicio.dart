import 'package:calistenia_app/models/ejercicio.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetalleEjercicio extends StatelessWidget {
  final Ejercicio ejercicio;
  DetalleEjercicio(this.ejercicio);

//WIDGET DETALLE
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black,
            centerTitle: true,
            title: Text("DETALLE EJERCICIO")),
        body: Column(children: [
          Card(
              color: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              margin: EdgeInsets.all(25),
              elevation: 8,
              clipBehavior: Clip.hardEdge,
              child: ClipRRect(
                  child: Column(children: <Widget>[
                Ink.image(
                    image: AssetImage('assets/images/eje1.jpg'),
                    height: 180,
                    //width: 200,
                    fit: BoxFit.cover),
              ]))),
          Row(children: <Widget>[
            Container(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: Text(ejercicio.nombre.toUpperCase(),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,
                    ))),
          ]),
          const Divider(
            height: 20,
            thickness: 5,
            indent: 20,
            endIndent: 20,
          ),
          Row(children: <Widget>[
            Container(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0)),
            if (ejercicio.iddificultad == 1)
              Chip(
                backgroundColor: Colors.green,
                label: Text("FÁCIL"),
              ),
            if (ejercicio.iddificultad == 2)
              Chip(
                backgroundColor: Colors.orange,
                label: Text("INTERMEDIO"),
              ),
            if (ejercicio.iddificultad == 3)
              Chip(
                backgroundColor: Colors.red,
                label: Text("DIFÍCIL"),
              ),
          ]),
          const Divider(
            height: 20,
            thickness: 5,
            indent: 20,
            endIndent: 20,
          ),
          Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text("DESCRIPCIÓN \n \n" + ejercicio.descripcion,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                  ))),
        ]));
  }
}
