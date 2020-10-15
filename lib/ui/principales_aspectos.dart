import 'package:desastresnaturales/main.dart';
import 'package:desastresnaturales/ui/listview_municipios.dart';
import 'package:desastresnaturales/ui/municipios_information.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:desastresnaturales/model/municipio.dart';
import 'package:desastresnaturales/model/principalesaspectos.dart';
import 'package:flutter/services.dart';

class PrincipalesAspectos extends StatefulWidget {
  final Principal_aspecto principal_asp;

  PrincipalesAspectos(this.principal_asp);

  @override
  _PrincipalesAspectosState createState() => _PrincipalesAspectosState();
}

final municipioReference = FirebaseDatabase.instance.reference().child('principalesaspectos');

class _PrincipalesAspectosState extends State<PrincipalesAspectos> {
  List<Principal_aspecto> items;
  TextEditingController _id_igecemController;
  TextEditingController _elevacionController;
  TextEditingController _canal_rioController;
  TextEditingController _cuerpoController;
  TextEditingController _maspobladoController;
  TextEditingController _menospobladoController;
  TextEditingController _industrializadoController;

  final _formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _id_igecemController = new TextEditingController(text: widget.principal_asp.id_igecem);
    _elevacionController = new TextEditingController(text: widget.principal_asp.nombre);
    _canal_rioController = new TextEditingController(text: widget.principal_asp.significado);
    _cuerpoController = new TextEditingController(text: widget.principal_asp.cabeceramun);
    _maspobladoController = new TextEditingController(text: widget.principal_asp.superficie);
    _menospobladoController = new TextEditingController(text: widget.principal_asp.altitud);
    _industrializadoController = new TextEditingController(text: widget.principal_asp.clima);
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
                    controller: _elevacionController,
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
                    controller: _canal_rioController,
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
                    controller: _cuerpoController,
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
                    controller: _maspobladoController,
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
                    controller: _menospobladoController,
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
                    controller: _industrializadoController,
                    style: TextStyle(
                        fontSize: 17.0, color: Colors.deepOrangeAccent),
                    decoration: InputDecoration(
                        icon: Icon(Icons.cloud_circle), labelText: 'Industrializado'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                  ),
                  Divider(),
                  FlatButton(
                      onPressed: () {
                        if (widget.principal_asp.id_igecem != null) {
                          municipioReference
                              .child(_id_igecemController.text)
                              .set({
                            'nombre': _elevacionController.text,
                            'significado': _canal_rioController.text,
                            'cabeceramun': _cuerpoController.text,
                            'superficie': _maspobladoController.text,
                            'altitud': _menospobladoController.text,
                            'clima': _industrializadoController.text,
                          }).then((_) {
                            Navigator.pop(context);
                          });
                        } else {
                          municipioReference.push().set({
                            'nombre': _elevacionController.text,
                            'significado': _canal_rioController.text,
                            'cabeceramun': _cuerpoController.text,
                            'superficie': _maspobladoController.text,
                            'altitud': _menospobladoController.text,
                            'clima': _industrializadoController.text,
                          }).then((_) {
                            Navigator.pop(context);
                          });
                        }
                      },
                      child: (widget.principal_asp.id_igecem != null)
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
