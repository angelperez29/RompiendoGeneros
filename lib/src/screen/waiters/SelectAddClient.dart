import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rompiendo_generos/src/components/general/Background.dart';
import 'package:rompiendo_generos/src/components/general/Buttons.dart';

class SelectAddClient extends StatefulWidget {
  SelectAddClient({Key key}) : super(key: key);

  @override
  _SelectAddClientState createState() => _SelectAddClientState();
}

class _SelectAddClientState extends State<SelectAddClient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: gradientAppBar('Seleccione o agregue al cliente'),
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
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: BottomFloatingExit(route: '/Login'),
    );
  }
}
