import 'package:flutter/material.dart';
import 'package:rompiendo_generos/src/components/widgets/Background.dart';
import 'package:rompiendo_generos/src/components/widgets/NavDrawer.dart';

class About extends StatefulWidget {
  About({Key key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Side menu
      drawer: NavDrawer(),
      appBar: gradientAppBar("Acerca"),
      body: Container(
        decoration: background(),
        child: Center(
          child: Text(
            'Acerca del desarrollador\n' +
                'Florentino Ángel Pérez Arce\n' +
                'Contacto: \n' +
                'Email: angel.perez.29.21@protonmail.com\n' +
                'LinkedIn: Florentino Ángel Pérez Arce\n',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
