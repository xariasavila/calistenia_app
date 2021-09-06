import 'package:calistenia_app/screens/mainscreen.dart';
import 'package:flutter/material.dart';

/// This is the stateful widget that the main application instantiates.
class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cuerpo(context),
      backgroundColor: Colors.black,
    );
  }
}

Widget cuerpo(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/rutina.jpg'), fit: BoxFit.cover)),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          titulo(),
          rut(),
          password(),
          SizedBox(height: 15),
          botonEntrar(context),
        ],
      ),
    ),
  );
}

Widget titulo() {
  return Text(
    "Calistenia Chile",
    style: TextStyle(
        color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
  );
}

Widget rut() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 100, vertical: 5),
    child: TextField(
      decoration: InputDecoration(
        hintText: "Rut Alumno",
        fillColor: Colors.white,
        filled: true,
        hintStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
      style: TextStyle(color: Colors.black),
    ),
  );
}

Widget password() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 100, vertical: 5),
    child: TextField(
      decoration: InputDecoration(
        hintText: "Constraseña",
        fillColor: Colors.white,
        filled: true,
        hintStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
      style: TextStyle(color: Colors.black),
    ),
  );
}

Widget botonEntrar(BuildContext context) {
// ignore: deprecated_member_use
  return RaisedButton(
    color: Colors.redAccent, // background
    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
    textColor: Colors.white, // foreground
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      );
    },
    child: Text('Entrenar', style: TextStyle(fontSize: 20)),
  );
}
