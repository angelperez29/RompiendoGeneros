import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:rompiendo_generos/src/components/widgets/Background.dart';
import 'package:rompiendo_generos/src/components/widgets/CardCategories.dart';
import 'package:rompiendo_generos/src/components/widgets/Buttons.dart';
import 'package:rompiendo_generos/src/components/widgets/NavDrawer.dart';

class ScaffoldForProductsItems extends StatelessWidget {
  const ScaffoldForProductsItems({
    Key key,
    @required this.argumentsScreen,
  }) : super(key: key);

  final Map argumentsScreen;

  @override
  Widget build(BuildContext context) {
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
                CardCategories(
                  path: argumentsScreen['pathIcon'],
                  text: 'Mediana Sol',
                  route: '/EditItems',
                  categorie: 'Products',
                ),
                CardCategories(
                  path: argumentsScreen['pathIcon'],
                  text: 'Cubeta Medianas XX',
                  route: '/EditItems',
                  categorie: 'Products',
                ),
                CardCategories(
                  path: argumentsScreen['pathIcon'],
                  text: 'Cigarros',
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
        usrPrd: 'Agregando..',
      ),
    );
  }
}
