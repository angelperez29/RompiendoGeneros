import 'package:flutter/material.dart';

class ItemsOfCategorie extends StatefulWidget {
  ItemsOfCategorie({Key key}) : super(key: key);

  @override
  _ItemsOfCategorieState createState() => _ItemsOfCategorieState();
}

class _ItemsOfCategorieState extends State<ItemsOfCategorie> {
  @override
  Widget build(BuildContext context) {
    Map argumentsScreen = ModalRoute.of(context).settings.arguments;
    if(argumentsScreen['']){}
    return Container();
  }
}
