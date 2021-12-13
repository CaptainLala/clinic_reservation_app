import 'package:auto_size_text/auto_size_text.dart';
import 'package:clinic_reservation_app/screens/home_screen.dart';
import 'package:clinic_reservation_app/screens/login_screen.dart';
import 'package:clinic_reservation_app/screens/profile_screen.dart';
import 'package:clinic_reservation_app/widgets/list_tile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                margin: const EdgeInsets.only(
                  bottom: 25,
                ),
                height: MediaQuery.of(context).size.height / 3,
                width: double.infinity,
                color: Theme.of(context).primaryColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/healthcare.png',
                      scale: 3.5,
                    ),
                    AutoSizeText(
                      'Hamno Jabbar',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SideMenuTile(
                    icon: FontAwesomeIcons.home,
                    label: 'Home',
                    onPressed: () => Navigator.pushReplacementNamed(
                      context,
                      HomeScreen.routeName,
                    ),
                  ),
                  SideMenuTile(
                    icon: Icons.person,
                    label: 'Profile',
                    onPressed: () {
                      Navigator.pushNamed(context, ProfileScreen.routeName);
                    },
                  ),
                  SideMenuTile(
                    icon: FontAwesomeIcons.calendarCheck,
                    label: 'Appointments',
                    onPressed: () {},
                  ),
                  SideMenuTile(
                    icon: FontAwesomeIcons.info,
                    label: 'About Us',
                    onPressed: () {},
                  ),
                  SideMenuTile(
                    icon: Icons.logout_rounded,
                    label: 'Log Out',
                    onPressed: () => Navigator.pushNamed(
                      context,
                      LoginScreen.routeName,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  const Spacer(),
                  const Divider(
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        iconSize: 45,
                        color: Colors.blue.shade900,
                        icon: const FaIcon(FontAwesomeIcons.facebook),
                        onPressed: () {},
                      ),
                      IconButton(
                        iconSize: 45,
                        color: const Color.fromRGBO(233, 89, 80, 1),
                        icon: const FaIcon(FontAwesomeIcons.instagram),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
