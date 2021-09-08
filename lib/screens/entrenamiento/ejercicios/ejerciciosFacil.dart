import 'package:flutter/material.dart';
import '../../../constant.dart';

import 'filter_network_list_page.dart';

class EjerciciosFacil extends StatefulWidget {
  EjerciciosFacil({Key? key}) : super(key: key);

  @override
  _EjerciciosFacilState createState() => _EjerciciosFacilState();
}

class _EjerciciosFacilState extends State<EjerciciosFacil> {
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
              ),
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