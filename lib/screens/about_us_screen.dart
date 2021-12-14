import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutUsScreen extends StatelessWidget {
  static const routeName = '/about_us_screen';
  const AboutUsScreen({Key? key}) : super(key: key);

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
            Container(
              width: MediaQuery.of(context).size.width * 0.30,
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
            Column(
              children: const [
                AutoSizeText('First hair center in erbil'),
                AutoSizeText(
                  'with more than 10 years of experince',
                  maxLines: 1,
                ),
              ],
            ),
            Row(
              children: const [
                Icon(Icons.phone),
                SizedBox(
                  width: 25,
                ),
                AutoSizeText('07504463073'),
              ],
            ),
            Row(
              children: const [
                Icon(Icons.mail),
                SizedBox(
                  width: 25,
                ),
                AutoSizeText('Send us a message'),
              ],
            ),
            Row(
              children: const [
                Icon(Icons.location_city),
                SizedBox(
                  width: 25,
                ),
                AutoSizeText('Find us on  map'),
              ],
            ),
            const Divider(
              color: Colors.red,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  iconSize: 40,
                  onPressed: () {},
                  icon: const Icon(
                    FontAwesomeIcons.facebook,
                  ),
                ),
                IconButton(
                  iconSize: 40,
                  onPressed: () {},
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
