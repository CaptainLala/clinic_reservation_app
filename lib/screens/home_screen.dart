import 'package:auto_size_text/auto_size_text.dart';
import 'package:clinic_reservation_app/widgets/image_container.dart';
import 'package:clinic_reservation_app/widgets/side_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideBar(),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white10,
        iconTheme: const IconThemeData(
          color: Color.fromRGBO(37, 41, 88, 1),
        ),
        title: Text(
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
          Text(
            'Welcome to Salahaddin Clinic, Receive the Best with Us!',
            style: Theme.of(context).textTheme.headline1,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'How Can We Help You?',
            style: Theme.of(context).textTheme.headline3,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              ImageContainer(
                label: 'Request Appointment',
                image: 'assets/images/appointment.png',
              ),
              SizedBox(
                width: 30,
              ),
              ImageContainer(
                label: 'Contact Us',
                image: 'assets/images/contact.png',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
