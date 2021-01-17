import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'dart:ui';

BoxDecoration background() {
  return BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color.fromARGB(244, 238, 154, 255),
        Color.fromARGB(255, 255, 255, 255),
        Color.fromARGB(244, 127, 227, 245),
        Color.fromARGB(244, 238, 154, 255),
      ],
      stops: [
        0.0,
        0.2,
        0.8,
        0.9,
      ],
    ),
  );
}

AppBar appbar(String msg) {
  return AppBar(
    title: Text(
      msg,
      style: TextStyle(
        color: Colors.brown,
        fontSize: 18,
      ),
    ),
    backgroundColor: Colors.transparent,
    elevation: 0.0,
  );
}

GradientAppBar gradientAppBar(String msg) {
  return GradientAppBar(
    title: Text(
      msg,
      style: TextStyle(
        color: Colors.brown,
        fontSize: 18,
      ),
    ),
    elevation: 15.0,
    backgroundColorEnd: Color.fromARGB(221, 140, 222, 219),
    backgroundColorStart: Color.fromARGB(255, 255, 255, 255),
  );
}

BoxDecoration backgroundImageBlur() {
  return BoxDecoration(
    image: DecorationImage(
      image: ExactAssetImage(
        'assets/images/rgcb30g.png',
      ),
      fit: BoxFit.cover,
    ),
  );
}
