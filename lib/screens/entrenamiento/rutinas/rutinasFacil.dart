import 'package:calistenia_app/screens/entrenamiento/ejercicios/filter_network_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';

class RutinasFacil extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: contentColorLightTheme,
      appBar: AppBar(
        title: Text('Rutinas Fácil'),
      ),
      body: buildPages(),
    );
  }
}

Widget buildPages() {
  return FilterNetworkListPage();
}
