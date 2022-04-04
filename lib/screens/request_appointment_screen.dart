import 'package:auto_size_text/auto_size_text.dart';
import 'package:clinic_reservation_app/providers/appointmets_provider.dart';
import 'package:clinic_reservation_app/providers/date_selector.dart';
import 'package:clinic_reservation_app/providers/request_appointment_provider.dart';
import 'package:clinic_reservation_app/widgets/appointment_doctor.dart';
import 'package:clinic_reservation_app/widgets/appointment_time.dart';
import 'package:clinic_reservation_app/widgets/appointment_type.dart';
import 'package:clinic_reservation_app/widgets/calendar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RequestAppointmentScreen extends StatelessWidget {
  static const routeName = '/request-appointment';
  const RequestAppointmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int? date = Provider.of<DateSelector>(context).selectedDate;

    Future<dynamic> initRequest(context) async {
      final List<Future<dynamic>> promise = [
        Provider.of<DateSelector>(context).getAllDates(),
        Provider.of<RequestAppointmentProvider>(context).getMonthAppointment(
          date ?? DateTime.now().day.toInt(),
        )
      ];
      return Future.wait(promise);
    }

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
      body: FutureBuilder(
        future: initRequest(context),
        builder: (context, snap) {
          if (snap.hasData) {
            return Consumer3<RequestAppointmentProvider, DateSelector,
                AppointmentsProvider>(
              builder: (context, provider1, provider2, provider3, _) {
                return ListView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  children: [
                    const Calendar(),
                    AppointmentTime(
                      time: provider1.requestAppointment!.time!,
                    ),
                    AppointmentDoctor(docs: provider1.requestAppointment!.doc),
                    const AppointmentType(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () async {
                            SharedPreferences _prefs =
                                await SharedPreferences.getInstance();
                            if (provider2.selectedDate != null &&
                                provider2.selecredTime != null &&
                                provider2.docId != null) {
                              provider1.deleteAvailable(
                                '${provider2.selectedDate}',
                                provider2.selecredTime!,
                                provider2.docId!,
                              );
                              provider3.createAppointment(
                                provider2.docId!,
                                _prefs.getString('userId')!,
                                '${provider2.selectedDate}',
                                provider2.selecredTime!,
                              );
                              Navigator.pop(context);
                            }
                          },
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
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
