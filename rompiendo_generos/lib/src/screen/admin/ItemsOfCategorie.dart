import 'package:flutter/material.dart';
import 'package:rompiendo_generos/src/components/admin/ScaffoldForEmployesItems.dart';
import 'package:rompiendo_generos/src/components/admin/ScaffoldForProductsItems.dart';

class ItemsOfCategorie extends StatefulWidget {
  ItemsOfCategorie({
    Key key,
  }) : super(key: key);

  @override
  _ItemsOfCategorieState createState() => _ItemsOfCategorieState();
}

class _ItemsOfCategorieState extends State<ItemsOfCategorie> {
  @override
  Widget build(BuildContext context) {
    Map argumentsScreen = ModalRoute.of(context).settings.arguments;
    if (argumentsScreen['categorie'] == 'Personal') {
      return ScaffoldForEmployesItems(
        argumentsScreen: argumentsScreen,
      );
    } else {
      return ScaffoldForProductsItems(
        argumentsScreen: argumentsScreen,
      );
    }
  }
}
