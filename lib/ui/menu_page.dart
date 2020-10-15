import 'package:desastresnaturales/main.dart';
import 'package:desastresnaturales/ui/listview_municipios.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import '../authentication_service.dart';
import 'listview_municipiosConsultor.dart';
import 'listview_zonariesgo.dart';

class Menu_page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Menú'),
          centerTitle: true,
          backgroundColor: Colors.deepOrangeAccent,
        ),
        body: Center(
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                RaisedButton(
                  onPressed: () {
                    //Fluttertoast.showToast(msg: "Bienvenido-" +context.read<AuthenticationService>().get_email());
                    //Fluttertoast.showToast(msg: "Bienvenido-" + str_email);
                    if (str_email == "administrador@gmail.com") {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ListViewMunicipio()));
                    }else{
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ListViewMunicipioConsultor()));
                    }
                  },
                  child: Text('Todos los municipios'),
                ),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Zonas de riesgo", style: TextStyle(fontSize: 30.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                RaisedButton(
                  onPressed: () {
                    if (str_email == "administrador@gmail.com") {
                      Fluttertoast.showToast(msg: "Todos los riesgos");
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ListViewZonariesgo()));
                    }else{
                      Fluttertoast.showToast(msg: "Todos los riesgos");
                    }
                  },
                  child: Text('Todos los riesgos'),
                ),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                RaisedButton(
                  onPressed: () {
                    if (str_email == "administrador@gmail.com") {
                      Fluttertoast.showToast(msg: "Zona sísmica");
                    }else{
                      Fluttertoast.showToast(msg: "Zona sísmica");
                    }
                  },
                  child: Text('Zona sísmica'),
                ),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                RaisedButton(
                  onPressed: () {
                    if (str_email == "administrador@gmail.com") {
                      Fluttertoast.showToast(msg: "Inundaciones");
                    }else{
                      Fluttertoast.showToast(msg: "Inundaciones");
                    }
                  },
                  child: Text('Inundaciones'),
                ),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
              ],
            )),
      ),
    );
  }
}
