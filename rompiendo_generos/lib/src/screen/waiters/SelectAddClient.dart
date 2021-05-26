import 'package:flutter/material.dart';
import 'package:rompiendo_generos/src/components/widgets/Background.dart';
import 'package:rompiendo_generos/src/components/widgets/Buttons.dart';
import 'package:rompiendo_generos/src/components/waiters/NavDrawerEmployees.dart';

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
      drawer: NavDrawerEmployees(),
      body: Container(
        decoration: background(),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: BottomFloatingExit(route: '/Login'),
    );
  }
}
