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
  final product = TextEditingController();
  final productID = TextEditingController();
  final email = TextEditingController();
  final passwd = TextEditingController();
  // boleanos para checkbox
  bool isCheckedCasher = false;
  bool isCheckedWaitter = false;
  bool isCheckedChef = false;
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
      return scaffoldEditPersonal(argumentsScreen);
    } else {
      // Fomulario para producto
      return Scaffold(
        appBar: gradientAppBar(
          argumentsScreen['text'],
        ),
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
                    userTextField(
                      'Ejemplo de producto',
                      'Producto',
                      product,
                    ),
                    userTextField(
                      'IdentificadorEjemplo',
                      'ID Producto',
                      productID,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    buttonSave(),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }

  Scaffold scaffoldEditPersonal(Map argumentsScreen) {
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
                  userTextField('Pepe Pérez', 'Nombre', name),
                  userTextField('UsuarioEjemplo', 'Usuario', user),
                  emailTextField(),
                  passwdTextField('Contraseña', passwd),
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
                        value: isCheckedCasher,
                        onChanged: (v) {
                          setState(
                            () {
                              isCheckedCasher = v;
                              if (isCheckedCasher) {
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
                        value: isCheckedWaitter,
                        onChanged: (v) {
                          setState(
                            () {
                              isCheckedWaitter = v;
                              if (isCheckedWaitter) {
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
                        value: isCheckedChef,
                        onChanged: (v) {
                          setState(
                            () {
                              isCheckedChef = v;
                              if (isCheckedChef) {
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
                  buttonSave(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget userTextField(
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

  Widget emailTextField() {
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

  Widget passwdTextField(String msg, TextEditingController controllerPasswd) {
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

  Widget buttonSave() {
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
              manage.setDataEmployees(
                  nameText, userText, emailText, passwdText, rol, 'active');
            } else {
              // Mensaje de alerta
            }
          },
        );
      },
    );
  }
}
