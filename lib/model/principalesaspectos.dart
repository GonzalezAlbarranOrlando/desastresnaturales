import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Principales_aspectos{
  String _id_igecem;
  String _elevacion;
  String _rio_canal;
  String _cuerpo;
  String _mas_poblados;
  String _mas_extenso;
  String _menos_poblado;
  String _industrializados;

  Principales_aspectos(this._id_igecem, this._elevacion, this._rio_canal, this._cuerpo, this._mas_poblados, this._mas_extenso, this._menos_poblado, this._industrializados);

  Principales_aspectos.map(dynamic obj){
    this._elevacion = obj['elevacion'];
    this._rio_canal = obj['riocanal'];
    this._cuerpo = obj['cuerpo'];
    this._mas_poblados = obj['maspoblados'];
    this._mas_extenso = obj['masextenso'];
    this._menos_poblado = obj['menospoblado'];
    this._industrializados = obj['industrializado'];
  }

  String get id_igecem => _id_igecem;
  String get elevacion =>_elevacion;
  String get rio_canal => _rio_canal;
  String get cuerpo => _cuerpo;
  String get mas_poblado => _mas_poblados;
  String get altitud => _mas_extenso;
  String get clima => _menos_poblado;
  String get localizacion => _industrializados;

  Principales_aspectos.fromSnapShop(DataSnapshot snapshot){
    _id_igecem = snapshot.key;
    _elevacion = snapshot.value['nombre'];
    _rio_canal = snapshot.value['significado'];
    _cuerpo = snapshot.value['cabeceramun'];
    _mas_poblados = snapshot.value['superficie'];
    _mas_extenso = snapshot.value['altitud'];
    _menos_poblado = snapshot.value['clima'];
    _industrializados = snapshot.value['localizacion'];
  }
}