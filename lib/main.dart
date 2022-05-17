import 'package:clinic_reservation_app/firebase_options.dart';
import 'package:clinic_reservation_app/providers/appointmets_provider.dart';
import 'package:clinic_reservation_app/providers/auth.dart';
import 'package:clinic_reservation_app/providers/bar_provider.dart';
import 'package:clinic_reservation_app/providers/date_selector.dart';
import 'package:clinic_reservation_app/providers/doctors_provider.dart';
import 'package:clinic_reservation_app/providers/login_controller.dart';
import 'package:clinic_reservation_app/providers/products_provider.dart';
import 'package:clinic_reservation_app/providers/request_appointment_provider.dart';
import 'package:clinic_reservation_app/providers/singup_controller.dart';
import 'package:clinic_reservation_app/providers/user_provider.dart';
import 'package:clinic_reservation_app/screens/about_us_screen.dart';
import 'package:clinic_reservation_app/screens/appointments_screen.dart';
import 'package:clinic_reservation_app/screens/doctors_screen.dart';
import 'package:clinic_reservation_app/screens/emergency_screen.dart';
import 'package:clinic_reservation_app/screens/home_screen.dart';
import 'package:clinic_reservation_app/screens/location_screen.dart';
import 'package:clinic_reservation_app/screens/login_screen.dart';
import 'package:clinic_reservation_app/screens/monthly_board_screen.dart';
import 'package:clinic_reservation_app/screens/products_screen.dart';
import 'package:clinic_reservation_app/screens/profile_screen.dart';
import 'package:clinic_reservation_app/screens/request_appointment_screen.dart';
import 'package:clinic_reservation_app/screens/signup_screen.dart';
import 'package:clinic_reservation_app/screens/spash_screen.dart';
import 'package:clinic_reservation_app/style.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  if (defaultTargetPlatform == TargetPlatform.android) {
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Auth(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginController(),
        ),
        ChangeNotifierProvider(
          create: (context) => SingupController(),
        ),
        ChangeNotifierProvider(
          create: (context) => DoctorsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AppointmentsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RequestAppointmentProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DateSelector(),
        ),
        ChangeNotifierProvider(
          create: (context) => BarProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: style,
        home: const SplashScreen(),
        routes: {
          SignUpScreen.routeName: (context) => const SignUpScreen(),
          LoginScreen.routeName: (context) => const LoginScreen(),
          HomeScreen.routeName: (context) => const HomeScreen(),
          ProfileScreen.routeName: (context) => const ProfileScreen(),
          AppointmentsScreen.routeName: (compute) => const AppointmentsScreen(),
          AboutUsScreen.routeName: (context) => const AboutUsScreen(),
          ProductsScreen.routeName: (context) => const ProductsScreen(),
          LocationScreen.routeName: (context) => const LocationScreen(),
          MonthlyBoardScreen.routeName: (context) => const MonthlyBoardScreen(),
          RequestAppointmentScreen.routeName: (context) =>
              const RequestAppointmentScreen(),
          DoctorsScreen.routeName: (context) => const DoctorsScreen(),
          EmergencyScreen.routeName: (context) => const EmergencyScreen(),
        },
      ),
    );
  }
}
