import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:desastresnaturales/model/municipio.dart';

class MunicipioInformation extends StatefulWidget {

  final Municipio municipio;
  MunicipioInformation(this.municipio);

  @override
  _MunicipioInformationState createState() => _MunicipioInformationState();
}

final municipioReference = FirebaseDatabase.instance.reference().child('municipio');

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
        height: 400.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                new Text("Nombre : ${widget.municipio.nombre}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Significado : ${widget.municipio.significado}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Cabecera Municipal : ${widget.municipio.cabeceramun}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Superficie : ${widget.municipio.superficie}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Altitud : ${widget.municipio.altitud}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
