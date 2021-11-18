import 'dart:async';
import 'package:calistenia_app/api/calistenia_api.dart';
import 'package:calistenia_app/models/ejercicio.dart';
import 'package:calistenia_app/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'detalleEjercicio.dart';

class EjerciciosIntermedio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('EJERCICIOS INTERMEDIOS'),
      ),
      body: bodyEjercicio(),
    );
  }
}

Widget bodyEjercicio() {
  return FiltroEjercicio2();
}

class FiltroEjercicio2 extends StatefulWidget {
  @override
  FiltroEjercicio2State createState() => FiltroEjercicio2State();
}

class FiltroEjercicio2State extends State<FiltroEjercicio2> {
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
    final ejercicios = await CalisteniaApi.getEjercicios2(query);
    setState(() => this.ejercicios = ejercicios);
  }

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Nombre del ejercicio',
        onChanged: searchEjercicio,
      );

  Future searchEjercicio(String query) async => debounce(() async {
        final ejercicios = await CalisteniaApi.getEjercicios2(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.ejercicios = ejercicios;
        });
      });

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Column(
          children: <Widget>[
            buildSearch(),
            Expanded(
              child: ListView.builder(
                itemCount: ejercicios.length,
                itemBuilder: (context, index) {
                  final ejercicio = ejercicios[index];
                  return buildEjercicio(ejercicio);
                },
              ),
            ),
          ],
        ),
      );

  Widget buildEjercicio(Ejercicio ejercicio) => Column(children: [
        Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              leading: Icon(
                Icons.accessibility,
                color: Colors.orange,
                size: 24.0,
              ),
              title: Text(ejercicio.nombre),
              //subtitle: Text(ejercicio.descripcion),
              trailing: Icon(
                Icons.arrow_forward,
                color: Colors.orange,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetalleEjercicio(ejercicio)));
              },
            ))
      ]);
}
