import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:rompiendo_generos/src/components/general/Background.dart';
import 'package:rompiendo_generos/src/components/general/CardCategories.dart';
import 'package:rompiendo_generos/src/components/general/Buttons.dart';
import 'package:rompiendo_generos/src/components/general/NavDrawer.dart';

class ScaffoldForEmployesItems extends StatelessWidget {
  const ScaffoldForEmployesItems({
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
                  text: 'Angel',
                  route: '/EditItems',
                  categorie: 'Angel',
                ),
                CardCategories(
                  path: argumentsScreen['pathIcon'],
                  text: 'Beto',
                  route: '/EditItems',
                  categorie: 'Beto',
                ),
                CardCategories(
                  path: argumentsScreen['pathIcon'],
                  text: 'Mony',
                  route: '/EditItems',
                  categorie: 'Mony',
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
        usrPrd: argumentsScreen['categorie'],
      ),
    );
  }
}
