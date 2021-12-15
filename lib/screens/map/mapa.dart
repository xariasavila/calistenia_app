import 'dart:async';
import 'package:calistenia_app/screens/map/map_key.dart';
import 'package:calistenia_app/api/calistenia_api.dart';
import 'package:calistenia_app/models/parque.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:latlong2/latlong.dart' as latLng;

class Mapa extends StatefulWidget {
  const Mapa({Key? key}) : super(key: key);

  @override
  _MapaState createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  late CenterOnLocationUpdate _centerOnLocationUpdate;
  late StreamController<double> _centerCurrentLocationStreamController;
  late Future<List<Parque>> futureParque;

  List<Parque> parques = [];

  @override
  void initState() {
    super.initState();
    futureParque = getParques2("");
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
        body: Center(
            child: FutureBuilder<List<Parque>>(
                future: futureParque,
                builder: (context, snapshot) {
                  List<Marker> arregloParques = [];
                  if (snapshot.hasData) {
                    for (int i = 0; i < snapshot.data!.length; i++) {
                      arregloParques.add(Marker(
                        width: 80.0,
                        height: 80.0,

                        //point: latLng.LatLng(-33.44376988704037, -70.65026066620514),
                        point: latLng.LatLng(
                            double.parse(snapshot.data![i].latitud),
                            double.parse(snapshot.data![i].longitud)),
                        builder: (ctx) => _mapContainer(
                            snapshot.data![i].nombre,
                            //snapshot.data![i].direccion,
                            snapshot.data![i].descripcion),
                      ));
                    }

                    return FlutterMap(
                        options: MapOptions(
                            center: latLng.LatLng(0, 0),
                            zoom: 15,
                            // Stop centering the location marker on the map if user interacted with the map.
                            onPositionChanged:
                                (MapPosition position, bool hasGesture) {
                              if (hasGesture) {
                                setState(() => _centerOnLocationUpdate =
                                    CenterOnLocationUpdate.never);
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
                                setState(() => _centerOnLocationUpdate =
                                    CenterOnLocationUpdate.always);
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
                          MarkerLayerOptions(markers: arregloParques)
                        ]);
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                })));
  }

  Widget _mapContainer(nombre, descripcion) {
    // add direccion
    return Center(
        child: FutureBuilder<List<Parque>>(
            future: futureParque,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
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
                                                  const Radius.circular(10))),
                                      padding: EdgeInsets.all(20.0),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            ListTile(
                                              leading: Icon(Icons.place_sharp),
                                              title: Text(
                                                nombre,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                            /*  const Divider(
                                              height: 20,
                                              thickness: 5,
                                              indent: 20,
                                              endIndent: 20,
                                            ),
                                            ListTile(
                                              leading: Icon(
                                                  Icons.directions_outlined),
                                              title: Text(
                                                'Direccion del parque ',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                ),
                                              ), //direccion
                                            ),*/
                                            const Divider(
                                              height: 20,
                                              thickness: 5,
                                              indent: 20,
                                              endIndent: 20,
                                            ),
                                            ListTile(
                                              leading: Icon(Icons.thumb_up_alt),
                                              title: Text(
                                                descripcion,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ),
                                          ]))
                                ]);
                              });
                        }));
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              return const CircularProgressIndicator();
            }));
  }
}
