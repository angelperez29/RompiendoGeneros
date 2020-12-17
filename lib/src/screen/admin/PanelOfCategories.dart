import 'package:flutter/material.dart';
import 'package:rompiendo_generos/src/components/general/Background.dart';
import 'package:rompiendo_generos/src/components/general/CardCategories.dart';

class PanelOfCategories extends StatefulWidget {
  PanelOfCategories({Key key}) : super(key: key);

  @override
  _PanelOfCategoriesState createState() => _PanelOfCategoriesState();
}

class _PanelOfCategoriesState extends State<PanelOfCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: gradientAppBar("Panel de administración"),
      body: Container(
        decoration: background(),
        child: GridView.count(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          crossAxisCount: 1,
          childAspectRatio: 2.6,
          children: <Widget>[
            CardCategories(
              path: 'assets/images/personal.png',
              text: 'Personal',
              route: '/ItemsOfCategorie',
              screen: 'Personal',
            )
          ],
        ),
      ),
    );
  }
}
