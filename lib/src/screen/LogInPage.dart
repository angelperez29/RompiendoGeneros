import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rompiendo_generos/src/components/general/Background.dart';

class LogInPage extends StatefulWidget {
  LogInPage({Key key}) : super(key: key);

  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  // Controladores de los textfield
  final user = TextEditingController();
  final passwd = TextEditingController();
  // Variables donde se alamacenaran los datos ingresados a los textfield
  String userText = '';
  String passwdText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(""),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: backgroundImageBlur(),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 10.0,
            sigmaY: 10.0,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(
                0.0,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Image.asset(
                    "assets/images/login.png",
                    height: 250,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                _userTextField(),
                SizedBox(
                  height: 20,
                ),
                _passwdTextField(),
                SizedBox(
                  height: 40,
                ),
                _buttonLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _userTextField() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: TextField(
            controller: user,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon(
                Icons.email,
              ),
              hintText: "user/example@domain.com",
              labelText: "Usuario/Correo Electrónico",
            ),
            onChanged: (value) {},
          ),
        );
      },
    );
  }

  Widget _passwdTextField() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: TextField(
            controller: passwd,
            keyboardType: TextInputType.emailAddress,
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(
                Icons.lock,
              ),
              hintText: "Contraseña",
              labelText: "Contraseña",
            ),
            onChanged: (value) {},
          ),
        );
      },
    );
  }

  Widget _buttonLogin() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: Text(
              'Iniciar Sesión',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              20.0,
            ),
          ),
          elevation: 15.0,
          color: Colors.cyan[200],
          onPressed: () {
            userText = user.text;
            passwdText = passwd.text;
            if (userText.toLowerCase() == 'admin') {
              Navigator.of(context).pushNamedAndRemoveUntil(
                '/PanelOfCategories',
                (Route<dynamic> route) => false,
              );
            } else {
              Navigator.of(context).pushNamedAndRemoveUntil(
                '/SelectAddclient',
                (Route<dynamic> route) => false,
              );
            }
          },
        );
      },
    );
  }
}
