import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ProfileTextField extends StatelessWidget {
  final String title;
  final TextInputType keyboardType;
  final TextInputAction inputAction;
  final String label;
  final IconData icon;

  const ProfileTextField({
    Key? key,
    required this.title,
    required this.keyboardType,
    required this.inputAction,
    required this.label,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  offset: const Offset(5, 5),
                  blurRadius: 5,
                ),
              ],
            ),
            child: TextField(
              keyboardType: keyboardType,
              textInputAction: inputAction,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(15),
                label: Text(label),
                icon: Icon(icon),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
