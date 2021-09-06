import 'package:flutter/material.dart';
import '../../../constant.dart';

import 'filter_network_list_page.dart';

class Ejercicios extends StatefulWidget {
  Ejercicios({Key? key}) : super(key: key);

  @override
  _EjerciciosState createState() => _EjerciciosState();
}

class _EjerciciosState extends State<Ejercicios> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 3,
            child: Scaffold(
              backgroundColor: contentColorLightTheme,
              appBar: AppBar(
                  iconTheme: IconThemeData(
                    color: Colors.black, //change your color here
                  ),
                  title: Text('Ejercicios'),
                  bottom: const TabBar(tabs: <Widget>[
                    Tab(text: "facil"),
                    Tab(text: "intermedio"),
                    Tab(text: "dificil"),
                  ])),
              body: buildPages(),
            )));
  }
}

Widget buildPages() {
  return FilterNetworkListPage();
}


/*body: Stack(
        children: <Widget>[
          _buildGoogleMap(context),
          _buildContainer(),
        ],
      ),
    );
  }

  */