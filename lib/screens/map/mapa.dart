import 'package:calistenia_app/screens/map/map_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latLng;

//import 'package:latlng/latlng.dart';

class Mapa extends StatefulWidget {
  Mapa({Key? key}) : super(key: key);

  @override
  _MapaState createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          shadowColor: Colors.deepOrange,
          backgroundColor: Colors.black,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text("PARQUES CERCANOS"),
        ),
        body: new FlutterMap(
            options: new MapOptions(
              center: new latLng.LatLng(51.5, -0.09),
              zoom: 13.0,
            ),
            layers: [
              TileLayerOptions(
                  urlTemplate:
                      "https://api.mapbox.com/styles/v1/xaviarias/ckw2upt6218a814p9wyut60ja/tiles/256/{z}/{x}/{y}@2x?access_token={accessToken}",
                  additionalOptions: {
                    'accessToken': map_key,
                    'id': 'mapbox.mapbox-streets-v8'
                  }),
              MarkerLayerOptions(markers: [
                Marker(
                    width: 80.0,
                    height: 80.0,
                    point: latLng.LatLng(51.5, -0.09),
                    builder: (ctx) => Container(
                        child: IconButton(
                            icon: Icon(Icons.place),
                            color: Colors.red,
                            iconSize: 45.0,
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (builder) {
                                    return Wrap(children: <Widget>[
                                      Container(
                                          decoration: BoxDecoration(
                                              color: Colors.amber,
                                              borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      const Radius.circular(10),
                                                  topRight:
                                                      const Radius.circular(
                                                          10))),
                                          padding: EdgeInsets.all(20.0),
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                ListTile(
                                                  title: Text(
                                                    'Nombre del parque',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                ),
                                                const Divider(
                                                  height: 20,
                                                  thickness: 5,
                                                  indent: 20,
                                                  endIndent: 20,
                                                ),
                                                ListTile(
                                                  leading: Icon(Icons.place),
                                                  title: Text(
                                                      'Direccion del parque '),
                                                ),
                                                const Divider(
                                                  height: 20,
                                                  thickness: 5,
                                                  indent: 20,
                                                  endIndent: 20,
                                                ),
                                                ListTile(
                                                  leading:
                                                      Icon(Icons.thumb_up_alt),
                                                  title: Text(
                                                      'Descripción  del parque'),
                                                ),
                                              ]))
                                    ]);
                                  });
                            })))
              ])
            ]));
  }
}
