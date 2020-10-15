import 'package:desastresnaturales/main.dart';
import 'package:desastresnaturales/ui/listview_municipios.dart';
import 'package:desastresnaturales/ui/municipios_information.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:desastresnaturales/model/municipio.dart';
import 'package:flutter/services.dart';

class PrincipalesAspectos extends StatefulWidget {
  final Municipio municipio;

  PrincipalesAspectos(this.municipio);

  @override
  _PrincipalesAspectosState createState() => _PrincipalesAspectosState();
}

final municipioReference = FirebaseDatabase.instance.reference().child('municipio');

class _PrincipalesAspectosState extends State<PrincipalesAspectos> {
  List<Municipio> items;
  TextEditingController _id_igecemController;
  TextEditingController _nombreController;
  TextEditingController _significadoController;
  TextEditingController _cabeceramunController;
  TextEditingController _superficieController;
  TextEditingController _altitudController;
  TextEditingController _climaController;
  TextEditingController _latController;
  TextEditingController _lonController;
  final _formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _id_igecemController =
    new TextEditingController(text: widget.municipio.id_igecem);
    _nombreController =
    new TextEditingController(text: widget.municipio.nombre);
    _significadoController =
    new TextEditingController(text: widget.municipio.significado);
    _cabeceramunController =
    new TextEditingController(text: widget.municipio.cabeceramun);
    _superficieController =
    new TextEditingController(text: widget.municipio.superficie);
    _altitudController =
    new TextEditingController(text: widget.municipio.altitud);
    _climaController = new TextEditingController(text: widget.municipio.clima);
    _latController =
    new TextEditingController(text: widget.municipio.lat);
    _lonController =
    new TextEditingController(text: widget.municipio.lon);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Princiapales Aspectos del Municipio'),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Container(
        //height: 570.0,
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: _nombreController,
                    style: TextStyle(
                        fontSize: 17.0, color: Colors.deepOrangeAccent),
                    decoration: InputDecoration(
                        icon: Icon(Icons.map), labelText: 'Elevación'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                  ),
                  Divider(),
                  TextField(
                    controller: _significadoController,
                    style: TextStyle(
                        fontSize: 17.0, color: Colors.deepOrangeAccent),
                    decoration: InputDecoration(
                        icon: Icon(Icons.question_answer),
                        labelText: 'Canal o Río'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                  ),
                  Divider(),
                  TextField(
                    controller: _cabeceramunController,
                    style: TextStyle(
                        fontSize: 17.0, color: Colors.deepOrangeAccent),
                    decoration: InputDecoration(
                        icon: Icon(Icons.text_format),
                        labelText: 'Cuerpo de agua'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                  ),
                  Divider(),
                  TextField(
                    controller: _superficieController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                        fontSize: 17.0, color: Colors.deepOrangeAccent),
                    decoration: InputDecoration(
                        icon: Icon(Icons.exposure), labelText: 'Muy Poblado'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                  ),
                  Divider(),
                  TextField(
                    controller: _altitudController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                        fontSize: 17.0, color: Colors.deepOrangeAccent),
                    decoration: InputDecoration(
                        icon: Icon(Icons.format_size), labelText: 'Menos poblado'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                  ),
                  Divider(),
                  TextField(
                    controller: _climaController,
                    style: TextStyle(
                        fontSize: 17.0, color: Colors.deepOrangeAccent),
                    decoration: InputDecoration(
                        icon: Icon(Icons.cloud_circle), labelText: 'Industrializado'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                  ),
                  Divider(),

                  //CheckboxListTile(title: Text("Selecciona el clima"),
                  //secondary: Icon(Icons.cloud),
                  //),

                  TextField(
                    controller: _latController,
                    style: TextStyle(
                        fontSize: 17.0, color: Colors.deepOrangeAccent),
                    decoration: InputDecoration(
                        icon: Icon(Icons.local_activity),
                        labelText: 'Latitud'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                  ),
                  Divider(),
                  TextField(
                    controller: _lonController,
                    style: TextStyle(
                        fontSize: 17.0, color: Colors.deepOrangeAccent),
                    decoration: InputDecoration(
                        icon: Icon(Icons.local_activity),
                        labelText: 'Longitud'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                  ),
                  Divider(),
                  FlatButton(
                      onPressed: () {
                        if (widget.municipio.id_igecem != null) {
                          municipioReference
                              .child(_id_igecemController.text)
                              .set({
                            'nombre': _nombreController.text,
                            'significado': _significadoController.text,
                            'cabeceramun': _cabeceramunController.text,
                            'superficie': _superficieController.text,
                            'altitud': _altitudController.text,
                            'clima': _climaController.text,
                            'lat': _latController.text,
                            'lon': _lonController.text,
                          }).then((_) {
                            Navigator.pop(context);
                          });
                        } else {
                          municipioReference.push().set({
                            'nombre': _nombreController.text,
                            'significado': _significadoController.text,
                            'cabeceramun': _cabeceramunController.text,
                            'superficie': _superficieController.text,
                            'altitud': _altitudController.text,
                            'clima': _climaController.text,
                            'lat': _latController.text,
                            'lon': _lonController.text,
                          }).then((_) {
                            Navigator.pop(context);
                          });
                        }
                      },
                      child: (widget.municipio.id_igecem != null)
                          ? Text('Guardar')
                          : Text('Agregar')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
