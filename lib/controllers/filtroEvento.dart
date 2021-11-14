import 'dart:async';
import 'package:calistenia_app/api/calistenia_api.dart';
import 'package:calistenia_app/models/ejercicio.dart';
import 'package:flutter/material.dart';

class FiltroEvento extends StatefulWidget {
  @override
  FiltroEventoState createState() => FiltroEventoState();
}

class FiltroEventoState extends State<FiltroEvento> {
  Timer? debouncer;
  List<Ejercicio> ejercicios = [];
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
    final ejercicios = await CalisteniaApi.getEjercicios(query);
    setState(() => this.ejercicios = ejercicios);
  }

  Widget buildEvento(Ejercicio ejercicio) => Column(children: [
        Card(
            elevation: 5,
            margin: EdgeInsets.all(8),
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black)),
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage("assets/images/calendar.png")),
                title: Text(
                  ejercicio.nombre,
                  //textAlign: TextAlign.center,
                ),
                //  subtitle: Text(ejercicio.descripcion),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  ejercicio.descripcion,
                  style: TextStyle(color: Colors.orange),
                ),
              ),
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
                itemCount: ejercicios.length,
                itemBuilder: (context, index) {
                  final ejercicio = ejercicios[index];

                  return buildEvento(ejercicio);
                },
              ),
            ),
          ],
        ),
      );
}
