import 'package:calistenia_app/screens/account/info.dart';
import 'package:calistenia_app/screens/entrenamiento/entrenamiento.dart';
import 'package:calistenia_app/screens/map/mapa1.dart';
import 'package:calistenia_app/screens/map/mapa5.dart';
import 'package:flutter/material.dart';
import 'home/inicio.dart';
import 'map/gmap.dart';
import 'map/mapa0.dart';
import 'map/mapa2.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;

  final List<Widget> pageList = [
    Gmap(),
    Mapa0(),
    Mapa1(),
    Mapa5(),
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
            label: 'Gmap',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Mapa0',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.place),
            label: 'Mapa1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Mapa5',
          ),
        ],
      ),
    );
  }
}
