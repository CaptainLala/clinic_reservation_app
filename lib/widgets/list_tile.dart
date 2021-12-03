import 'package:flutter/material.dart';

class SideMenuTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  const SideMenuTile(
      {Key? key,
      required this.icon,
      required this.label,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        title: Text(
          label,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        onTap: onPressed,
      ),
    );
  }
}
