

/*import 'package:calistenia_app/models/parque.dart';
import 'package:flutter_map/flutter_map.dart';

class MarkerService {
  List<Marker> getMarkers(List<Parque> parques) {
    var markers = List<Marker>();

    parques.forEach((parque) {
      Marker marker = Marker(
          markerId: MarkerId(parque.nombre),
          draggable: false,
          icon: place.icon,
          infoWindow: InfoWindow(title: place.name, snippet: place.vicinity),
          position:
              LatLng(place.geometry.location.lat, place.geometry.location.lng));

      markers.add(marker);
    });

    return markers;
  }
}



   _MapDataState(){
        print("map data state");
        loadSites().then((sitesdata) {
          print('Loaded Sites Asset JSON');
          //clone sitesdata into sts array
          sts..addAll(sitesdata);
          sts.forEach((parque) {
            marker.add(
              Marker(
                point: new LatLng(double.parse(parque.lat),double.parse(parque.lng)),
                builder: (ctx) => _MarkerPopUp(sitename: parque.name, siteelevation: parque.elevation, siteid: parque.siteID,),
              ),
            );
          });
        });
      }



        List<Marker> _buildMarkersOnMap() {
    List<Marker> markers = List<Marker>();
    var marker = new Marker(
                point: new LatLng(double.parse(parque.lat),double.parse(parque.lng)),
      width: 279.0,
      height: 256.0,
     
    );
    markers.add(marker);

    return markers;
  }*/