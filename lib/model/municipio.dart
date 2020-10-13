import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Municipio{
  String _id_igecem;
  String _nombre;
  String _significado;
  String _cabeceramun;
  String _superficie;
  String _altitud;

  Municipio(this._id_igecem, this._nombre, this._significado, this._cabeceramun, this._superficie, this._altitud);

  Municipio.map(dynamic obj){
    this._nombre = obj['nombre'];
    this._significado = obj['significado'];
    this._cabeceramun = obj['cabeceramun'];
    this._superficie = obj['superficie'];
    this._altitud = obj['altitud'];
  }

  String get id_igecem => _id_igecem;
  String get nombre =>_nombre;
  String get significado => _significado;
  String get cabeceramun => _cabeceramun;
  String get superficie => _superficie;
  String get altitud => _altitud;

  Municipio.fromSnapShop(DataSnapshot snapshot){
    _id_igecem = snapshot.key;
    _nombre = snapshot.value['nombre'];
    _significado = snapshot.value['significado'];
    _cabeceramun = snapshot.value['cabeceramun'];
    _superficie = snapshot.value['superficie'];
    _altitud = snapshot.value['altitud'];
  }
}