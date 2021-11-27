import 'package:flutter/material.dart';

class ElevatedContainer extends StatelessWidget {
  final Widget widget;
  final Color color;
  const ElevatedContainer({Key? key, required this.widget, required this.color})
      : super(key: key);

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
      child: widget,
    );
  }
}
