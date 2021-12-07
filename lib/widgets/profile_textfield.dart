import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ProfileTextField extends StatelessWidget {
  final String title;
  final TextInputType keyboardType;
  final TextInputAction inputAction;
  final String label;

  const ProfileTextField({
    Key? key,
    required this.title,
    required this.keyboardType,
    required this.inputAction,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            title,
            style: Theme.of(context).textTheme.headline3,
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
