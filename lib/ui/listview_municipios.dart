import 'package:desastresnaturales/ui/principales_aspectos.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';
import 'package:desastresnaturales/ui/municipios_screen.dart';
import 'package:desastresnaturales/ui/municipios_information.dart';
import 'package:desastresnaturales/model/municipio.dart';
import '../authentication_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

class ListViewMunicipio extends StatefulWidget {
  @override
  _ListViewMunicipioState createState() => _ListViewMunicipioState();
}

final municipioReference = FirebaseDatabase.instance.reference().child('municipio');

class _ListViewMunicipioState extends State<ListViewMunicipio> {
  List<Principal_aspecto> items;
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
            icon: Icon(Icons.cancel),
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
                              subtitle: Text(
                                '${items[position].cabeceramun}',
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
                                        fontSize: 18.0,
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
                              Icons.folder_open,
                              color: Colors.deepPurpleAccent,
                            ),
                            onPressed: () => _principalesaspectos(
                                context, items[position])),
                        IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () => _deleteMunicipio(
                                context, items[position], position)),
                        IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: Colors.greenAccent,
                            ),
                            onPressed: () => _navigateToMunicipioInformation(
                                context, items[position])),
                      ],
                    ),
                  ],
                );
              }),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Colors.amber,
          onPressed: () => _createNewMunicipio(context),
        ),
      ),
    );
  }

  void _onMunicipioAdded(Event event) {
    setState(() {
      items.add(new Principal_aspecto.fromSnapShop(event.snapshot));
    });
  }

  void _onMunicipioUpdate(Event event) {
    var oldMunicipioValue =
        items.singleWhere((municipio) => municipio.id_igecem == event.snapshot.key);
    setState(() {
      items[items.indexOf(oldMunicipioValue)] =
          new Principal_aspecto.fromSnapShop(event.snapshot);
    });
  }

  void _deleteMunicipio(
      BuildContext context, Principal_aspecto municipio, int position) async {
    await municipioReference.child(municipio.id_igecem).remove().then((_) {
      setState(() {
        items.removeAt(position);
      });
    });
  }

  void _navigateToMunicipioInformation(
      BuildContext context, Principal_aspecto municipio) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MunicipioScreen(municipio)),
    );
  }

  void _principalesaspectos(
      BuildContext context, Principal_aspecto municipio) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PrincipalesAspectos(municipio)),
    );
  }

  void _navigateToMunicipio(BuildContext context, Principal_aspecto municipio) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MunicipioInformation(municipio)),
    );
  }

  void _createNewMunicipio(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => MunicipioScreen(Principal_aspecto('', '', '', '', '','','','',''))),
    );
  }
}
