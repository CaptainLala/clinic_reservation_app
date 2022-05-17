import 'package:auto_size_text/auto_size_text.dart';
import 'package:clinic_reservation_app/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsScreen extends StatelessWidget {
  static const routeName = '/about-us';
  const AboutUsScreen({Key? key}) : super(key: key);

  Future<void> _makePhoneCall() async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: '009647701234567',
    );
    await launchUrl(launchUri);
  }

  Future<void> _sendEmail() async {
    final Uri launchUri = Uri(
      scheme: 'mailto',
      path: 'salahaddin_clinic@example.com',
      query: 'subject=Feedback&body=Write us a feedback Version 3.23',
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          'Contact Us',
          style: Theme.of(context).textTheme.headline2,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white10,
        iconTheme: Theme.of(context).iconTheme,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.30,
              height: MediaQuery.of(context).size.height * 0.15,
              child: Image.asset(
                'assets/images/heart.png',
              ),
            ),
            Column(
              children: [
                AutoSizeText(
                  'We Are The Best In Town',
                  style: Theme.of(context).textTheme.headline1,
                ),
                AutoSizeText(
                  'With more than 10 years of experience!',
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            InkWell(
              borderRadius: BorderRadius.circular(25),
              onTap: () => _makePhoneCall(),
              child: Row(
                children: [
                  const Icon(Icons.phone),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 25,
                    ),
                    child: AutoSizeText(
                      '07701234567',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(25),
              onTap: () => _sendEmail(),
              child: Row(
                children: [
                  const Icon(Icons.mail),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 25,
                    ),
                    child: AutoSizeText(
                      'Send us an email',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(25),
              onTap: () => Navigator.pushReplacementNamed(
                context,
                LocationScreen.routeName,
              ),
              child: Row(
                children: [
                  const Icon(Icons.location_on),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 25,
                    ),
                    child: AutoSizeText(
                      'Find us on the map',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Color.fromRGBO(37, 41, 88, 1),
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  iconSize: 45,
                  onPressed: () {},
                  color: Colors.blue.shade900,
                  icon: const Icon(
                    FontAwesomeIcons.facebook,
                  ),
                ),
                IconButton(
                  iconSize: 45,
                  onPressed: () {},
                  color: const Color.fromRGBO(233, 89, 80, 1),
                  icon: const Icon(
                    FontAwesomeIcons.instagram,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
