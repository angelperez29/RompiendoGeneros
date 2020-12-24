import 'package:flutter/material.dart';
import 'package:rompiendo_generos/src/components/general/Background.dart';
import 'package:rompiendo_generos/src/components/general/Buttons.dart';
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
              categorie: 'Personal',
            ),
            CardCategories(
              path: 'assets/images/comercial.png',
              text: 'Lo más comercial',
              route: '/ItemsOfCategorie',
              categorie: 'Lo más comercial',
            ),
            CardCategories(
              path: 'assets/images/cocteleria.png',
              text: 'Coctelería',
              route: '/ItemsOfCategorie',
              categorie: 'Coctelería',
            ),
            CardCategories(
              path: 'assets/images/copa.png',
              text: 'Copas',
              route: '/ItemsOfCategorie',
              categorie: 'Copas',
            ),
            CardCategories(
              path: 'assets/images/wine.png',
              text: 'Botellas',
              route: '/ItemsOfCategorie',
              categorie: 'Botellas',
            ),
            CardCategories(
              path: 'assets/images/bebidasSinAlcohol.png',
              text: 'Bebidas sin alcohol',
              route: '/ItemsOfCategorie',
              categorie: 'Bebidas sin alcohol',
            ),
            CardCategories(
              path: 'assets/images/coffee.png',
              text: 'Bebidas calientes',
              route: '/ItemsOfCategorie',
              categorie: 'Bebidas calientes',
            ),
            CardCategories(
              path: 'assets/images/food.png',
              text: 'Botanas y antojitos',
              route: '/ItemsOfCategorie',
              categorie: 'Botanas y antojitos',
            ),
            CardCategories(
              path: 'assets/images/promociones.png',
              text: 'Promociones',
              route: '/ItemsOfCategorie',
              categorie: 'Promociones',
            ),
            CardCategories(
              path: 'assets/images/copaRota.png',
              text: 'En caso de romper cristalería',
              route: '/ItemsOfCategorie',
              categorie: 'En caso de romper cristalería',
            ),
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: BottomFloatingExit(
        route: '/Login',
      ),
    );
  }
}
