import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class DoctorsScreen extends StatelessWidget {
  static const routeName = '/doctors';
  const DoctorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          'Our Doctors',
          style: Theme.of(context).textTheme.headline2,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white10,
        iconTheme: Theme.of(context).iconTheme,
      ),
    );
  }
}
