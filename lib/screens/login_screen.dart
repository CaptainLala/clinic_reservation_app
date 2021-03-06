import 'package:auto_size_text/auto_size_text.dart';
import 'package:clinic_reservation_app/providers/auth.dart';
import 'package:clinic_reservation_app/providers/login_controller.dart';
import 'package:clinic_reservation_app/screens/signup_screen.dart';
import 'package:clinic_reservation_app/widgets/default_button.dart';
import 'package:clinic_reservation_app/widgets/default_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _phoneController =
        Provider.of<LoginController>(context).phoneController;
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      'Welcome to',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    AutoSizeText(
                      'Salahaddin Clinic',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    AutoSizeText(
                      'Please login to continue',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
                DefaultTextField(
                  keyboardType: TextInputType.phone,
                  inputAction: TextInputAction.done,
                  controller: _phoneController,
                  label: 'Phone Number',
                  color: Theme.of(context).primaryColor,
                ),
                //change here !!
                ElevatedButton(
                  onPressed: () async {
                    final data = Provider.of<Auth>(context, listen: false);
                    await data.signIn(
                      context,
                      '_phoneController.text',
                      '_passwordController.text',
                    );
                  },
                  child: const Text(
                    'Log in',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                      Size(
                        MediaQuery.of(context).size.width,
                        50,
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ClipPath(
            clipper: ClippingClass(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text(
                      'OR',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    DefaultButton(
                      label: 'Sign Up',
                      route: SignUpScreen.routeName,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.quadraticBezierTo(size.width / 2, size.height * 0.3, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
