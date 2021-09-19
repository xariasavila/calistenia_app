import 'package:flutter/material.dart';

class Cuenta extends StatefulWidget {
  Cuenta({Key? key}) : super(key: key);

  @override
  _CuentaState createState() => _CuentaState();
}

String nombreUsuario = 'Xaviera Arias';

class _CuentaState extends State<Cuenta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("CUENTA APP"), centerTitle: true),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text('$nombreUsuario', style: TextStyle(fontSize: 40))
            ],
          ),
        ));
  }
}
