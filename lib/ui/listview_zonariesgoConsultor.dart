import 'package:desastresnaturales/model/zonariesgo.dart';
import 'package:desastresnaturales/ui/zonariesgo_information.dart';
import 'package:desastresnaturales/ui/zonariesgo_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';
import 'package:desastresnaturales/ui/municipios_screen.dart';
import 'package:desastresnaturales/ui/municipios_information.dart';
import 'package:desastresnaturales/model/municipio.dart';
import '../authentication_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

class ListViewZonariesgoConsultor extends StatefulWidget {
  String nombre;
  ListViewZonariesgoConsultor(this.nombre);
  @override
  _ListViewZonariesgoConsultorState createState() => _ListViewZonariesgoConsultorState(nombre);
}

final zonariesgoReference =
    FirebaseDatabase.instance.reference().child('zonariesgo');

class _ListViewZonariesgoConsultorState extends State<ListViewZonariesgoConsultor> {
  String nombre;
  _ListViewZonariesgoConsultorState(this.nombre);
  List<Zonariesgo> items;
  StreamSubscription<Event> _onZonariesgoAddedSubscription;
  StreamSubscription<Event> _onZonariesgoChangedSubscription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    items = new List();
    _onZonariesgoAddedSubscription =
        zonariesgoReference.onChildAdded.listen(_onZonariesgoAdded);
    _onZonariesgoChangedSubscription =
        zonariesgoReference.onChildChanged.listen(_onZonariesgoUpdate);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _onZonariesgoAddedSubscription.cancel();
    _onZonariesgoChangedSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de las zonas de riesgo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lista de las zonas de riesgo'),
          centerTitle: true,
          backgroundColor: Colors.deepOrangeAccent,
          leading: IconButton(
            icon: Icon(Icons.cancel),
            onPressed: () => context.read<AuthenticationService>().signOut(),
          ),
        ),
        body: Center(
          child: ListView.builder(
              itemCount: items.length,
              padding: EdgeInsets.only(top: 12.0),
              itemBuilder: (context, position) {
                String str;
                str = "Zona sísmica";
                str = "Inundaciones";
                str = "Deslave";
                str = "Incendio forestal";
                str = "Zona volcánica";
                str = "Derrumbes";
                str = "todo";
                str = nombre;

                if(str == "todo"){
                  return Column(
                    children: <Widget>[
                      Divider(
                        height: 7.0,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: ListTile(
                                title: Text(
                                  '${items[position].desastre}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17.0,
                                  ),
                                ),
                                subtitle: Text(
                                  '${items[position].nombreMunicipio}',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 13.0,
                                  ),
                                ),
                                leading: Column(
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundColor: Colors.cyan,
                                      radius: 15.0,
                                      child: Text(
                                        '${position + 1}',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                onTap: () => _navigateToZonariesgo(
                                    context, items[position])),
                          ),


                        ],
                      ),
                    ],
                  );
                }

                else if (items[position].desastre == str) {
                  return Column(
                    children: <Widget>[
                      Divider(
                        height: 7.0,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: ListTile(
                                title: Text(
                                  '${items[position].desastre}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17.0,
                                  ),
                                ),
                                subtitle: Text(
                                  '${items[position].nombreMunicipio}',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 13.0,
                                  ),
                                ),
                                leading: Column(
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundColor: Colors.cyan,
                                      radius: 15.0,
                                      child: Text(
                                        '${position + 1}',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                onTap: () => _navigateToZonariesgo(
                                    context, items[position])),
                          ),


                        ],
                      ),
                    ],
                  );
                }else{
                  return Column();
                }
              }),
        ),

      ),
    );
  }

  void _onZonariesgoAdded(Event event) {
    setState(() {
      items.add(new Zonariesgo.fromSnapShop(event.snapshot));
    });
  }

  void _onZonariesgoUpdate(Event event) {
    var oldZonariesgoValue =
        items.singleWhere((zonariesgo) => zonariesgo.id == event.snapshot.key);
    setState(() {
      items[items.indexOf(oldZonariesgoValue)] =
          new Zonariesgo.fromSnapShop(event.snapshot);
    });
  }

  void _deleteZonariesgo(
      BuildContext context, Zonariesgo zonariesgo, int position) async {
    await zonariesgoReference.child(zonariesgo.id).remove().then((_) {
      setState(() {
        items.removeAt(position);
      });
    });
  }

  void _navigateToZonariesgoInformation(
      BuildContext context, Zonariesgo zonariesgo) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ZonariesgoScreen(zonariesgo)),
    );
  }

  void _navigateToZonariesgo(
      BuildContext context, Zonariesgo zonariesgo) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ZonariesgoInformation(zonariesgo)),
    );
  }
}
