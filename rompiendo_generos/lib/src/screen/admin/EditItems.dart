import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:rompiendo_generos/src/components/widgets/Background.dart';
import 'package:rompiendo_generos/src/databases/DBManage.dart';

class EditItems extends StatefulWidget {
  EditItems({Key key}) : super(key: key);

  @override
  _EditItemsState createState() => _EditItemsState();
}

class _EditItemsState extends State<EditItems> {
  // Controladores para TextField
  final name = TextEditingController();
  final user = TextEditingController();
  final email = TextEditingController();
  final passwd = TextEditingController();
  // boleanos para checkbox
  bool _isCheckedCasher = false;
  bool _isCheckedWaitter = false;
  bool _isCheckedChef = false;
  // Variables para almacenamiento de datos ingresados
  String nameText = '';
  String userText = '';
  String emailText = '';
  String passwdText = '';
  // Lista para los roles del usuario
  List<String> rol = List();
  @override
  Widget build(BuildContext context) {
    Map argumentsScreen = ModalRoute.of(context).settings.arguments;
    if (argumentsScreen['categorie'] == 'Personal') {
      return Scaffold(
        appBar: gradientAppBar(argumentsScreen['text']),
        body: Container(
          decoration: background(),
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
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _userTextField('Pepe Pérez', 'Nombre', name),
                    _userTextField('UsuarioEjemplo', 'Usuario', user),
                    _emailTextField(),
                    _passwdTextField('Contraseña', passwd),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Roles a desempeñar\n',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: <Widget>[
                        Checkbox(
                          value: _isCheckedCasher,
                          onChanged: (v) {
                            setState(
                              () {
                                _isCheckedCasher = v;
                                if (_isCheckedCasher) {
                                  rol.add('cajero');
                                } else {
                                  rol.remove('cajero');
                                }
                              },
                            );
                          },
                        ),
                        Text('Cajero(a)'),
                        Checkbox(
                          value: _isCheckedWaitter,
                          onChanged: (v) {
                            setState(
                              () {
                                _isCheckedWaitter = v;
                                if (_isCheckedWaitter) {
                                  rol.add('mesero');
                                } else {
                                  rol.remove('mesero');
                                }
                              },
                            );
                          },
                        ),
                        Text('Mesero(a)'),
                        Checkbox(
                          value: _isCheckedChef,
                          onChanged: (v) {
                            setState(
                              () {
                                _isCheckedChef = v;
                                if (_isCheckedChef) {
                                  rol.add('cocinero');
                                } else {
                                  rol.remove('cocinero');
                                }
                              },
                            );
                          },
                        ),
                        Text('Cocinero(a)')
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _buttonSave(),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      // Fomulario para producto
      return Scaffold(
        appBar: gradientAppBar("Editando..."),
        body: Container(
          decoration: background(),
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
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _userTextField('Ejemplo de producto', 'Producto', user),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }

  Widget _userTextField(
      String hinttext, String label, TextEditingController control) {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: TextField(
            controller: control,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              icon: Icon(
                Icons.account_circle,
              ),
              hintText: hinttext,
              labelText: label,
            ),
            onChanged: (value) {},
          ),
        );
      },
    );
  }

  Widget _emailTextField() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: TextField(
            controller: email,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon(
                Icons.email,
              ),
              hintText: "example@domain.com",
              labelText: "Correo Electrónico",
            ),
            onChanged: (value) {},
          ),
        );
      },
    );
  }

  Widget _passwdTextField(String msg, TextEditingController controllerPasswd) {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: TextField(
            controller: controllerPasswd,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon(
                Icons.lock,
              ),
              hintText: "*******",
              labelText: msg,
            ),
            onChanged: (value) {},
          ),
        );
      },
    );
  }

  Widget _buttonSave() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 80.0,
              vertical: 15.0,
            ),
            child: Text(
              'Agregar',
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
            nameText = name.text;
            userText = user.text;
            emailText = email.text;
            passwdText = passwd.text;
            var manage = DBManage();

            if (nameText.isNotEmpty &&
                userText.isNotEmpty &&
                emailText.isNotEmpty &&
                passwdText.isNotEmpty &&
                (rol.length > 0)) {
              var response = manage.setDataEmployees(
                  nameText, userText, emailText, passwdText, rol);
            } else {
              // Mensaje de alerta
            }
          },
        );
      },
    );
  }
}
