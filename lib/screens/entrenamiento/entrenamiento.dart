import 'package:calistenia_app/widgets/widget_cardEntrenamiento.dart';
import 'package:flutter/material.dart';
import '../../constant.dart';

class Entrenamiento extends StatefulWidget {
  Entrenamiento({Key? key}) : super(key: key);
  @override
  _EntrenamientoState createState() => _EntrenamientoState();
}

class _EntrenamientoState extends State<Entrenamiento> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: contentColorLightTheme,
        appBar: AppBar(
          title: Text('Entrenamiento'),
        ),
        body: ListView(
          children: <Widget>[
            titulo(),
            cardRutinas(context),
            cardEjercicios(context),
          ],
        ));
  }
}
