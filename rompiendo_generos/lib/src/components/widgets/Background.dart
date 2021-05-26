import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'dart:ui';

BoxDecoration background() {
  return BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFFFFDEE9),
        Color(0xFFFFFFFF),
        Color(0xFFB5FFFC),
      ],
      stops: [
        0.0,
        0.4,
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
    backgroundColorStart: Color.fromARGB(221, 140, 222, 219),
    backgroundColorEnd: Color.fromARGB(255, 255, 255, 255),
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
