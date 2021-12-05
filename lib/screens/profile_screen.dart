import 'package:auto_size_text/auto_size_text.dart';
import 'package:clinic_reservation_app/widgets/profile_textfield.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = 'profile_screen';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AutoSizeText(
          'Profile Info',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white10,
        iconTheme: const IconThemeData(
          color: Color.fromRGBO(37, 41, 88, 1),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.20,
            child: Image.asset(
              'assets/images/doctor.png',
              fit: BoxFit.contain,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              AutoSizeText(
                'Personal Information',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.person)
            ],
          ),
          const ProfileTextField(
            title: 'Name',
            keyboardType: TextInputType.name,
            inputAction: TextInputAction.done,
            label: 'Name',
            icon: Icons.person,
          ),
          const ProfileTextField(
            title: 'Phone Number',
            keyboardType: TextInputType.name,
            inputAction: TextInputAction.done,
            label: '07500000000',
            icon: Icons.phone,
          ),
          const ProfileTextField(
            title: 'Age',
            keyboardType: TextInputType.number,
            inputAction: TextInputAction.done,
            label: 'Age',
            icon: Icons.access_time_filled_sharp,
          )
        ],
      ),
    );
  }
}
