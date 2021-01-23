import 'package:flutter/material.dart';

class BottonFloatingAdd extends StatelessWidget {
  final String route;
  final String categorie;
  final String usrPrd;

  const BottonFloatingAdd({
    Key key,
    @required this.route,
    @required this.categorie,
    @required this.usrPrd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 15,
      child: Icon(
        Icons.add,
      ),
      onPressed: () {
        Navigator.of(context).pushNamed(
          route,
          arguments: {
            'screen': categorie,
            'usrPrd': usrPrd,
          },
        );
      },
    );
  }
}

class BottomFloatingExit extends StatelessWidget {
  final String route;
  final String categorie;

  const BottomFloatingExit({
    Key key,
    @required this.route,
    this.categorie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 10,
      child: Icon(
        Icons.exit_to_app,
      ),
      backgroundColor: Colors.blueGrey,
      onPressed: () {
        Navigator.of(context).popAndPushNamed(route);
      },
    );
  }
}
