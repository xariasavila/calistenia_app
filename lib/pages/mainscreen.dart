import 'package:calistenia_app/pages/cuenta.dart';
import 'package:calistenia_app/pages/entrenamiento.dart';
import 'package:calistenia_app/pages/inicio.dart';
import 'package:calistenia_app/pages/mapa.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;
  final List<Widget> pageList = [Inicio(), Entrenamiento(), Mapa(), Cuenta()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: contentColorLightTheme,
        selectedIconTheme: IconThemeData(color: primaryColor),
        selectedItemColor: Colors.white70,
        currentIndex: pageIndex,
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Entrenamiento',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.place),
            label: 'Mapa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Mi cuenta',
          ),
        ],
      ),
    );
  }
}
