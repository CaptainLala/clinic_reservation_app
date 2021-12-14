import 'package:auto_size_text/auto_size_text.dart';
import 'package:clinic_reservation_app/providers/singup_controller.dart';
import 'package:clinic_reservation_app/screens/home_screen.dart';
import 'package:clinic_reservation_app/screens/login_screen.dart';
import 'package:clinic_reservation_app/widgets/default_button.dart';
import 'package:clinic_reservation_app/widgets/default_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  static const routeName = '/signup';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SingupController _controller = Provider.of<SingupController>(context);
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                AutoSizeText(
                  'Already have an account?',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox(
                  height: 20,
                ),
                const DefaultButton(
                  label: 'Log In',
                  route: LoginScreen.routeName,
                ),
                const Spacer(),
              ],
            ),
          ),
          ClipPath(
            clipper: ClippingClass(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.7,
              padding: const EdgeInsets.only(left: 50, right: 50, top: 70),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        'Sign up with',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      AutoSizeText(
                        'Salahaddin Clinic',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ],
                  ),
                  DefaultTextField(
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.next,
                    controller: _controller.fullNameController,
                    label: 'Full Name',
                    color: Colors.white,
                  ),
                  DefaultTextField(
                    keyboardType: TextInputType.number,
                    inputAction: TextInputAction.next,
                    controller: _controller.ageController,
                    label: 'Age',
                    color: Colors.white,
                  ),
                  DefaultTextField(
                    keyboardType: TextInputType.phone,
                    inputAction: TextInputAction.done,
                    controller: _controller.phoneController,
                    label: 'Phone Number',
                    color: Colors.white,
                  ),
                  const DefaultButton(
                    label: 'Sign Up',
                    route: HomeScreen.routeName,
                  ),
                ],
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
    path.lineTo(0, 80);

    path.quadraticBezierTo(size.width / 2, 0, size.width, 80);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
