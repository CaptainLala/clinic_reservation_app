import 'package:auto_size_text/auto_size_text.dart';
import 'package:clinic_reservation_app/widgets/calendar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RequestAppointmentScreen extends StatelessWidget {
  static const routeName = '/request-appointment';
  const RequestAppointmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          'Request Appointment',
          style: Theme.of(context).textTheme.headline2,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white10,
        iconTheme: Theme.of(context).iconTheme,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        children: [
          const Calendar(),
        ],
      ),
    );
  }
}
