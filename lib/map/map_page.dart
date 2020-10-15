import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'locations.dart' as locations;


class Map_page extends StatefulWidget {
  String nombre;
  double lat;
  double lon;
  Map_page(this.nombre, this.lat, this.lon);

  @override
  _Map_pageState createState() => _Map_pageState(nombre,lat,lon);
}

class _Map_pageState extends State<Map_page> {
  String nombre;
  double lat;
  double lon;
  _Map_pageState(this.nombre, this.lat, this.lon);


  final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    final googleOffices = await locations.getGoogleOffices();
    setState(() {
      _markers.clear();
      final marker = Marker(
        markerId: MarkerId("1"),
        position: LatLng(lat, lon),
        infoWindow: InfoWindow(
          title: nombre,
        ),
      );
      _markers["1"] = marker;


    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Google Office Locations'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: LatLng(lat, lon),
            zoom: 10,
          ),
          markers: _markers.values.toSet(),
        ),
      ),
    );
  }
}