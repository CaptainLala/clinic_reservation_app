import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  final Color color;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final TextInputAction inputAction;
  final String label;
  const DefaultTextField({
    Key? key,
    required this.keyboardType,
    required this.controller,
    required this.inputAction,
    required this.label,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
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
        controller: controller,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(15),
          label: Text(label),
        ),
      ),
    );
  }
}
