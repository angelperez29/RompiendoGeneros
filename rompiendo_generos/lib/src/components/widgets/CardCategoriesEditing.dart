import 'package:flutter/material.dart';
import '../../databases/DBManage.dart';

class CardCategoriesEditing extends StatelessWidget {
  final String path;
  final String text;
  final String subtext;
  final String categorie;
  final String route;
  final String id;
  final String state;
  final List data;

  const CardCategoriesEditing({
    Key key,
    @required this.path,
    @required this.text,
    @required this.subtext,
    @required this.route,
    @required this.categorie,
    @required this.data,
    @required this.id,
    @required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (state == 'active') {
      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text(
                this.text,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Sarina',
                ),
              ),
              subtitle: Text(
                this.subtext,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Sarina',
                ),
              ),
              leading: Image.asset(
                this.path,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                _buttonEdit(
                  this.categorie,
                  this.route,
                  this.text,
                  this.path,
                  this.data,
                  this.id,
                ),
                _buttonDelete(
                  this.categorie,
                  this.route,
                  this.text,
                  this.path,
                  this.data,
                  this.id,
                ),
              ],
            ),
          ],
        ),
        elevation: 15.0,
        color: Color.fromARGB(239, 239, 239, 238),
      );
    } else {
      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text(
                this.text,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Sarina',
                ),
              ),
              subtitle: Text(
                this.subtext,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Sarina',
                ),
              ),
              leading: Image.asset(
                this.path,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                _buttonUndo(
                  this.categorie,
                  this.route,
                  this.text,
                  this.path,
                  this.data,
                  this.id,
                ),
              ],
            ),
          ],
        ),
        elevation: 15.0,
        color: Color.fromARGB(239, 239, 239, 238),
      );
    }
  }
}

Widget _buttonEdit(String categorie, String route, String text, String pathIcon,
    List data, String id) {
  return StreamBuilder(
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return IconButton(
        icon: Icon(
          Icons.edit,
        ),
        iconSize: 30,
        tooltip: "Administrar",
        onPressed: () {
          Navigator.of(context).pushNamed(
            route,
            arguments: {
              'categorie': categorie,
              'text': text,
              'pathIcon': pathIcon,
              'data': data,
              'id': id,
            },
          );
        },
      );
    },
  );
}

Widget _buttonDelete(String categorie, String route, String text,
    String pathIcon, List data, String id) {
  DBManage manage = DBManage();
  return StreamBuilder(
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return IconButton(
        icon: Icon(
          Icons.delete,
        ),
        iconSize: 30,
        tooltip: "Eliminar registro",
        onPressed: () async {
          var response;
          if (categorie == 'Personal') {
            // actualizamos al personal de manera que su status sea = inactive
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(
                    'Atención, esta seguro de remover empleado',
                  ),
                  content: Text(
                    'Tome en cuenta que ya no podrá laborar para usted',
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('Aceptar'),
                      onPressed: () async {
                        String name;
                        String user;
                        String email;
                        String passwd;
                        List<String> rol;

                        data.forEach(
                          (element) {
                            if (element['_id'] == id) {
                              name = element['name'];
                              user = element['user'];
                              email = element['email'];
                              passwd = element['passwd'];
                              rol = List<String>.from(element['rol']);
                            }
                          },
                        );
                        response = await manage.updateDataEmployees(
                          name,
                          user,
                          email,
                          passwd,
                          rol,
                          'inactive',
                        );
                        if (response.statusCode == 202) {
                          // mensaje de almacenado y regresamos a ItemsOfCategories
                          showDialog202(
                            context,
                            'Realizado',
                            'El empleado ha sido removido',
                          );
                        } else {
                          // mensaje de error y regresamos permanecemos en este lugar
                          showDialog404(context, 'Error',
                              'Fallo la conexión con el servido\nFavor de contactar al desarrollador');
                        }
                      },
                    ),
                    FlatButton(
                      child: Text('Cancelar'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          } else {
            // Eliminamos el producto de nuestra base de datos
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(
                    'Atención, esta a punto de eliminar un producto',
                  ),
                  content: Text(
                    'Si usted elimina este producto ya no podrán visualizarlo sus empleados',
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('Aceptar'),
                      onPressed: () async {
                        response = await manage.deleteProduct(id);
                        if (response.statusCode == 202) {
                          // mensaje de almacenado y regresamos a ItemsOfCategories
                          showDialog202(
                            context,
                            'Realizado',
                            'El producto ha sido eliminado',
                          );
                        } else {
                          // mensaje de error y regresamos permanecemos en este lugar
                          showDialog404(context, 'Error',
                              'Fallo la conexión con el servido\nFavor de contactar al desarrollador');
                        }
                      },
                    ),
                    FlatButton(
                      child: Text('Cancelar'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          }
        },
      );
    },
  );
}

Widget _buttonUndo(String categorie, String route, String text, String pathIcon,
    List data, String id) {
  DBManage manage = DBManage();
  return StreamBuilder(
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return IconButton(
        icon: Icon(
          Icons.undo_rounded,
        ),
        iconSize: 30,
        tooltip: "Devolver registro",
        onPressed: () async {
          var response;
          if (categorie == 'Personal') {
            // actualizamos al personal de manera que su status sea = inactive
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(
                    'Atención, ¿Está seguro de reingresar al empleado?',
                  ),
                  content: Text(
                    'Tome en cuenta que volverá laborar para usted',
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('Aceptar'),
                      onPressed: () async {
                        String name;
                        String user;
                        String email;
                        String passwd;
                        List<String> rol;

                        data.forEach(
                          (element) {
                            if (element['_id'] == id) {
                              name = element['name'];
                              user = element['user'];
                              email = element['email'];
                              passwd = element['passwd'];
                              rol = List<String>.from(element['rol']);
                            }
                          },
                        );
                        response = await manage.updateDataEmployees(
                          name,
                          user,
                          email,
                          passwd,
                          rol,
                          'active',
                        );
                        if (response.statusCode == 202) {
                          // mensaje de almacenado y regresamos a ItemsOfCategories
                          showDialog202(
                            context,
                            'Realizado',
                            'El empleado ha sido reingresado',
                          );
                        } else {
                          // mensaje de error y regresamos permanecemos en este lugar
                          showDialog404(context, 'Error',
                              'Fallo la conexión con el servido\nFavor de contactar al desarrollador');
                        }
                      },
                    ),
                    FlatButton(
                      child: Text('Cancelar'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          }
        },
      );
    },
  );
}

Future showDialog404(BuildContext context, String title, String content) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          FlatButton(
            child: Text('Aceptar'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future showDialog202(BuildContext context, String title, String content) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          FlatButton(
            child: Text('Aceptar'),
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                '/PanelOfCategories',
                (Route<dynamic> route) => false,
              );
            },
          )
        ],
      );
    },
  );
}
