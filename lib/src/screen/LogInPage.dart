import 'package:flutter/material.dart';
import 'package:rompiendo_generos/src/components/general/Background.dart';

class LogInPage extends StatefulWidget {
  LogInPage({Key key}) : super(key: key);

  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(""),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: background(),
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
    );
  }
}

Widget _userTextField() {
  return StreamBuilder(
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(
              Icons.email,
            ),
            hintText: "user/example@domain.com",
            labelText: "Usuario/Correo Electrónico",
          ),
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
          keyboardType: TextInputType.emailAddress,
          obscureText: true,
          decoration: InputDecoration(
            icon: Icon(
              Icons.lock,
            ),
            hintText: "Contraseña",
            labelText: "Contraseña",
          ),
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
          Navigator.of(context).pushNamed("/PanelOfCategories");
        },
      );
    },
  );
}
