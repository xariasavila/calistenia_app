import 'package:flutter/material.dart';
import 'package:linkwell/linkwell.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  String titulo = 'Calistenia Chile';

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        shadowColor: Colors.deepOrange,
        backgroundColor: Colors.black,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("CALISTENIA APP"),
      ),
      body: ListView(children: <Widget>[
        Container(
          margin: const EdgeInsets.all(10.0),
          child: avatar(context),
          padding: const EdgeInsets.all(8.0),
          // color: Colors.black,
        ),
        const Divider(
          height: 20,
          thickness: 5,
          indent: 20,
          endIndent: 20,
        ),
        Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
              Text('$titulo', style: TextStyle(fontSize: 40)),
              const Divider(
                height: 20,
                thickness: 5,
                indent: 20,
                endIndent: 20,
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(8.0),
                child: LinkWell(
                    'Calistenia Chile fundada en 2020 por Danilo Venegas, ofrece esta herramienta tecnológica para la instruccion de los alumnos en tiempos de pandemia. \n\n\nPara sugerencias o problemas técnicos favor contactar a: Soporte@Calisteniaapp.cl',
                    style: TextStyle(fontSize: 18)),
              )
            ])),
        const Divider(
          height: 20,
          thickness: 5,
          indent: 20,
          endIndent: 20,
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.all(8.0),
          child: Text('Calistenia Chile 2021', style: TextStyle(fontSize: 11)),
        )
      ]),
    );
  }

  Widget avatar(BuildContext context) {
    return Center(
        child: Stack(children: <Widget>[
      CircleAvatar(
          radius: 80,
          backgroundImage: AssetImage("assets/images/calistenia.png")),
    ]));
  }
}
