import 'package:auto_size_text/auto_size_text.dart';
import 'package:clinic_reservation_app/widgets/appointments_widget.dart';
import 'package:flutter/material.dart';

class AppointmentsScareen extends StatelessWidget {
  static const routeName = '/appointments_screen';
  const AppointmentsScareen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          'Appointments',
          style: Theme.of(context).textTheme.headline2,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white10,
        iconTheme: Theme.of(context).iconTheme,
      ),
      body: const AppointmetnWidget(),
    );
  }
}
