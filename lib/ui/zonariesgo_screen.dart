import 'package:desastresnaturales/main.dart';
import 'package:desastresnaturales/model/zonariesgo.dart';
import 'package:desastresnaturales/ui/listview_municipios.dart';
import 'package:desastresnaturales/ui/municipios_information.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:desastresnaturales/model/municipio.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ZonariesgoScreen extends StatefulWidget {
  final Zonariesgo zonariesgo;

  ZonariesgoScreen(this.zonariesgo);

  @override
  _ZonariesgoScreenState createState() => _ZonariesgoScreenState();
}

final zonariesgoReference = FirebaseDatabase.instance.reference().child('zonariesgo');

class _ZonariesgoScreenState extends State<ZonariesgoScreen> {
  List<Municipio> items;
  TextEditingController _idController;
  TextEditingController _igecemController;
  TextEditingController _nombreController;
  TextEditingController _desastreController;

  final _formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _idController =
        new TextEditingController(text: widget.zonariesgo.id);
    _igecemController =
        new TextEditingController(text: widget.zonariesgo.igecem);
    _nombreController =
        new TextEditingController(text: widget.zonariesgo.nombreMunicipio);
    _desastreController =
        new TextEditingController(text: widget.zonariesgo.desastre);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Información del Zona de riesgo'),
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
                    controller: _igecemController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                        fontSize: 17.0, color: Colors.deepOrangeAccent),
                    decoration: InputDecoration(
                        icon: Icon(Icons.map), labelText: 'IGECEM'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                  ),
                  Divider(),
                  TextField(
                    controller: _nombreController,
                    style: TextStyle(
                        fontSize: 17.0, color: Colors.deepOrangeAccent),
                    decoration: InputDecoration(
                        icon: Icon(Icons.question_answer),
                        labelText: 'Nombre del municipio'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                  ),
                  Divider(),
                  TextField(
                    controller: _desastreController,
                    style: TextStyle(
                        fontSize: 17.0, color: Colors.deepOrangeAccent),
                    decoration: InputDecoration(
                        icon: Icon(Icons.text_format),
                        labelText: 'Desastre'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                  ),
                  Divider(),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                  ),
                  Divider(),
                  FlatButton(
                      onPressed: () {
                        if (widget.zonariesgo.id != null) {
                          zonariesgoReference
                              .child(_idController.text)
                              .set({
                            'igecem': _igecemController.text,
                            'nombre': _nombreController.text,
                            'desastre': _desastreController.text,
                          }).then((_) {
                            Navigator.pop(context);
                          });
                        } else {
                          zonariesgoReference
                              .push().set({
                            'igecem': _igecemController.text,
                            'nombre': _nombreController.text,
                            'desastre': _desastreController.text,
                          }).then((_) {
                            Navigator.pop(context);
                          });
                        }
                      },
                      child: (widget.zonariesgo.id != null)
                          ? Text('Actualizar')
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
