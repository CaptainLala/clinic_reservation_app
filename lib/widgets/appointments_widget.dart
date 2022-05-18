import 'package:auto_size_text/auto_size_text.dart';
import 'package:clinic_reservation_app/models/appointments.dart';
import 'package:clinic_reservation_app/models/users.dart';
import 'package:clinic_reservation_app/providers/appointmets_provider.dart';
import 'package:clinic_reservation_app/providers/user_provider.dart';
import 'package:clinic_reservation_app/screens/request_appointment_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppointmetnWidget extends StatelessWidget {
  final Appointment appo;
  const AppointmetnWidget({Key? key, required this.appo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserModel doctor = Provider.of<UserProvider>(context).user!;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.15,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            appo.pending == true ? Icons.timer : Icons.done,
            size: 50,
            color: Theme.of(context).iconTheme.color,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText(
                appo.purpose,
                style: Theme.of(context).textTheme.bodyText2,
              ),
              AutoSizeText(
                appo.date,
                style: Theme.of(context).textTheme.bodyText2,
              ),
              AutoSizeText(
                appo.time,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
          appo.pending == true
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: PopupMenuButton(
                    icon: Icon(
                      Icons.more_vert,
                      size: 50,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    onSelected: (val) {
                      if (val == 0) {
                        Navigator.pushNamed(
                          context,
                          RequestAppointmentScreen.routeName,
                          arguments: {"uid": appo.userId},
                        );
                      }
                    },
                    //checkes whether its a doctor or a user
                    itemBuilder: (BuildContext context) {
                      if (doctor.role == 'doctor' && appo.pending == true) {
                        return [
                          PopupMenuItem(
                            value: 0,
                            child: const Text(
                              "Edit Appointment",
                              style: TextStyle(
                                fontSize: 20,
                                color: Color.fromRGBO(37, 41, 88, 1),
                              ),
                            ),
                            onTap: () {
                              Provider.of<AppointmentsProvider>(context,
                                      listen: false)
                                  .deleteAppointment(
                                appo.date,
                                appo.time,
                                appo.docId,
                              );
                            },
                          ),
                          PopupMenuItem(
                            value: 1,
                            child: Text(
                              "Appointment Done",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.green.shade500,
                              ),
                            ),
                            onTap: () {
                              Provider.of<AppointmentsProvider>(context,
                                      listen: false)
                                  .updateStatus(
                                      appo.date, appo.time, appo.docId);
                              Navigator.pop(context);
                            },
                          ),
                          PopupMenuItem(
                            value: 2,
                            child: const Text(
                              "Cancel Appointment",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.red,
                              ),
                            ),
                            onTap: () {
                              Future.delayed(
                                const Duration(seconds: 0),
                                () => showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(30.0),
                                      ),
                                    ),
                                    title: Text(
                                      'Cancel Appointment',
                                      style:
                                          Theme.of(context).textTheme.headline3,
                                    ),
                                    content: Text(
                                      'Would you like to cancel this appointment?',
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'No'),
                                        child: Text(
                                          'No',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1,
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Provider.of<AppointmentsProvider>(
                                                  context,
                                                  listen: false)
                                              .deleteAppointment(appo.date,
                                                  appo.time, appo.docId);
                                          Navigator.pop(context, 'Yes');
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          'Yes',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.redAccent,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ];
                      } else {
                        return [
                          PopupMenuItem(
                            value: 0,
                            child: const Text(
                              "Edit Appointment",
                              style: TextStyle(
                                fontSize: 20,
                                color: Color.fromRGBO(37, 41, 88, 1),
                              ),
                            ),
                            onTap: () {
                              Provider.of<AppointmentsProvider>(context,
                                      listen: false)
                                  .deleteAppointment(
                                      appo.date, appo.time, appo.docId);
                            },
                          ),
                          PopupMenuItem(
                            value: 2,
                            child: const Text(
                              "Cancel Appointment",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.red,
                              ),
                            ),
                            onTap: () {
                              Future.delayed(
                                const Duration(seconds: 0),
                                () => showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(30.0),
                                      ),
                                    ),
                                    title: Text(
                                      'Cancel Appointment',
                                      style:
                                          Theme.of(context).textTheme.headline3,
                                    ),
                                    content: Text(
                                      'Would you like to cancel this appointment?',
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'No'),
                                        child: Text(
                                          'No',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1,
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Provider.of<AppointmentsProvider>(
                                                  context,
                                                  listen: false)
                                              .deleteAppointment(appo.date,
                                                  appo.time, appo.docId);
                                          Navigator.pop(context, 'Yes');
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          'Yes',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.redAccent,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ];
                      }
                    },
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
