import 'package:auto_size_text/auto_size_text.dart';
import 'package:clinic_reservation_app/providers/user_provider.dart';
import 'package:clinic_reservation_app/widgets/header_title.dart';
import 'package:clinic_reservation_app/widgets/profile_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      body: Consumer<UserProvider>(
        builder: (context, provider, _) {
          return ListView(
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
              ProfileTextField(
                title: 'Name',
                keyboardType: TextInputType.name,
                inputAction: TextInputAction.done,
                label: provider.user!.username,
              ),
              ProfileTextField(
                title: 'Phone Number',
                keyboardType: TextInputType.name,
                inputAction: TextInputAction.done,
                label: provider.user!.phone,
              ),
              ProfileTextField(
                title: 'Age',
                keyboardType: TextInputType.number,
                inputAction: TextInputAction.done,
                label: '${provider.user!.age}',
              )
            ],
          );
        },
      ),
    );
  }
}
