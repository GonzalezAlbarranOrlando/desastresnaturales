import 'package:desastresnaturales/main.dart';
import 'package:desastresnaturales/ui/listview_municipios.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import '../authentication_service.dart';
import 'listview_municipiosConsultor.dart';
import 'listview_zonariesgo.dart';
import 'listview_zonariesgoConsultor.dart';

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
          leading: IconButton(
            icon: Icon(Icons.clear),
            onPressed: () => context.read<AuthenticationService>().signOut(),
            //onPressed: () => _createNewMunicipio(context),
          ),
        ),
        body: Center(
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 5.0),),

                new Text("Municipios", style: TextStyle(fontSize: 30.0),),

                Padding(padding: EdgeInsets.only(top: 5.0),),
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
                  child: Text('Lista de municipios'),
                ),
                Padding(padding: EdgeInsets.only(top: 5.0),),

                new Text("Zonas de riesgo", style: TextStyle(fontSize: 30.0),),
                Padding(padding: EdgeInsets.only(top: 5.0),),

                RaisedButton(
                  onPressed: () {
                    if (str_email == "administrador@gmail.com") {
                      Fluttertoast.showToast(msg: "Todos los riesgos");
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ListViewZonariesgo("todo")));
                    }else{
                      Fluttertoast.showToast(msg: "Todos los riesgos");
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ListViewZonariesgoConsultor("todo")));
                    }
                  },
                  child: Text('Todos los riesgos'),
                ),
                Padding(padding: EdgeInsets.only(top: 5.0),),

                RaisedButton(
                  onPressed: () {
                    if (str_email == "administrador@gmail.com") {
                      Fluttertoast.showToast(msg: "Zona sísmica");
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ListViewZonariesgo("Zona sísmica")));

                    }else{
                      Fluttertoast.showToast(msg: "Zona sísmica");
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ListViewZonariesgoConsultor("Zona sísmica")));
                    }
                  },
                  child: Text('Zona sísmica'),
                ),
                Padding(padding: EdgeInsets.only(top: 5.0),),

                RaisedButton(
                  onPressed: () {
                    if (str_email == "administrador@gmail.com") {
                      Fluttertoast.showToast(msg: "Inundaciones");
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ListViewZonariesgo("Inundaciones")));
                    }else{
                      Fluttertoast.showToast(msg: "Inundaciones");
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ListViewZonariesgoConsultor("Inundaciones")));
                    }
                  },
                  child: Text('Inundaciones'),
                ),
                Padding(padding: EdgeInsets.only(top: 5.0),),

                RaisedButton(
                  onPressed: () {
                    if (str_email == "administrador@gmail.com") {
                      Fluttertoast.showToast(msg: "Deslave");
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ListViewZonariesgo("Deslave")));
                    }else{
                      Fluttertoast.showToast(msg: "Deslave");
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ListViewZonariesgoConsultor("Deslave")));
                    }
                  },
                  child: Text('Deslave'),
                ),

                Padding(padding: EdgeInsets.only(top: 5.0),),

                RaisedButton(
                  onPressed: () {
                    if (str_email == "administrador@gmail.com") {
                      Fluttertoast.showToast(msg: "Incendio forestal");
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ListViewZonariesgo("Incendio forestal")));
                    }else{
                      Fluttertoast.showToast(msg: "Incendio forestal");
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ListViewZonariesgoConsultor("Incendio forestal")));
                    }
                  },
                  child: Text('Incendio forestal'),
                ),

                Padding(padding: EdgeInsets.only(top: 5.0),),

                RaisedButton(
                  onPressed: () {
                    if (str_email == "administrador@gmail.com") {
                      Fluttertoast.showToast(msg: "Zona volcánica");
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ListViewZonariesgo("Zona volcánica")));
                    }else{
                      Fluttertoast.showToast(msg: "Zona volcánica");
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ListViewZonariesgoConsultor("Zona volcánica")));
                    }
                  },
                  child: Text('Zona volcánica'),
                ),

                Padding(padding: EdgeInsets.only(top: 5.0),),

                RaisedButton(
                  onPressed: () {
                    if (str_email == "administrador@gmail.com") {
                      Fluttertoast.showToast(msg: "Derrumbes");
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ListViewZonariesgo("Derrumbes")));
                    }else{
                      Fluttertoast.showToast(msg: "Derrumbes");
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ListViewZonariesgoConsultor("Derrumbes")));
                    }
                  },
                  child: Text('Derrumbes'),
                ),

              ],
            )),
      ),
    );
  }
}
