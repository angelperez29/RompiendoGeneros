import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rompiendo_generos/src/components/general/Background.dart';

class EditItems extends StatefulWidget {
  EditItems({Key key}) : super(key: key);

  @override
  _EditItemsState createState() => _EditItemsState();
}

class _EditItemsState extends State<EditItems> {
  @override
  Widget build(BuildContext context) {
    if (true) {
    } else {}
    return Scaffold(
      appBar: gradientAppBar("Editando..."),
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
              child: GridView.count(crossAxisCount: 1)),
        ),
      ),
    );
  }
}
