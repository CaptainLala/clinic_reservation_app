import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class HeaderTitle extends StatelessWidget {
  final String title;
  const HeaderTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 30,
        bottom: 10,
      ),
      child: AutoSizeText(
        title,
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }
}
