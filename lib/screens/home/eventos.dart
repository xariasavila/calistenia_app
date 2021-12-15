import 'dart:async';
import 'package:calistenia_app/api/calistenia_api.dart';
import 'package:calistenia_app/models/evento.dart';
import 'package:flutter/material.dart';
import 'package:linkwell/linkwell.dart';

class Eventos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        shadowColor: Colors.deepOrange,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('EVENTOS'),
      ),
      body: bodyEventos(),
    );
  }
}

Widget bodyEventos() {
  return FiltroEvento();
}

class FiltroEvento extends StatefulWidget {
  @override
  FiltroEventoState createState() => FiltroEventoState();
}

class FiltroEventoState extends State<FiltroEvento> {
  Timer? debouncer;
  List<Evento> eventos = [];
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
    final eventos = await CalisteniaApi.getEventos(query);
    setState(() => this.eventos = eventos);
  }

  Widget buildEvento(Evento evento) => Column(children: [
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
                                AssetImage("assets/images/calendar.png")),
                        title: Text(evento.nombre,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)))),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: LinkWell(evento.descripcion,
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
                          child: Text("Fecha Evento:",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 13,
                              ))),
                      Container(
                          padding: new EdgeInsets.symmetric(
                              horizontal: 2.0, vertical: 7.0),
                          width: 75,
                          height: 30,
                          child: Text(evento.fecha,
                              overflow: TextOverflow.clip,
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 13))),
                      Container(
                        padding: new EdgeInsets.symmetric(
                            horizontal: 2.0, vertical: 7.0),
                        width: 75,
                        height: 30,
                        /* child: Text(evento.fecha,
                              overflow: TextOverflow.clip,
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 13))*/
                      )
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
                  'Últimos Eventos Calistenia Chile',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const Divider(
              height: 20,
              thickness: 5,
              indent: 20,
              endIndent: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: eventos.length,
                itemBuilder: (context, index) {
                  final evento = eventos[index];

                  return buildEvento(evento);
                },
              ),
            ),
          ],
        ),
      );
}
