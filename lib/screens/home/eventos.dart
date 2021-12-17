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
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.all(5.0),
                    child: ListTile(
                        leading: CircleAvatar(
                            radius: 22,
                            backgroundImage:
                                AssetImage("assets/images/calendar.png")),
                        title: Text(evento.nombre,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)))),
                const Divider(
                  height: 10,
                  thickness: 2,
                  indent: 20,
                  endIndent: 20,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Text("Fecha Del Evento:\n " + evento.fecha,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 13,
                              ))),
                      Expanded(
                          flex: 1,
                          child: Container(
                              padding: EdgeInsets.all(10),
                              child: LinkWell(evento.descripcion,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 15,
                                  ))))
                    ]),
                SizedBox(
                  height: 10,
                ),
              ],
            )),
        const Divider(
          height: 8,
          thickness: 2,
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
                padding: EdgeInsets.all(20),
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
              height: 8,
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
