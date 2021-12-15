import 'package:calistenia_app/screens/account/info.dart';
import 'package:calistenia_app/screens/entrenamiento/entrenamiento.dart';
import 'package:calistenia_app/screens/map/mapa.dart';
import 'package:flutter/material.dart';
import 'home/inicio.dart';
import 'home/inicio2.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;

  final List<Widget> pageList = [
    Inicio(),
    Entrenamiento(),
    Mapa(),
    Info(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        iconSize: 22,
        selectedIconTheme: IconThemeData(color: Colors.orange[900]),
        selectedItemColor: Colors.white,
        //showUnselectedLabels: false,
        currentIndex: pageIndex,
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
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
            icon: Icon(Icons.mail),
            label: 'Contacto',
          ),
        ],
      ),
    );
  }
}
