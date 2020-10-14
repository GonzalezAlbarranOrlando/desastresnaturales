import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Municipio{
  String _id_igecem;
  String _nombre;
  String _significado;
  String _cabeceramun;
  String _superficie;
  String _altitud;
  String _clima;
  String _localizacion;

  Municipio(this._id_igecem, this._nombre, this._significado, this._cabeceramun, this._superficie, this._altitud, this._clima, this._localizacion);

  Municipio.map(dynamic obj){
    this._nombre = obj['nombre'];
    this._significado = obj['significado'];
    this._cabeceramun = obj['cabeceramun'];
    this._superficie = obj['superficie'];
    this._altitud = obj['altitud'];
    this._clima = obj['clima'];
    this._localizacion = obj['localización'];
  }

  String get id_igecem => _id_igecem;
  String get nombre =>_nombre;
  String get significado => _significado;
  String get cabeceramun => _cabeceramun;
  String get superficie => _superficie;
  String get altitud => _altitud;
  String get clima => _clima;
  String get localizacion => _localizacion;

  Municipio.fromSnapShop(DataSnapshot snapshot){
    _id_igecem = snapshot.key;
    _nombre = snapshot.value['nombre'];
    _significado = snapshot.value['significado'];
    _cabeceramun = snapshot.value['cabeceramun'];
    _superficie = snapshot.value['superficie'];
    _altitud = snapshot.value['altitud'];
    _clima = snapshot.value['clima'];
    _localizacion = snapshot.value['localizacion'];
  }
}