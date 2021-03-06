import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';
import 'package:desastresnaturales/ui/municipios_screen.dart';
import 'package:desastresnaturales/ui/municipios_information.dart';
import 'package:desastresnaturales/model/municipio.dart';
import '../authentication_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

import 'municipioZR_information.dart';

class ListViewMunicipioConsultor extends StatefulWidget {
  @override
  _ListViewMunicipioConsultorState createState() =>
      _ListViewMunicipioConsultorState();
}

final municipioReference =
    FirebaseDatabase.instance.reference().child('municipio');

class _ListViewMunicipioConsultorState
    extends State<ListViewMunicipioConsultor> {
  List<Municipio> items;
  StreamSubscription<Event> _onMunicipioAddedSubscription;
  StreamSubscription<Event> _onMunicipioChangedSubscription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    items = new List();
    _onMunicipioAddedSubscription =
        municipioReference.onChildAdded.listen(_onMunicipioAdded);
    _onMunicipioChangedSubscription =
        municipioReference.onChildChanged.listen(_onMunicipioUpdate);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _onMunicipioAddedSubscription.cancel();
    _onMunicipioChangedSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de municipios',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Municipios listado'),
          centerTitle: true,
          backgroundColor: Colors.deepOrangeAccent,
          leading: IconButton(
            icon: Icon(Icons.clear),
            onPressed: () => context.read<AuthenticationService>().signOut(),
          ),
        ),
        body: Center(
          child: ListView.builder(
              itemCount: items.length,
              padding: EdgeInsets.only(top: 12.0),
              itemBuilder: (context, position) {
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
                                '${items[position].nombre}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17.0,
                                ),
                              ),
                              subtitle: Text('${items[position].cabeceramun}',
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 14.0,
                                ),
                              ),
                              leading: Column(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundColor: Colors.cyan,
                                    radius: 17.0,
                                    child: Text('${items[position].id_igecem}',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              onTap: () => _navigateToMunicipio(
                                  context, items[position])),
                        ),

                        IconButton(
                            icon: Icon(
                              Icons.input,
                              color: Colors.blue,
                            ),
                            onPressed: () => _navigateToMunicipioZonaR(
                                context, items[position])),

                      ],
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }

  void _onMunicipioAdded(Event event) {
    setState(() {
      items.add(new Municipio.fromSnapShop(event.snapshot));
    });
  }

  void _onMunicipioUpdate(Event event) {
    var oldMunicipioValue = items
        .singleWhere((municipio) => municipio.id_igecem == event.snapshot.key);
    setState(() {
      items[items.indexOf(oldMunicipioValue)] =
          new Municipio.fromSnapShop(event.snapshot);
    });
  }

  void _navigateToMunicipio(BuildContext context, Municipio municipio) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MunicipioInformation(municipio)),
    );
  }
  void _navigateToMunicipioZonaR(BuildContext context, Municipio municipio) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MunicipioZR_information(municipio)),
    );
  }

}
