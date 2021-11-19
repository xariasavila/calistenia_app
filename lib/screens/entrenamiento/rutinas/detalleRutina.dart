import 'package:calistenia_app/models/ejercicio.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetalleRutina extends StatelessWidget {
  final Ejercicio ejercicio;
  DetalleRutina(this.ejercicio);

//WIDGET DETALLE
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black,
            centerTitle: true,
            title: Text("DETALLE RUTINA")),
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
                /*AspectRatio(
                    aspectRatio: 16 / 9,
                    child: BetterPlayer.network(
                        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
                        betterPlayerConfiguration:
                            BetterPlayerConfiguration(aspectRatio: 16 / 9)))*/
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
