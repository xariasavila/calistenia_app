import 'dart:async';
import 'package:calistenia_app/api/calistenia_api.dart';
import 'package:calistenia_app/models/parque.dart';
import 'package:calistenia_app/screens/map/map_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latLng;

class Mapa2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: bodyParque(),
    );
  }
}

Widget bodyParque() {
  return FiltroParque();
}

class FiltroParque extends StatefulWidget {
  @override
  FiltroParqueState createState() => FiltroParqueState();
}

class FiltroParqueState extends State<FiltroParque> {
  Timer? debouncer;
  List<Parque> parques = [];
  String query = '';

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    init();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

//CALL API
  Future init() async {
    final parques = await CalisteniaApi.getParques(query);
    setState(() => this.parques = parques);
  }

  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        shadowColor: Colors.deepOrange,
        backgroundColor: Colors.black,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("PARQUES CERCANOS"),
      ),
      backgroundColor: Colors.grey.shade900,
      body: Column(children: <Widget>[
        Expanded(
            child: ListView.builder(
                itemCount: parques.length,
                itemBuilder: (context, index) {
                  final parque = parques[index];
                  return FlutterMap(
                      // MAYBE HERE IS THE ERROR
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

                              // point: latLng.LatLng(double.parse(parque.latitud),   double.parse(parque .longitud)), //HERE I WANT TO SHOW ALL THE PLACES FROM MY API REST
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
                                                            topLeft: const Radius
                                                                .circular(10),
                                                            topRight: const Radius
                                                                .circular(10))),
                                                    padding:
                                                        EdgeInsets.all(20.0),
                                                    child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: <Widget>[
                                                          ListTile(
                                                            title: Text(
                                                              parque
                                                                  .nombre, // PLACE'S NAME
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
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
                                                          /* ListTile(
                                                            leading: Icon(
                                                                Icons.place),
                                                            title: Text(
                                                                'Direccion del parque '),   //DIRECCTION'S PLACE (NOT IN API YET )
                                                          ),*/
                                                          const Divider(
                                                            height: 20,
                                                            thickness: 5,
                                                            indent: 20,
                                                            endIndent: 20,
                                                          ),
                                                          ListTile(
                                                            leading: Icon(Icons
                                                                .thumb_up_alt),
                                                            title: Text(
                                                                'Descripción  del parque'), //DESCRIPTION'S PLACE (parque.descripcion)
                                                          ),
                                                        ]))
                                              ]);
                                            });
                                      })))
                        ])
                      ]);
                }))
      ]));
}
