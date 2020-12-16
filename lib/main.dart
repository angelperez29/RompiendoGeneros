import 'package:flutter/material.dart';
import 'src/screen/login_page.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Eliminamos la etiqueta de modo prueba
      debugShowCheckedModeBanner: false,
      title: "QueVaQuere'",
      theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
      // Rutas a pantallas
      routes: {
        '/login': (context) => LoginPage(),
      },
      // Pantalla inicial
      initialRoute: '/login',
    );
  }
}
