import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rompiendo_generos/src/components/widgets/Background.dart';

class EditItems extends StatefulWidget {
  EditItems({Key key}) : super(key: key);

  @override
  _EditItemsState createState() => _EditItemsState();
}

class _EditItemsState extends State<EditItems> {
  final user = TextEditingController();
  final passwd = TextEditingController();
  bool _isCheckedCasher = false;
  bool _isCheckedWaitter = false;
  bool _isCheckedChef = false;
  String userText = '';
  String passwdText = '';
  List<String> rol = List();
  @override
  Widget build(BuildContext context) {
    Map argumentsScreen = ModalRoute.of(context).settings.arguments;
    if (argumentsScreen['categorie'] == 'Personal') {
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
                    _userTextField(),
                    _emailTextField(),
                    _passwdTextField('Contraseña'),
                    _passwdTextField('Repita su contraseña'),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Roles a desempeñar\n',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
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
                            print(rol);
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
                                print(rol);
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
                                print(rol);
                              },
                            );
                          },
                        ),
                        Text('Cocinero(a)')
                      ],
                    ),
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
                    _userTextField(),
                  ],
                ),
              ),
            ),
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
            controller: user,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              icon: Icon(
                Icons.account_circle,
              ),
              hintText: "User Example",
              labelText: "Usuario",
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
            controller: user,
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

  Widget _passwdTextField(String msg) {
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

  Widget _checkBoxRoles() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        bool _value = true;
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Checkbox(
            activeColor: Colors.amber,
            value: _value,
            onChanged: (value) {
              setState(
                () {
                  _value = value;
                },
              );
            },
          ),
        );
      },
    );
  }
}
