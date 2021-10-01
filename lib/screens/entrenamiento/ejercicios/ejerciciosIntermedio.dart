import 'package:calistenia_app/screens/entrenamiento/ejercicios/filter_network_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EjerciciosIntermedio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Ejercicios intermedios'),
      ),
      body: buildPages(),
    );
  }
}

Widget buildPages() {
  return FilterNetworkListPage();
}
