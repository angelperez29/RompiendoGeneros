import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rompiendo_generos/src/components/general/Background.dart';

class ItemsOfCategorie extends StatefulWidget {
  ItemsOfCategorie({Key key}) : super(key: key);

  @override
  _ItemsOfCategorieState createState() => _ItemsOfCategorieState();
}

class _ItemsOfCategorieState extends State<ItemsOfCategorie> {
  @override
  Widget build(BuildContext context) {
    Map argumentsScreen = ModalRoute.of(context).settings.arguments;
    if (argumentsScreen['categorie'] == 'Personal') {
      return Scaffold(
        appBar: gradientAppBar(
          argumentsScreen['categorie'],
        ),
        body: Container(
          decoration: backgroundImageBlur(),
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
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: gradientAppBar(
          argumentsScreen['categorie'],
        ),
        body: Container(
          decoration: backgroundImageBlur(),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10.0,
              sigmaY: 10.0,
            ),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(
                0.0,
              )),
            ),
          ),
        ),
      );
    }
  }
}
