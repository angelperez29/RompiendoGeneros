import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:rompiendo_generos/src/components/widgets/Background.dart';
import 'package:rompiendo_generos/src/components/widgets/NavDrawer.dart';
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
  final price = TextEditingController();
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
  String priceText = '';
  String idProduct;
  // Lista para los roles del usuario
  List<String> rol = List();
  @override
  Widget build(BuildContext context) {
    Map argumentsScreen = ModalRoute.of(context).settings.arguments;
    if (argumentsScreen['categorie'] == 'Personal') {
      // Formulario para empleados
      List data = argumentsScreen['data'];
      if (data.isNotEmpty) {
        data.forEach(
          (element) {
            if (element['_id'] == argumentsScreen['id']) {
              name.text = element['name'];
              user.text = element['user'];
              email.text = element['email'];
              passwd.text = element['passwd'];
              List roles = element['rol'];
              print(rol);
              if (roles.isNotEmpty && rol.isEmpty) {
                setState(
                  () {
                    rol = List<String>.from(roles);
                    isCheckedCasher = rol.contains('cajero');
                    isCheckedChef = rol.contains('cocinero');
                    isCheckedWaitter = rol.contains('mesero');
                  },
                );
                roles.clear();
              }
            }
          },
        );
      }
      return Scaffold(
        drawer: NavDrawer(),
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
      List data = argumentsScreen['data'];
      if (data.isNotEmpty) {
        data.forEach(
          (element) {
            if (element['_id'] == argumentsScreen['id']) {
              product.text = element['name'];
              price.text = element['price'];
              setState(() {
                idProduct = element['_id'];
              });
            }
          },
        );
      }
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
                      'Nombre de producto',
                      product,
                    ),
                    userTextField(
                      '15',
                      'Precio',
                      price,
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
            priceText = price.text;

            if (action == 'Agregando...') {
              if (categorie == 'Personal') {
                if (nameText.isNotEmpty &&
                    userText.isNotEmpty &&
                    emailText.isNotEmpty &&
                    passwdText.isNotEmpty &&
                    (rol.length > 0)) {
                  var response = await manage.setDataEmployees(
                    nameText,
                    userText,
                    emailText,
                    passwdText,
                    rol,
                    'active',
                  );
                  if (response.statusCode == 202) {
                    // mensaje de almacenado y regresamos a ItemsOfCategories
                    _showDialogSaveOk(
                      'Excelente, tenemos nuevo personal',
                      'La información del empleado ha sido almacenado correctamente',
                    );
                  } else {
                    // mensaje de error y regresamos permanecemos en este lugar
                    _showDialogAlert(
                      'Atención ',
                      'Hubo un error al almacenar la información favor de contactar al desarrollador',
                    );
                  }
                } else {
                  _showDialogAlert(
                    'Atención',
                    'No puede haber un campo vació',
                  );
                }
              } else {
                if (productText.isNotEmpty && priceText.isNotEmpty) {
                  if (idProduct.isEmpty) {
                    idProduct = productText.toLowerCase().replaceAll(' ', '') +
                        categorie.toLowerCase().replaceAll(' ', '') +
                        priceText;
                  }
                  var response = await manage.setDataProducts(
                    idProduct,
                    productText,
                    categorie,
                    priceText,
                  );
                  if (response.statusCode == 202) {
                    // mensaje de almacenado y regresamos a ItemsOfCategorie
                    _showDialogSaveOk(
                      'Excelente, tenemos más productos',
                      'La información del producto ha sido almacenado correctamente',
                    );
                  } else {
                    // mensaje de error y regresamos permanecemos en este lugar
                    _showDialogAlert(
                      'Atención hubo un error al almacenar la información',
                      'Favor de contactar al desarrollador',
                    );
                  }
                } else {
                  //Mensaje de alerta de algún campo vació
                  _showDialogAlert(
                    'Atención',
                    'No puede haber un campo vació',
                  );
                }
              }
            } else {
              // Actualizando la DB
              if (categorie == 'Personal') {
                if (nameText.isNotEmpty &&
                    userText.isNotEmpty &&
                    emailText.isNotEmpty &&
                    passwdText.isNotEmpty &&
                    (rol.length > 0)) {
                  var response = await manage.updateDataEmployees(
                    nameText,
                    userText,
                    emailText,
                    passwdText,
                    rol,
                    'active',
                  );
                  if (response.statusCode == 202) {
                    // mensaje de almacenado y regresamos a ItemsOfCategories
                    _showDialogSaveOk(
                      'Bien, se actualizo personal',
                      'La información del empleado ha sido actualizado correctamente',
                    );
                  } else {
                    // mensaje de error y regresamos permanecemos en este lugar
                    _showDialogAlert(
                      'Atención ',
                      'Hubo un error al actualizar la información favor de contactar al desarrollador',
                    );
                  }
                } else {
                  _showDialogAlert(
                    'Atención',
                    'No puede haber un campo vació',
                  );
                }
              } else {
                // Actualizado productos
                if (productText.isNotEmpty && priceText.isNotEmpty) {
                  if (idProduct.isEmpty) {
                    idProduct = productText.toLowerCase().replaceAll(' ', '') +
                        categorie.toLowerCase().replaceAll(' ', '') +
                        priceText;
                  }
                  var response = await manage.updateDataProducts(
                    idProduct,
                    productText,
                    categorie,
                    priceText,
                  );
                  if (response.statusCode == 202) {
                    // mensaje de actualizado y regresamos a ItemsOfCategorie
                    _showDialogSaveOk(
                      'Excelente, actualizado correcto',
                      'La información del producto ha sido actualizada correctamente',
                    );
                  } else {
                    // mensaje de error y regresamos permanecemos en este lugar
                    _showDialogAlert(
                      'Atención hubo un error al actualizar la información',
                      'Favor de contactar al desarrollador',
                    );
                  }
                } else {
                  //Mensaje de alerta de algún campo vació
                  _showDialogAlert(
                    'Atención',
                    'No puede haber un campo vació',
                  );
                }
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

  void _showDialogAlert(String alert, String notice) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text(alert),
          content: Text(notice),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            FlatButton(
              child: Text("Aceptar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showDialogSaveOk(String alert, String notice) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text(alert),
          content: Text(notice),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            FlatButton(
              child: Text("Aceptar"),
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  '/PanelOfCategories',
                  (Route<dynamic> route) => false,
                );
              },
            ),
          ],
        );
      },
    );
  }
}
