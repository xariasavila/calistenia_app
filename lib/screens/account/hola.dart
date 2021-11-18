import 'dart:async';
import 'dart:convert';
import 'package:calistenia_app/models/ejercicio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Ejercicio>> _getEjercicio1() async {
  final url = Uri.parse('http://67.205.155.156:4500/api/ejerciciodificultad/1');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse
        .map((ejercicio) => new Ejercicio.fromJson(ejercicio))
        .toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

class Hola extends StatefulWidget {
  const Hola({Key? key}) : super(key: key);

  @override
  State<Hola> createState() => _HolaState();
}

class _HolaState extends State<Hola> {
  late Future<List<Ejercicio>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = _getEjercicio1();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          title: const Text('Store App'),
          centerTitle: true,
        ),
        body: Center(
          child: FutureBuilder(
            future: _getEjercicio1(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                //return Container(
                //  child: const Center(
                //    child: Text('Loading...'),
                //  ),
                //);
                return const CircularProgressIndicator();
              } else {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      //print(snapshot.data[index].image);
                      return ListTile(
                        leading: SizedBox(
                          height: 150.0,
                          width: 150.0, // fixed width and height
                        ),
                        title: Text(snapshot.data[index].nombre,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            )),
                        subtitle:
                            Text("\$ " + snapshot.data[index].descripcion),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetailPage(snapshot.data[index])));
                        },
                      );
                    });
              }
            },
          ),
        ),
      );
}

class DetailPage extends StatelessWidget {
  final Ejercicio ejercicio;

  DetailPage(this.ejercicio);

//WIDGET DETALLE
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ejercicio.nombre),
      ),
      body: Column(
        children: [
          Text(ejercicio.nombre,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )),
          Text(ejercicio.descripcion),
          Text(
            ejercicio.descripcion,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
