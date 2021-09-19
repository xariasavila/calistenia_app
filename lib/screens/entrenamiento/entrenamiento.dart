import 'package:calistenia_app/widgets/widget_cardEntrenamiento.dart';
import 'package:flutter/material.dart';
import '../../constant.dart';

class Entrenamiento extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: contentColorLightTheme,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Entrenamiento'),
        ),
        body: ListView(
          children: <Widget>[
            titulo(),
            cardEjercicios(context),
            cardRutinas(context)
          ],
        ));
  }
}
