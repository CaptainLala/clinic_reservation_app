import 'package:auto_size_text/auto_size_text.dart';
import 'package:clinic_reservation_app/widgets/category_card.dart';
import 'package:clinic_reservation_app/widgets/header_title.dart';
import 'package:clinic_reservation_app/widgets/image_container.dart';
import 'package:clinic_reservation_app/widgets/side_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      drawer: const SideBar(),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
          icon: Icon(
            FontAwesomeIcons.bars,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white10,
        title: AutoSizeText(
          'Salahaddin Clinic',
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        children: [
          AutoSizeText(
            'Welcome to Salahaddin Clinic, Receive the Best with Us!',
            style: Theme.of(context).textTheme.headline1,
          ),
          const Divider(
            thickness: 1,
          ),
          const HeaderTitle(title: 'How Can We Help You?'),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              ImageContainer(
                label: 'Request Appointment',
                image: 'assets/images/appointment.png',
              ),
              ImageContainer(
                label: 'See Our Doctors',
                image: 'assets/images/doctor.png',
              ),
            ],
          ),
          const HeaderTitle(title: 'Categories'),
          GridView(
            padding: const EdgeInsets.only(
              bottom: 10,
            ),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 2.2),
              crossAxisCount: 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
            children: const [
              CategoryCard(
                title: 'Our Products',
                image: 'assets/images/bottle.png',
              ),
              CategoryCard(
                title: 'Our Location',
                image: 'assets/images/location.png',
              ),
              CategoryCard(
                title: 'Contact Us',
                image: 'assets/images/contact.png',
              ),
              CategoryCard(
                title: 'Monthly Board',
                image: 'assets/images/money_graph.png',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
