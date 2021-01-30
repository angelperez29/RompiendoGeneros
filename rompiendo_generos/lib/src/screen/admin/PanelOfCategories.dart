import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:rompiendo_generos/src/components/widgets/Background.dart';
import 'package:rompiendo_generos/src/components/widgets/CardCategories.dart';
import 'package:rompiendo_generos/src/components/widgets/NavDrawer.dart';

class PanelOfCategories extends StatefulWidget {
  PanelOfCategories({Key key}) : super(key: key);

  @override
  _PanelOfCategoriesState createState() => _PanelOfCategoriesState();
}

class _PanelOfCategoriesState extends State<PanelOfCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: gradientAppBar("Panel de administración"),
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
            child: GridView.count(
              padding: EdgeInsets.symmetric(
                horizontal: 25.0,
              ),
              crossAxisCount: 1,
              childAspectRatio: 2.1,
              children: <Widget>[
                // Tarjetas de las categorias
                CardCategories(
                  path: 'assets/images/personal.png',
                  text: 'Personal',
                  subtext: '',
                  route: '/ItemsOfCategorie',
                  categorie: 'Personal',
                ),
                CardCategories(
                  path: 'assets/images/comercial.png',
                  text: 'Lo más comercial',
                  subtext: '',
                  route: '/ItemsOfCategorie',
                  categorie: 'Lo más comercial',
                ),
                CardCategories(
                  path: 'assets/images/cocteleria.png',
                  text: 'Coctelería',
                  subtext: '',
                  route: '/ItemsOfCategorie',
                  categorie: 'Coctelería',
                ),
                CardCategories(
                  path: 'assets/images/copa.png',
                  text: 'Copas',
                  subtext: '',
                  route: '/ItemsOfCategorie',
                  categorie: 'Copas',
                ),
                CardCategories(
                  path: 'assets/images/wine.png',
                  text: 'Botellas',
                  subtext: '',
                  route: '/ItemsOfCategorie',
                  categorie: 'Botellas',
                ),
                CardCategories(
                  path: 'assets/images/bebidasSinAlcohol.png',
                  text: 'Bebidas sin alcohol',
                  subtext: '',
                  route: '/ItemsOfCategorie',
                  categorie: 'Bebidas sin alcohol',
                ),
                CardCategories(
                  path: 'assets/images/coffee.png',
                  text: 'Bebidas calientes',
                  subtext: '',
                  route: '/ItemsOfCategorie',
                  categorie: 'Bebidas calientes',
                ),
                CardCategories(
                  path: 'assets/images/food.png',
                  text: 'Botanas y antojitos',
                  subtext: '',
                  route: '/ItemsOfCategorie',
                  categorie: 'Botanas y antojitos',
                ),
                CardCategories(
                  path: 'assets/images/promociones.png',
                  text: 'Promociones',
                  subtext: '',
                  route: '/ItemsOfCategorie',
                  categorie: 'Promociones',
                ),
                CardCategories(
                  path: 'assets/images/copaRota.png',
                  text: 'En caso de romper cristalería',
                  subtext: '',
                  route: '/ItemsOfCategorie',
                  categorie: 'En caso de romper cristalería',
                ),
                CardCategories(
                  path: 'assets/images/copaRota.png',
                  text: 'Cortesías',
                  subtext: '',
                  route: '/ItemsOfCategorie',
                  categorie: 'Cortesías',
                ),
                CardCategories(
                  path: 'assets/images/copaRota.png',
                  text: 'Para llevar',
                  subtext: '',
                  route: '/ItemsOfCategorie',
                  categorie: 'Para llevar',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
