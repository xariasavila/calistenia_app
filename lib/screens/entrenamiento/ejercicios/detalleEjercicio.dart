import 'package:calistenia_app/models/ejercicio.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

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
        body: SingleChildScrollView(
            //reverse: true,
            padding: EdgeInsets.all(30),
            child: Column(children: [
              Card(
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  elevation: 8,
                  clipBehavior: Clip.hardEdge,
                  child: ClipRRect(
                      child: Column(children: <Widget>[
                    Ink.image(
                      image: AssetImage('assets/images/youtube.JPG'),
                      height: 150,
                      //width: 200,
                      fit: BoxFit.cover,
                    ),
                    if (ejercicio.iddificultad == 1)
                      Link(
                        target: LinkTarget.blank,
                        uri: Uri.parse(ejercicio.link),
                        builder: (context, followLink) => ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.green),
                            ),
                            onPressed: followLink,
                            child: Text("VER EJERCICIO")),
                      ),
                    if (ejercicio.iddificultad == 2)
                      Link(
                        target: LinkTarget.blank,
                        uri: Uri.parse(ejercicio.link),
                        builder: (context, followLink) => ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.orange),
                            ),
                            onPressed: followLink,
                            child: Text("VER EJERCICIO")),
                      ),
                    if (ejercicio.iddificultad == 3)
                      Link(
                        target: LinkTarget.blank,
                        uri: Uri.parse(ejercicio.link),
                        builder: (context, followLink) => ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.red),
                            ),
                            onPressed: followLink,
                            child: Text("VER EJERCICIO")),
                      ),
                  ]))),
              const Divider(
                height: 20,
                thickness: 5,
                indent: 20,
                endIndent: 20,
              ),
              Column(children: <Widget>[
                Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
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
                    margin:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0)),
                if (ejercicio.iddificultad == 1)
                  Chip(
                    backgroundColor: Colors.green,
                    label: Text("FÁCIL",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                if (ejercicio.iddificultad == 2)
                  Chip(
                    backgroundColor: Colors.orange,
                    label: Text("INTERMEDIO",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                if (ejercicio.iddificultad == 3)
                  Chip(
                    backgroundColor: Colors.red,
                    label: Text("DIFÍCIL",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
              ]),
              const Divider(
                height: 20,
                thickness: 5,
                indent: 20,
                endIndent: 20,
              ),
              Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  child: Text("DESCRIPCIÓN \n \n" + ejercicio.descripcion,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,
                      ))),
            ])));
  }
}
