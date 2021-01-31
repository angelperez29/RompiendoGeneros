import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:rompiendo_generos/src/components/widgets/Background.dart';
import 'package:rompiendo_generos/src/components/widgets/Buttons.dart';
import 'package:rompiendo_generos/src/components/widgets/CardCategoriesEditing.dart';
import 'package:rompiendo_generos/src/components/widgets/NavDrawer.dart';

class ItemsOfCategorie extends StatefulWidget {
  ItemsOfCategorie({
    Key key,
  }) : super(key: key);

  @override
  _ItemsOfCategorieState createState() => _ItemsOfCategorieState();
}

class _ItemsOfCategorieState extends State<ItemsOfCategorie> {
  List userDataEmy;
  List dataE;
  List dataP;
  List userDataPrd;
  String url = 'http://10.0.0.34:8000/getDataDB';

  getDataEmployees() async {
    http.Response response = await http.get(url + '/employees');
    dataE = json.decode(response.body);
    setState(
      () {
        userDataEmy = dataE;
      },
    );
  }

  getDataProducts() async {
    http.Response response = await http.get(url + '/products');
    dataP = json.decode(response.body);
    setState(
      () {
        userDataPrd = dataP;
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getDataEmployees();
    getDataProducts();
  }

  @override
  Widget build(BuildContext context) {
    Map argumentsScreen = ModalRoute.of(context).settings.arguments;
    if (argumentsScreen['categorie'] == 'Personal') {
      // Formulario para empleados
      return Scaffold(
        drawer: NavDrawer(),
        appBar: gradientAppBar(
          argumentsScreen['categorie'],
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
              child: ListView.builder(
                // Si la lista de empleados esta vacia no se muestra nada
                // dado que pasamos un 0 al index y por ende termina el proceso
                itemCount: userDataEmy == null ? 0 : userDataEmy.length,
                itemBuilder: (BuildContext context, int index) {
                  return CardCategoriesEditing(
                    path: argumentsScreen['pathIcon'],
                    text: userDataEmy[index]['name'],
                    subtext: userDataEmy[index]['_id'] +
                        '\n' +
                        userDataEmy[index]['email'],
                    route: '/EditItems',
                    categorie: 'Personal',
                    data: userDataEmy,
                    id: userDataEmy[index]['_id'],
                  );
                },
              ),
            ),
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: BottonFloatingAdd(
          route: '/EditItems',
          categorie: argumentsScreen['categorie'],
          usrPrd: 'Agregando...',
        ),
      );
    } else {
      // Formulario para productos
      return Scaffold(
        drawer: NavDrawer(),
        appBar: gradientAppBar(
          argumentsScreen['categorie'],
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
              child: ListView.builder(
                itemCount: userDataPrd == null ? 0 : userDataPrd.length,
                itemBuilder: (BuildContext context, int index) {
                  if (userDataPrd[index]['categorie'] ==
                      argumentsScreen['categorie']) {
                    return CardCategoriesEditing(
                      path: argumentsScreen['pathIcon'],
                      text: userDataPrd[index]['name'],
                      subtext: '\$' + userDataPrd[index]['price'],
                      route: '/EditItems',
                      categorie: argumentsScreen['categorie'],
                      data: userDataPrd,
                      id: userDataPrd[index]['_id'],
                    );
                  } else {
                    return Text('');
                  }
                },
              ),
            ),
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: BottonFloatingAdd(
          route: '/EditItems',
          categorie: argumentsScreen['categorie'],
          usrPrd: 'Agregando...',
        ),
      );
    }
  }
}
