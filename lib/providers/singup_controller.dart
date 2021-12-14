import 'package:flutter/material.dart';

class SingupController with ChangeNotifier {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  TextEditingController get fullNameController => _fullNameController;
  TextEditingController get ageController => _ageController;
  TextEditingController get phoneController => _phoneController;
}
