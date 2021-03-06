import 'package:desastresnaturales/ui/listview_municipiosConsultor.dart';
import 'package:desastresnaturales/ui/menu_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:desastresnaturales/ui/listview_municipios.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'authentication_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


String str_email = "";

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
          context.read<AuthenticationService>().authStateChanges,
        ),
      ],
      child: MaterialApp(
        home: AuthenticationWrapper(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseuser = context.watch<User>();
    if (firebaseuser != null) {
      if (str_email == "administrador@gmail.com") {
        Fluttertoast.showToast(msg: "Bienvenido Administrador");
        return Menu_page();
      }else if (str_email == "consultor@gmail.com"){
        Fluttertoast.showToast(msg: "Bienvenido Consultor");
        return Menu_page();
      }else{
        Fluttertoast.showToast(msg: "Ingresa datos correctos");
      }
    }
    return Login_page();
  }
}

class Login_page extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ingresar'),
          centerTitle: true,
          backgroundColor: Colors.deepOrangeAccent,
        ),
        body: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(labelText: "Ingresa el correo electrónico"),
                ),
                TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: "Ingresa la contraseña"),
                  obscureText: true,
                ),
                RaisedButton(
                  onPressed: () {
                    str_email = emailController.text.trim();
                    context.read<AuthenticationService>().signIn(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim());
                  },
                  child: Text('Ingresar'), color: Colors.deepOrangeAccent, textColor: Colors.white,
                )
              ],
            )),
      ),
    );
  }
}


