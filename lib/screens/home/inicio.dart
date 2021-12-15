import 'package:calistenia_app/screens/home/noticias.dart';
//import 'package:calistenia_app/screens/home/eventos.dart';

import 'package:flutter/material.dart';

class Inicio2 extends StatefulWidget {
  @override
  _Inicio2State createState() => _Inicio2State();
}

class _Inicio2State extends State<Inicio2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          shadowColor: Colors.deepOrange,
          backgroundColor: Colors.black,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text('CALISTENIA CHILE'),
        ),
        //body: SingleChildScrollView(
        body: Center(
            child: ListView(children: <Widget>[
          Column(children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.all(55),
                child: Text(
                  'Bienvenido! \n \nEntérate de lo último!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Card(
                  // CARD NOTICIAS
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
                        image: AssetImage('assets/images/noticias.jpg'),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Noticias()),
                            );
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text('NOTICIAS Y EVENTOS',
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
              ],
            )
          ])
        ])));
  }
}
