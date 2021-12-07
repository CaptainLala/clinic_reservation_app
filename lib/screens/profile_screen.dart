import 'package:auto_size_text/auto_size_text.dart';
import 'package:clinic_reservation_app/widgets/default_textfield.dart';
import 'package:clinic_reservation_app/widgets/header_title.dart';
import 'package:clinic_reservation_app/widgets/profile_textfield.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = 'profile_screen';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _fullNameController = TextEditingController();

  final _ageController = TextEditingController();

  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _ageController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          'Profile',
          style: Theme.of(context).textTheme.headline2,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white10,
        iconTheme: Theme.of(context).iconTheme,
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.20,
            child: Image.asset(
              'assets/images/profile_avatar.png',
              fit: BoxFit.contain,
            ),
          ),
          const Center(child: HeaderTitle(title: 'Personal Information')),
          const ProfileTextField(
            title: 'Name',
            keyboardType: TextInputType.name,
            inputAction: TextInputAction.done,
            label: 'Name',
          ),
          const ProfileTextField(
            title: 'Phone Number',
            keyboardType: TextInputType.name,
            inputAction: TextInputAction.done,
            label: 'Phone',
          ),
          const ProfileTextField(
            title: 'Age',
            keyboardType: TextInputType.number,
            inputAction: TextInputAction.done,
            label: 'Age',
          )
        ],
      ),
    );
  }
}
