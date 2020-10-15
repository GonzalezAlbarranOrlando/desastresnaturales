import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'locations.dart' as locations;

void main() {
  runApp(Map_page());
}
final LatLng _center = const LatLng(19.775405, -99.207922);

class Map_page extends StatefulWidget {

  @override
  _Map_pageState createState() => _Map_pageState();
}

class _Map_pageState extends State<Map_page> {
  final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    final googleOffices = await locations.getGoogleOffices();
    setState(() {
      _markers.clear();
      final marker = Marker(
        markerId: MarkerId("1"),
        position: LatLng(19.775405, -99.207922),
        infoWindow: InfoWindow(
          title: "aculco",
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
            target: _center,
            zoom: 5,
          ),
          markers: _markers.values.toSet(),
        ),
      ),
    );
  }
}