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
  String _lat;
  String _lon;
  String _elevacion;
  String _rio_canal;
  String _cuerpo;
  String _mas_poblados;
  String _mas_extenso;
  String _menos_poblado;
  String _industrializados;

  Municipio(this._id_igecem, this._nombre, this._significado, this._cabeceramun, this._superficie, this._altitud, this._clima, this._lat, this._lon,
      this._elevacion, this._rio_canal, this._cuerpo, this._mas_poblados, this._mas_extenso, this._menos_poblado, this._industrializados);

  Municipio.map(dynamic obj){
    this._nombre = obj['nombre'];
    this._significado = obj['significado'];
    this._cabeceramun = obj['cabeceramun'];
    this._superficie = obj['superficie'];
    this._altitud = obj['altitud'];
    this._clima = obj['clima'];
    this._lat = obj['lat'];
    this._lat = obj['lon'];
    this._elevacion = obj['elevaciones'];
    this._rio_canal = obj['riosycanales'];
    this._cuerpo = obj['cuerposdeagua'];
    this._mas_poblados = obj['maspoblado'];
    this._mas_extenso = obj['masextenso'];
    this._menos_poblado = obj['menosextenso'];
    this._industrializados = obj['masindustrializado'];
  }

  String get id_igecem => _id_igecem;
  String get nombre =>_nombre;
  String get significado => _significado;
  String get cabeceramun => _cabeceramun;
  String get superficie => _superficie;
  String get altitud => _altitud;
  String get clima => _clima;
  String get lat => _lat;
  String get lon => _lon;
  String get elevacion =>_elevacion;
  String get rio_canal => _rio_canal;
  String get cuerpo => _cuerpo;
  String get mas_poblado => _mas_poblados;
  String get mas_extenso => _mas_extenso;
  String get menos_poblado => _menos_poblado;
  String get industrializados => _industrializados;

  Municipio.fromSnapShop(DataSnapshot snapshot){
    _id_igecem = snapshot.key;
    _nombre = snapshot.value['nombre'];
    _significado = snapshot.value['significado'];
    _cabeceramun = snapshot.value['cabeceramun'];
    _superficie = snapshot.value['superficie'];
    _altitud = snapshot.value['altitud'];
    _clima = snapshot.value['clima'];
    _lat = snapshot.value['lat'];
    _lon = snapshot.value['lon'];
    _elevacion = snapshot.value['elevacion'];
    _rio_canal = snapshot.value['riocanal'];
    _cuerpo = snapshot.value['cuerpo'];
    _mas_poblados = snapshot.value['maspoblados'];
    _mas_extenso = snapshot.value['masextenso'];
    _menos_poblado = snapshot.value['menospoblado'];
    _industrializados = snapshot.value['industrializado'];
  }
}