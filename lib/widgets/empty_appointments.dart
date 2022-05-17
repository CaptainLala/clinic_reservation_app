import 'package:auto_size_text/auto_size_text.dart';
import 'package:clinic_reservation_app/screens/request_appointment_screen.dart';
import 'package:flutter/material.dart';

class EmptyAppointments extends StatelessWidget {
  const EmptyAppointments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/appointments_history.png',
                height: 180,
                width: 180,
              ),
              AutoSizeText(
                'Seems Like You Don\'t Have Any Scheduled Appointments Yet!',
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
              ElevatedButton(
                onPressed: () => Navigator.pushReplacementNamed(
                    context, RequestAppointmentScreen.routeName),
                child: const Text(
                  'Request An Appointment',
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
                    const Color.fromRGBO(37, 41, 88, 1),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
