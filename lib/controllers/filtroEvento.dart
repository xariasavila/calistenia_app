import 'dart:async';
import 'package:calistenia_app/api/calistenia_api.dart';
import 'package:calistenia_app/models/evento.dart';
import 'package:flutter/material.dart';

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
            elevation: 5,
            margin: EdgeInsets.all(10),
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black)),
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
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
                  child: Text(evento.descripcion,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 15,
                      ))),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextButton(
                    //child: Text(ejercicio.nombre),
                    child: Text("AQUI VA LA FECHA"),
                    onPressed: () {/* ... */},
                  ),
                  const SizedBox(width: 8),
                  TextButton(
                    child: const Text('AQUI VA LA HORA'),
                    onPressed: () {/* ... */},
                  ),
                  const SizedBox(width: 8),
                ],
              )
            ]))
      ]);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Column(
          children: <Widget>[
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
