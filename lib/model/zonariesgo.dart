import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Zonariesgo{
  String _id;
  String _id_igecem;
  String _desastre;

  Zonariesgo(this._id_igecem, this._id, this._desastre);

  Zonariesgo.map(dynamic obj){
    this._id_igecem = obj['igecem'];
    this._desastre = obj['desastre'];
  }

  String get id => _id;
  String get id_igecem => _id_igecem;
  String get desastre =>_desastre;

  Zonariesgo.fromSnapShop(DataSnapshot snapshot){
    _id = snapshot.key;
    _id_igecem = snapshot.value['igecem'];
    _desastre = snapshot.value['desastre'];
  }
}