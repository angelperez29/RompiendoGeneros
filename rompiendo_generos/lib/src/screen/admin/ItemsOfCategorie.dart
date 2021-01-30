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
    http.Response response = await http.get(url + '/employees');
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
              child: GridView.count(
                padding: EdgeInsets.symmetric(
                  horizontal: 25.0,
                ),
                crossAxisCount: 1,
                childAspectRatio: 2.1,
                children: <Widget>[
                  CardCategoriesEditing(
                    path: argumentsScreen['pathIcon'],
                    text: 'Mediana Sol',
                    subtext: 'Mediana Sol',
                    route: '/EditItems',
                    categorie: 'Products',
                  ),
                  CardCategoriesEditing(
                    path: argumentsScreen['pathIcon'],
                    text: 'Cubeta Medianas XX',
                    subtext: 'Cubeta Medianas XX',
                    route: '/EditItems',
                    categorie: 'Products',
                  ),
                  CardCategoriesEditing(
                    path: argumentsScreen['pathIcon'],
                    text: 'Cigarros',
                    subtext: 'Cigarros',
                    route: '/EditItems',
                    categorie: 'Products',
                  ),
                ],
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
