import 'package:clinic_reservation_app/screens/home_screen.dart';
import 'package:clinic_reservation_app/screens/login_screen.dart';
import 'package:clinic_reservation_app/screens/signup_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.blueGrey,
        primaryColor: Colors.amber,
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
        ),
      ),
      home: const LoginScreen(),
      routes: {
        SignUpScreen.routeName: (context) => const SignUpScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
      },
    );
  }
}
