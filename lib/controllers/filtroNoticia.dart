import 'dart:async';
import 'package:calistenia_app/api/calistenia_api.dart';
import 'package:calistenia_app/models/noticia.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  Widget buildEvento(Noticia noticia) => Column(children: [
        Card(
            elevation: 5,
            margin: EdgeInsets.all(10),
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
                    child: Text(noticia.descripcion,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Roboto',
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
                          child: Text(noticia.fecha,
                              overflow: TextOverflow.clip,
                              //Text(DateFormat('yyyy/MM/dd', yMd() ).format(noticia.fecha),
                              // Text(DateFormat('yMMMMd').format(noticia.fecha),
                              // Text( DateFormat(DateFormat.YEAR_MONTH_DAY, 'pt_Br').format(noticia.fecha).toString(),
                              //   Text(DateFormat(yMMMd().format(noticia.fecha)),
                              // Text(NumberFormat('###.0##', 'en_US').format(noticia.fecha),
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 13)))
                    ]),
              ],
            ))
      ]);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: noticias.length,
                itemBuilder: (context, index) {
                  final noticia = noticias[index];

                  return buildEvento(noticia);
                },
              ),
            ),
          ],
        ),
      );
}
