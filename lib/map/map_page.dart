import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location_permissions/location_permissions.dart';

class Map_page extends StatelessWidget {
  PermissionStatus permission;

  Map<String, Marker> markers = {};

  Marker m1;

  MarkerId markerId2;

  MarkerId markerId3;
  Marker marker2;
  Marker marker3;

  GoogleMapController mapController;
  final LatLng _center = const LatLng(19.775405, -99.207922);

  void _onMapCreated(GoogleMapController controller) async {
    permission = await LocationPermissions().requestPermissions();

    mapController = controller;

    markerId2 = MarkerId("2");
    markerId3 = MarkerId("3");

    marker2 = Marker(
      markerId: markerId2,
      position: LatLng(19.775405, -99.207922),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    );
    marker3 = Marker(
      markerId: markerId3,
      position: LatLng(17.9689, 79.5941),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    );
    markers.clear();
    markers["2"] = marker2;
    markers["3"] = marker3;

    Fluttertoast.showToast(msg: "-" + markers.keys.toString() + "-");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: const LatLng(0, 0),
            zoom: 2,
          ),
          markers: markers.values.toSet(),
        ),
      ),
    );
  }
}
