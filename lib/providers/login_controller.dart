import 'package:flutter/material.dart';

class LoginController with ChangeNotifier {
  final TextEditingController _phoneController = TextEditingController();

  TextEditingController get phoneController => _phoneController;
}
