import 'package:flutter/material.dart';

class Cuenta extends StatefulWidget {
  Cuenta({Key? key}) : super(key: key);

  @override
  _CuentaState createState() => _CuentaState();
}

class _CuentaState extends State<Cuenta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text("CUENTA APP"),
    ));
  }
}
