import 'dart:async';
import 'package:calistenia_app/api/calistenia_api.dart';
import 'package:calistenia_app/models/rutina.dart';
import 'package:calistenia_app/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'detalleRutina.dart';

class RutinasFacil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.black,
        shadowColor: Colors.deepOrange,
        centerTitle: true,
        title: Text('RUTINAS FÁCILES'),
      ),
      body: bodyRutina(),
    );
  }
}

Widget bodyRutina() {
  return FiltroRutina1();
}

class FiltroRutina1 extends StatefulWidget {
  @override
  FiltroRutina1State createState() => FiltroRutina1State();
}

class FiltroRutina1State extends State<FiltroRutina1> {
  Timer? debouncer;
  List<Rutina> rutinas = [];
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
    final rutinas = await CalisteniaApi.getRutinas1(query);
    setState(() => this.rutinas = rutinas);
  }

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Nombre de la rutina',
        onChanged: searchRutina,
      );

  Future searchRutina(String query) async => debounce(() async {
        final rutinas = await CalisteniaApi.getRutinas1(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.rutinas = rutinas;
        });
      });

  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Column(
          children: <Widget>[
            buildSearch(),
            Expanded(
              child: ListView.builder(
                itemCount: rutinas.length,
                itemBuilder: (context, index) {
                  final rutina = rutinas[index];
                  return buildRutina(rutina);
                },
              ),
            ),
          ],
        ),
      );

  Widget buildRutina(Rutina rutina) => Column(children: [
        Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              leading: Icon(
                Icons.accessibility,
                color: Colors.orange,
                size: 24.0,
              ),
              title: Text(rutina.nombre),
              //subtitle: Text(ejercicio.descripcion),
              trailing: Icon(
                Icons.arrow_forward,
                color: Colors.orange,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetalleRutina(rutina)));
              },
            ))
      ]);
}
