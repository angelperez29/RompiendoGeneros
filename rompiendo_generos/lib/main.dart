import 'package:flutter/material.dart';
// Screen para inicio de sesión
import 'src/screen/LogInPage.dart';
// Screen para administradores
import 'src/screen/admin/PanelOfCategories.dart';
import 'src/screen/admin/ItemsOfCategorie.dart';
import 'src/screen/admin/AddCategorie.dart';
import 'src/screen/admin/EditItems.dart';
// Screen para meseros
import 'src/screen/waiters/SelectAddClient.dart';
import 'src/screen/waiters/SelectCategorie.dart';
import 'src/screen/waiters/InputOrder.dart';
// Screen para información de la app o desarrollador
import 'src/screen/dev/About.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Eliminamos la etiqueta de modo prueba
      debugShowCheckedModeBanner: false,
      title: "Rompiendo Géneros'",
      theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
      // Rutas a pantallas
      routes: {
        '/Login': (context) => LogInPage(),
        // Administración
        '/PanelOfCategories': (context) => PanelOfCategories(),
        '/ItemsOfCategorie': (context) => ItemsOfCategorie(),
        '/AddCategorie': (context) => AddCategorie(),
        '/EditItems': (context) => EditItems(),
        // Meseros
        '/SelectAddclient': (context) => SelectAddClient(),
        '/SelectCategorie': (context) => SelectCategorie(),
        '/InputOrder': (context) => InputOrder(),
        // Developer
        '/About': (context) => About(),
      },
      // Pantalla inicial
      initialRoute: '/Login',
    );
  }
}
