import 'package:clinic_reservation_app/providers/login_controller.dart';
import 'package:clinic_reservation_app/providers/singup_controller.dart';
import 'package:clinic_reservation_app/screens/about_us_screen.dart';
import 'package:clinic_reservation_app/screens/apoointments_screen.dart';
import 'package:clinic_reservation_app/screens/doctors_screen.dart';
import 'package:clinic_reservation_app/screens/home_screen.dart';
import 'package:clinic_reservation_app/screens/location_screen.dart';
import 'package:clinic_reservation_app/screens/login_screen.dart';
import 'package:clinic_reservation_app/screens/monthly_board_screen.dart';
import 'package:clinic_reservation_app/screens/products_screen.dart';
import 'package:clinic_reservation_app/screens/profile_screen.dart';
import 'package:clinic_reservation_app/screens/request_appointment_screen.dart';
import 'package:clinic_reservation_app/screens/signup_screen.dart';
import 'package:clinic_reservation_app/style.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginController(),
        ),
        ChangeNotifierProvider(
          create: (context) => SingupController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: style,
        home: const LoginScreen(),
        routes: {
          SignUpScreen.routeName: (context) => const SignUpScreen(),
          LoginScreen.routeName: (context) => const LoginScreen(),
          HomeScreen.routeName: (context) => const HomeScreen(),
          ProfileScreen.routeName: (context) => const ProfileScreen(),
          AppointmentsScareen.routeName: (compute) =>
              const AppointmentsScareen(),
          AboutUsScreen.routeName: (context) => const AboutUsScreen(),
          ProductsScreen.routeName: (context) => const ProductsScreen(),
          LocationScreen.routeName: (context) => const LocationScreen(),
          MonthlyBoardScreen.routeName: (context) => const MonthlyBoardScreen(),
          RequestAppointmentScreen.routeName: (context) =>
              const RequestAppointmentScreen(),
          DoctorsScreen.routeName: (context) => const DoctorsScreen(),
        },
      ),
    );
  }
}
