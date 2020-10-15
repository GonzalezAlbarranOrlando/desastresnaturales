import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Zonariesgo{
  String _id;
  String _igecem;
  String _desastre;
  String _nombreMunicipio;

  Zonariesgo(this._id,this._igecem, this._desastre, this._nombreMunicipio);

  Zonariesgo.map(dynamic obj){
    this._igecem = obj['igecem'];
    this._nombreMunicipio = obj['nombre'];
    this._desastre = obj['desastre'];
  }

  String get id => _id;
  String get igecem => _igecem;
  String get nombreMunicipio => _nombreMunicipio;
  String get desastre =>_desastre;

  Zonariesgo.fromSnapShop(DataSnapshot snapshot){
    _id = snapshot.key;
    _igecem = snapshot.value['igecem'];
    _nombreMunicipio = snapshot.value['nombre'];
    _desastre = snapshot.value['desastre'];
  }
}