import 'package:flutter/material.dart';
import 'package:linkwell/linkwell.dart';
import 'package:url_launcher/url_launcher.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  String titulo = 'Calistenia Chile';
  String unete = 'https://chat.whatsapp.com/E19U86Dl3YGIc6O2XIdPuB';

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          shadowColor: Colors.deepOrange,
          backgroundColor: Colors.black,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text("INFORMACIÓN Y CONTACTO"),
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
              child: new InkWell(
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.all(5.0),
                    primary: Colors.white,
                    textStyle: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  onPressed: () {
                    launch('https://chat.whatsapp.com/E19U86Dl3YGIc6O2XIdPuB');
                  },
                  child: const Text('Únete aquí a nuestro grupo de Whatsapp!'),
                ),
              )),
        ]));
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
