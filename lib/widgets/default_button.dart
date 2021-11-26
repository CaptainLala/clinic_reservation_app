import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String label;
  final String route;
  const DefaultButton({Key? key, required this.label, required this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushReplacementNamed(context, route);
      },
      child: Text(
        label,
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
      ),
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(
          Size(
            MediaQuery.of(context).size.width,
            50,
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }
}
