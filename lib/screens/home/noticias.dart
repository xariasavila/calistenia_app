import 'dart:async';
import 'package:calistenia_app/api/calistenia_api.dart';
import 'package:calistenia_app/models/noticia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:linkwell/linkwell.dart';

class Noticias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        shadowColor: Colors.deepOrange,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('NOTICIAS'),
      ),
      body: bodyNoticias(),
    );
  }
}

Widget bodyNoticias() {
  return FiltroNoticia();
}

Widget titulo(BuildContext context) {
  return Column(children: [
    Align(
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(
          'Últimas Noticias Calistenia Chile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
    ),
  ]);
}

class FiltroNoticia extends StatefulWidget {
  @override
  FiltroNoticiaState createState() => FiltroNoticiaState();
}

class FiltroNoticiaState extends State<FiltroNoticia> {
  Timer? debouncer;
  List<Noticia> noticias = [];
  String query = '';

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    init();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Future init() async {
    final noticias = await CalisteniaApi.getNoticias(query);
    setState(() => this.noticias = noticias);
  }

  Widget buildNoticia(Noticia noticia) => Column(children: [
        Card(
            elevation: 6,
            margin: EdgeInsets.all(15),
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.all(8.0),
                    child: ListTile(
                        leading: CircleAvatar(
                            radius: 22,
                            backgroundImage:
                                AssetImage("assets/images/noticias.png")),
                        title: Text(noticia.titulo,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)))),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: LinkWell(noticia.descripcion,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 15,
                        ))),
                SizedBox(
                  height: 10,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          padding: new EdgeInsets.symmetric(
                              horizontal: 11.0, vertical: 6.0),
                          child: Text("Fecha Publicación:",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 13,
                              ))),
                      Container(
                          padding: new EdgeInsets.symmetric(
                              horizontal: 2.0, vertical: 7.0),
                          width: 75,
                          height: 30,
                          child: Text(noticia.createdAt,
                              overflow: TextOverflow.clip,
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 13)))
                    ]),
              ],
            )),
        const Divider(
          height: 20,
          thickness: 5,
          indent: 20,
          endIndent: 20,
        ),
      ]);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.all(28),
                child: Text(
                  'Últimas Noticias Calistenia Chile',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const Divider(
              height: 10,
              thickness: 5,
              indent: 20,
              endIndent: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: noticias.length,
                itemBuilder: (context, index) {
                  final noticia = noticias[index];

                  return buildNoticia(noticia);
                },
              ),
            ),
          ],
        ),
      );
}
