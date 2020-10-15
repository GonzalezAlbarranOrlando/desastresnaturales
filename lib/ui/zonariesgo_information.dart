import 'package:desastresnaturales/model/zonariesgo.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:desastresnaturales/model/municipio.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ZonariesgoInformation extends StatefulWidget {

  final Zonariesgo zonariesgo;
  ZonariesgoInformation(this.zonariesgo);

  @override
  _ZonariesgoInformationState createState() => _ZonariesgoInformationState();
}

final zonariesgoReference = FirebaseDatabase.instance.reference().child('zonariesgo');

class _ZonariesgoInformationState extends State<ZonariesgoInformation> {

  List<Zonariesgo> items;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Información de zona de riesgo'),
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
                  new Text("ID : ${widget.zonariesgo.id}", style: TextStyle(fontSize: 18.0),),
                  Padding(padding: EdgeInsets.only(top: 8.0),),
                  Divider(),
                  new Text("IGECEM : ${widget.zonariesgo.igecem}", style: TextStyle(fontSize: 18.0),),
                  Padding(padding: EdgeInsets.only(top: 8.0),),
                  Divider(),
                  new Text("Nombre municipio : ${widget.zonariesgo.nombreMunicipio}", style: TextStyle(fontSize: 18.0),),
                  Padding(padding: EdgeInsets.only(top: 8.0),),
                  Divider(),
                  new Text("Desastre : ${widget.zonariesgo.desastre}", style: TextStyle(fontSize: 18.0),),
                  Padding(padding: EdgeInsets.only(top: 8.0),),
                  Divider(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
