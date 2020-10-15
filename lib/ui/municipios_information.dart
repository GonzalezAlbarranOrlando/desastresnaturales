

import 'package:desastresnaturales/map/map_page.dart';
import 'package:desastresnaturales/map/permissions.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:desastresnaturales/model/municipio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location_permissions/location_permissions.dart';

import 'menu_page.dart';

class MunicipioInformation extends StatefulWidget {
  String str_lat = "19.775405";
  String str_lon = "-99.207922";

  final Municipio municipio;
  MunicipioInformation(this.municipio);

  @override
  _MunicipioInformationState createState() => _MunicipioInformationState();
}

final municipioReference = FirebaseDatabase.instance.reference().child('municipio');
final pri_aspectosReference = FirebaseDatabase.instance.reference().child('principalesaspectos');

class _MunicipioInformationState extends State<MunicipioInformation> {

  List<Municipio> items;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Información del municipio'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Container(
        //height: 400.0,
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Center(
              child: Column(
                children: <Widget>[
                  new Text("IGECEM : ${widget.municipio.id_igecem}",
                    style: TextStyle(fontSize: 18.0),),
                  Padding(padding: EdgeInsets.only(top: 8.0),),
                  Divider(),
                  new Text("Nombre : ${widget.municipio.nombre}",
                    style: TextStyle(fontSize: 18.0),),
                  Padding(padding: EdgeInsets.only(top: 8.0),),
                  Divider(),
                  new Text("Significado : ${widget.municipio.significado}",
                    style: TextStyle(fontSize: 18.0),),
                  Padding(padding: EdgeInsets.only(top: 8.0),),
                  Divider(),
                  new Text("Cabecera Municipal : ${widget.municipio.cabeceramun}",
                    style: TextStyle(fontSize: 18.0),),
                  Padding(padding: EdgeInsets.only(top: 8.0),),
                  Divider(),
                  new Text("Superficie (km2) : ${widget.municipio.superficie}",
                    style: TextStyle(fontSize: 18.0),),
                  Padding(padding: EdgeInsets.only(top: 8.0),),
                  Divider(),
                  new Text("Altitud (msnmm): ${widget.municipio.altitud}",
                    style: TextStyle(fontSize: 18.0),),
                  Padding(padding: EdgeInsets.only(top: 8.0),),
                  Divider(),
                  new Text("Clima : ${widget.municipio.clima}",
                    style: TextStyle(fontSize: 18.0),),
                  Padding(padding: EdgeInsets.only(top: 8.0),),
                  Divider(),
                  new Text("Latitud : ${widget.municipio.lat}",
                    style: TextStyle(fontSize: 18.0),),
                  Padding(padding: EdgeInsets.only(top: 8.0),),
                  Divider(),
                  new Text("Lomgitud : ${widget.municipio.lon}",
                    style: TextStyle(fontSize: 18.0),),
                  Padding(padding: EdgeInsets.only(top: 8.0),),
                  Divider(),
                  new Text("Rio o Canal : ${widget.municipio.lat}",
                    style: TextStyle(fontSize: 18.0),),
                  Padding(padding: EdgeInsets.only(top: 8.0),),
                  Divider(),
                  new Text("Cuerpo de agua : ${widget.municipio.lat}",
                    style: TextStyle(fontSize: 18.0),),
                  Padding(padding: EdgeInsets.only(top: 8.0),),
                  Divider(),
                  new Text("Más poblado : ${widget.municipio.lat}",
                    style: TextStyle(fontSize: 18.0),),
                  Padding(padding: EdgeInsets.only(top: 8.0),),
                  Divider(),
                  new Text("Más extenso : ${widget.municipio.lat}",
                    style: TextStyle(fontSize: 18.0),),
                  Padding(padding: EdgeInsets.only(top: 8.0),),
                  Divider(),
                  new Text("Menos poblado : ${widget.municipio.lat}",
                    style: TextStyle(fontSize: 18.0),),
                  Padding(padding: EdgeInsets.only(top: 8.0),),
                  Divider(),
                  new Text("Industrializado : ${widget.municipio.lat}",
                    style: TextStyle(fontSize: 18.0),),
                  Padding(padding: EdgeInsets.only(top: 8.0),),
                  Divider(),
                  RaisedButton(onPressed: () {
                    //LocationPermissions().openAppSettings().then((bool hasOpened) => debugPrint('App Settings opened: ' + hasOpened.toString()));
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => Map_page(widget.municipio.nombre,double.parse(widget.municipio.lat), double.parse(widget.municipio.lon))));
                  }, child: Text("Ubicación"),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}