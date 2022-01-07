import 'package:auto_size_text/auto_size_text.dart';
import 'package:clinic_reservation_app/widgets/appointment_doctor.dart';
import 'package:clinic_reservation_app/widgets/appointment_time.dart';
import 'package:clinic_reservation_app/widgets/appointment_type.dart';
import 'package:clinic_reservation_app/widgets/calendar.dart';
import 'package:clinic_reservation_app/widgets/default_button.dart';
import 'package:flutter/material.dart';

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
          const AppointmentTime(),
          const AppointmentDoctor(),
          const AppointmentType(),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
            ),
            child: Center(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Request Appointment',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(
                    Size(
                      MediaQuery.of(context).size.width,
                      50,
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromRGBO(37, 41, 88, 1)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
