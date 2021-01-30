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
  // Controladores para TextField para empleados
  final name = TextEditingController();
  final user = TextEditingController();
  final email = TextEditingController();
  final passwd = TextEditingController();
  // Controladores para TextField para productos
  final product = TextEditingController();
  final productID = TextEditingController();
  // boleanos para checkbox
  bool isCheckedCasher = false;
  bool isCheckedWaitter = false;
  bool isCheckedChef = false;
  // Variables para almacenamiento de datos ingresados de empleados
  String nameText = '';
  String userText = '';
  String emailText = '';
  String passwdText = '';
  // Variables para almacenamiento de datos ingresados de productos
  String productText = '';
  String productIDText = '';
  // Lista para los roles del usuario
  List<String> rol = List();
  @override
  Widget build(BuildContext context) {
    Map argumentsScreen = ModalRoute.of(context).settings.arguments;
    if (argumentsScreen['categorie'] == 'Personal') {
      // Formulario para empleados
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
                        Text(
                          'Cocinero(a)',
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    buttonSave(
                      'Guardar', // txt
                      argumentsScreen['text'], // action
                      argumentsScreen['categorie'], // categorie,
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
                    buttonSave(
                      'Guardar', // txt
                      argumentsScreen['text'], // action
                      argumentsScreen['categorie'], // categorie
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }

  // Metodo para guardar o actualizar los registros de la DB
  // Parametros:
  // txt:=> etiqueta del botón
  // action:=> acción a realizar (Agregar o actualizar)
  // categorie:=> Categoria a la que pertence el objeto
  Widget buttonSave(String txt, String action, String categorie) {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 80.0,
              vertical: 15.0,
            ),
            child: Text(
              txt,
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
          onPressed: () async {
            var manage = DBManage();
            nameText = name.text;
            userText = user.text;
            emailText = email.text;
            passwdText = passwd.text;
            productText = product.text;
            productIDText = productIDText;

            if (action == 'Agregando...') {
              if (categorie == 'Personal') {
                if (nameText.isNotEmpty &&
                    userText.isNotEmpty &&
                    emailText.isNotEmpty &&
                    passwdText.isNotEmpty &&
                    (rol.length > 0)) {
                  var response = await manage.setDataEmployees(
                      nameText, userText, emailText, passwdText, rol, 'active');
                  if (response.statusCode == 202) {
                  } else {}
                } else {
                  // Mensaje de alerta
                  print('Agregando personal pero no hay nada en los campos');
                }
              } else {
                // productos
                print('Agregando productos pero no hay nada en los campos');
              }
            } else {
              // Actualizando
              if (categorie == 'Personal') {
                print('Actualizado personal pero no hay nada en los campos');
              } else {
                print('Actualizado productos pero no hay nada en los campos');
              }
            }
          },
        );
      },
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
}
