import 'dart:async';
import 'package:calistenia_app/models/ejercicio.dart';
import 'package:calistenia_app/screens/map/map_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';

import 'package:latlong2/latlong.dart' as latLng;

class Mapa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: bodyParque(),
    );
  }
}

Widget bodyParque() {
  return CenterFabExample();
}

class CenterFabExample extends StatefulWidget {
  @override
  _CenterFabExampleState createState() => _CenterFabExampleState();
}

class _CenterFabExampleState extends State<CenterFabExample> {
  late CenterOnLocationUpdate _centerOnLocationUpdate;
  late StreamController<double> _centerCurrentLocationStreamController;
  List<Ejercicio> ejercicios = [];
  String query = '';

  @override
  void initState() {
    super.initState();
    _centerOnLocationUpdate = CenterOnLocationUpdate.always;
    _centerCurrentLocationStreamController = StreamController<double>();
  }

  @override
  void dispose() {
    _centerCurrentLocationStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shadowColor: Colors.deepOrange,
          backgroundColor: Colors.black,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text("PARQUES CERCANOS"),
        ),
        body: new FlutterMap(
            options: MapOptions(
                center: latLng.LatLng(0, 0),
                zoom: 15,
                // Stop centering the location marker on the map if user interacted with the map.
                onPositionChanged: (MapPosition position, bool hasGesture) {
                  if (hasGesture) {
                    setState(() =>
                        _centerOnLocationUpdate = CenterOnLocationUpdate.never);
                  }
                }),
            children: [
              TileLayerWidget(
                options: TileLayerOptions(
                    urlTemplate:
                        "https://api.mapbox.com/styles/v1/xaviarias/ckw2upt6218a814p9wyut60ja/tiles/256/{z}/{x}/{y}@2x?access_token={accessToken}",
                    additionalOptions: {
                      'accessToken': map_key,
                      'id': 'mapbox.mapbox-streets-v8'
                    }),
              ),
              LocationMarkerLayerWidget(
                plugin: LocationMarkerPlugin(
                  centerCurrentLocationStream:
                      _centerCurrentLocationStreamController.stream,
                  centerOnLocationUpdate: _centerOnLocationUpdate,
                ),
              ),
              Positioned(
                right: 20,
                bottom: 20,
                child: FloatingActionButton(
                  backgroundColor: Colors.orange,
                  onPressed: () {
                    // Automatically center the location marker on the map when location updated until user interact with the map.
                    setState(() => _centerOnLocationUpdate =
                        CenterOnLocationUpdate.always);
                    // Center the location marker on the map and zoom the map to level 18.
                    _centerCurrentLocationStreamController.add(15);
                  },
                  child: Icon(
                    Icons.my_location,
                    color: Colors.black,
                  ),
                ),
              )
            ],
            layers: [
              MarkerLayerOptions(markers: [
                Marker(
                    width: 80.0,
                    height: 80.0,
                    point:
                        latLng.LatLng(-33.44376988704037, -70.65026066620514),
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
                                                    "hola",
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
