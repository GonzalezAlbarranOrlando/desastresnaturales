import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:desastresnaturales/model/municipio.dart';

class MunicipioScreen extends StatefulWidget {
  final Municipio municipio;

  MunicipioScreen(this.municipio);

  @override
  _MunicipioScreenState createState() => _MunicipioScreenState();
}

final municipioReference =
    FirebaseDatabase.instance.reference().child('municipio');

class _MunicipioScreenState extends State<MunicipioScreen> {
  List<Municipio> items;
  TextEditingController _id_igecemController;
  TextEditingController _nombreController;
  TextEditingController _significadoController;
  TextEditingController _cabeceramunController;
  TextEditingController _superficieController;
  TextEditingController _altitudController;

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Información del Municipio'),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Container(
        height: 570.0,
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: _nombreController,
              style: TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
              decoration:
                  InputDecoration(icon: Icon(Icons.map), labelText: 'Nombres'),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
            ),
            Divider(),
            TextField(
              controller: _significadoController,
              style: TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
              decoration: InputDecoration(
                  icon: Icon(Icons.question_answer), labelText: 'Significado'),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
            ),
            Divider(),
            TextField(
              controller: _cabeceramunController,
              style: TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
              decoration: InputDecoration(
                  icon: Icon(Icons.list), labelText: 'Cabecera Municipal'),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
            ),
            Divider(),
            TextField(
              controller: _superficieController,
              style: TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
              decoration: InputDecoration(
                  icon: Icon(Icons.exposure), labelText: 'Superficie'),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
            ),
            Divider(),
            TextField(
              controller: _altitudController,
              style: TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
              decoration: InputDecoration(
                  icon: Icon(Icons.format_size), labelText: 'Altitud'),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
            ),
            Divider(),
            FlatButton(
                onPressed: () {
                  if (widget.municipio.id_igecem != null) {
                    municipioReference.child(widget.municipio.id_igecem).set({
                      'nombre': _nombreController.text,
                      'significado': _significadoController.text,
                      'cabeceramun': _cabeceramunController.text,
                      'superficie': _superficieController.text,
                      'altitud': _altitudController.text,
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
                    }).then((_) {
                      Navigator.pop(context);
                    });
                  }
                },
                child: (widget.municipio.id_igecem != null)
                    ? Text('Actualizar')
                    : Text('Agregar')),
          ],
        ),
      ),
    );
  }
}
