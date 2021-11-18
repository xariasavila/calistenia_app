import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Ejercicio>> fetchData() async {
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

class Ejercicio {
  final int idejercicio;
  final String nombre;
  final String descripcion;
  final String link;
  final int iddificultad;

  Ejercicio({
    required this.idejercicio,
    required this.nombre,
    required this.descripcion,
    required this.link,
    required this.iddificultad,
  });

  factory Ejercicio.fromJson(Map<String, dynamic> json) => Ejercicio(
        idejercicio: json['idejercicio'],
        nombre: json['nombre'],
        descripcion: json['descripcion'],
        link: json['link'],
        iddificultad: json['iddificultad'],
      );
}

class Hola2 extends StatefulWidget {
  const Hola2({Key? key}) : super(key: key);

  @override
  _Hola2State createState() => _Hola2State();
}

class _Hola2State extends State<Hola2> {
  late Future<List<Ejercicio>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter API and ListView Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter ListView'),
        ),
        body: Center(
          child: FutureBuilder<List<Ejercicio>>(
            future: fetchData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List<Ejercicio> data = snapshot.data;
                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 75,
                        color: Colors.white,
                        child: Center(
                          child: Text(data[index].nombre),
                        ),
                      );
                    });
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
