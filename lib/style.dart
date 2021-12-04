import 'package:flutter/material.dart';

final ThemeData style = ThemeData(
  fontFamily: 'Poppins',
  primarySwatch: Colors.blueGrey,
  primaryColor: const Color.fromRGBO(108, 180, 238, 1),
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 26,
      color: Color.fromRGBO(37, 41, 88, 1),
    ),
    headline2: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 24,
      color: Color.fromRGBO(37, 41, 88, 1),
    ),
    headline3: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 22,
      color: Color.fromRGBO(37, 41, 88, 1),
    ),
    bodyText1: TextStyle(
      fontSize: 22,
      color: Color.fromRGBO(37, 41, 88, 1),
    ),
    bodyText2: TextStyle(
      fontSize: 20,
      color: Color.fromRGBO(37, 41, 88, 1),
    ),
    subtitle1: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.black54,
    ),
  ),
);
