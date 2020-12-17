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
            // Tarjetas de las categorias
            CardCategories(
              path: 'assets/images/personal.png',
              text: 'Personal',
              route: '/ItemsOfCategorie',
              screen: 'Personal',
            ),
            CardCategories(
              path: 'assets/images/comercial.png',
              text: 'Lo más comercial',
              route: '/ItemsOfCategorie',
              screen: 'Lo más comercial',
            ),
            CardCategories(
              path: 'assets/images/cocteleria.png',
              text: 'Coctelería',
              route: '/ItemsOfCategorie',
              screen: 'Coctelería',
            ),
            CardCategories(
              path: 'assets/images/copa.png',
              text: 'Copas',
              route: '/ItemsOfCategorie',
              screen: 'Copas',
            ),
            CardCategories(
              path: 'assets/images/wine.png',
              text: 'Botellas',
              route: '/ItemsOfCategorie',
              screen: 'Botellas',
            ),
            CardCategories(
              path: 'assets/images/bebidasSinAlcohol.png',
              text: 'Bebidas sin alcohol',
              route: '/ItemsOfCategorie',
              screen: 'Bebidas sin alcohol',
            ),
            CardCategories(
              path: 'assets/images/coffee.png',
              text: 'Bebidas calientes',
              route: '/ItemsOfCategorie',
              screen: 'Bebidas calientes',
            ),
            CardCategories(
              path: 'assets/images/food.png',
              text: 'Botanas y antojitos',
              route: '/ItemsOfCategorie',
              screen: 'Botanas y antojitos',
            ),
            CardCategories(
              path: 'assets/images/promociones.png',
              text: 'Promociones',
              route: '/ItemsOfCategorie',
              screen: 'Promociones',
            ),
            CardCategories(
              path: 'assets/images/copaRota.png',
              text: 'En caso de romper cristalería',
              route: '/ItemsOfCategorie',
              screen: 'En caso de romper cristalería',
            ),
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}
