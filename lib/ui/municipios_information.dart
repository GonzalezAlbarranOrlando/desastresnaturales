

import 'package:desastresnaturales/map/map_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:desastresnaturales/model/municipio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:location_permissions/location_permissions.dart';

import 'menu_page.dart';

class MunicipioInformation extends StatefulWidget {

  final Municipio municipio;
  MunicipioInformation(this.municipio);

  @override
  _MunicipioInformationState createState() => _MunicipioInformationState();
}

final municipioReference = FirebaseDatabase.instance.reference().child('municipio');
final pri_aspectosReference = FirebaseDatabase.instance.reference().child('principalesaspectos');

class _MunicipioInformationState extends State<MunicipioInformation> {

  List<Municipio> items;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Información del municipio'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Container(
        //height: 400.0,
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Center(
              child: Column(
                children: <Widget>[
                  new Text("IGECEM : ${widget.municipio.id_igecem}", style: TextStyle(fontSize: 18.0),),
                  Padding(padding: EdgeInsets.only(top: 8.0),),
                  Divider(),
                  new Text("Nombre : ${widget.municipio.nombre}", style: TextStyle(fontSize: 18.0),),
                  Padding(padding: EdgeInsets.only(top: 8.0),),
                  Divider(),
                  new Text("Significado : ${widget.municipio.significado}", style: TextStyle(fontSize: 18.0),),
                  Padding(padding: EdgeInsets.only(top: 8.0),),
                  Divider(),
                  new Text("Cabecera Municipal : ${widget.municipio.cabeceramun}", style: TextStyle(fontSize: 18.0),),
                  Padding(padding: EdgeInsets.only(top: 8.0),),
                  Divider(),
                  new Text("Superficie (km2) : ${widget.municipio.superficie}", style: TextStyle(fontSize: 18.0),),
                  Padding(padding: EdgeInsets.only(top: 8.0),),
                  Divider(),
                  new Text("Altitud (msnmm): ${widget.municipio.altitud}", style: TextStyle(fontSize: 18.0),),
                  Padding(padding: EdgeInsets.only(top: 8.0),),
                  Divider(),
                  new Text("Clima : ${widget.municipio.clima}", style: TextStyle(fontSize: 18.0),),
                  Padding(padding: EdgeInsets.only(top: 8.0),),
                  Divider(),
                  new Text("Latitud : ${widget.municipio.lat}", style: TextStyle(fontSize: 18.0),),
                  Padding(padding: EdgeInsets.only(top: 8.0),),
                  Divider(),
                  new Text("Lomgitud : ${widget.municipio.lon}", style: TextStyle(fontSize: 18.0),),
                  Padding(padding: EdgeInsets.only(top: 8.0),),
                  Divider(),
                  new Text("Rio o Canal : ${widget.municipio.lat}", style: TextStyle(fontSize: 18.0),),
                  Padding(padding: EdgeInsets.only(top: 8.0),),
                  Divider(),
                  new Text("Cuerpo de agua : ${widget.municipio.lat}", style: TextStyle(fontSize: 18.0),),
                  Padding(padding: EdgeInsets.only(top: 8.0),),
                  Divider(),
                  new Text("Más poblado : ${widget.municipio.lat}", style: TextStyle(fontSize: 18.0),),
                  Padding(padding: EdgeInsets.only(top: 8.0),),
                  Divider(),
                  new Text("Más extenso : ${widget.municipio.lat}", style: TextStyle(fontSize: 18.0),),
                  Padding(padding: EdgeInsets.only(top: 8.0),),
                  Divider(),
                  new Text("Menos poblado : ${widget.municipio.lat}", style: TextStyle(fontSize: 18.0),),
                  Padding(padding: EdgeInsets.only(top: 8.0),),
                  Divider(),
                  new Text("Industrializado : ${widget.municipio.lat}", style: TextStyle(fontSize: 18.0),),
                  Padding(padding: EdgeInsets.only(top: 8.0),),
                  Divider(),
                  RaisedButton(onPressed:  () {
                    LocationPermissions().openAppSettings().then((bool hasOpened) =>
                        debugPrint('App Settings opened: ' + hasOpened.toString()));
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Map_page()));
                    },child: Text("Ubicación"),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  List<Widget> createWidgetList() {
    final List<Widget> widgets = LocationPermissionLevel.values
        .map<Widget>((LocationPermissionLevel level) => PermissionWidget(level))
        .toList();

      widgets.add(StreamingStatusWidget());


    return widgets;
  }
}

class StreamingStatusWidget extends StatelessWidget {
  final Stream<ServiceStatus> statusStream =
      LocationPermissions().serviceStatus;

  @override
  Widget build(BuildContext context) => ListTile(
    title: const Text('ServiceStatus'),
    subtitle: StreamBuilder<ServiceStatus>(
      stream: statusStream,
      initialData: ServiceStatus.unknown,
      builder: (_, AsyncSnapshot<ServiceStatus> snapshot) =>
          Text('${snapshot.data}'),
    ),
  );
}

class PermissionWidget extends StatefulWidget {
  const PermissionWidget(this._permissionLevel);

  final LocationPermissionLevel _permissionLevel;

  @override
  _PermissionState createState() => _PermissionState(_permissionLevel);
}

class _PermissionState extends State<PermissionWidget> {
  _PermissionState(this._permissionLevel);

  final LocationPermissionLevel _permissionLevel;
  PermissionStatus _permissionStatus = PermissionStatus.unknown;

  @override
  void initState() {
    super.initState();

    _listenForPermissionStatus();
  }

  void _listenForPermissionStatus() {
    final Future<PermissionStatus> statusFuture =
    LocationPermissions().checkPermissionStatus();

    statusFuture.then((PermissionStatus status) {
      setState(() {
        _permissionStatus = status;
      });
    });
  }

  Color getPermissionColor() {
    switch (_permissionStatus) {
      case PermissionStatus.denied:
        return Colors.red;
      case PermissionStatus.granted:
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(_permissionLevel.toString()),
      subtitle: Text(
        _permissionStatus.toString(),
        style: TextStyle(color: getPermissionColor()),
      ),
      trailing: IconButton(
          icon: const Icon(Icons.info),
          onPressed: () {
            checkServiceStatus(context, _permissionLevel);
          }),
      onTap: () {
        requestPermission(_permissionLevel);
      },
    );
  }

  void checkServiceStatus(
      BuildContext context, LocationPermissionLevel permissionLevel) {
    LocationPermissions()
        .checkServiceStatus()
        .then((ServiceStatus serviceStatus) {
      final SnackBar snackBar =
      SnackBar(content: Text(serviceStatus.toString()));

      Scaffold.of(context).showSnackBar(snackBar);
    });
  }

  Future<void> requestPermission(
      LocationPermissionLevel permissionLevel) async {
    final PermissionStatus permissionRequestResult = await LocationPermissions()
        .requestPermissions(permissionLevel: permissionLevel);

    setState(() {
      print(permissionRequestResult);
      _permissionStatus = permissionRequestResult;
      print(_permissionStatus);
    });
  }
}
