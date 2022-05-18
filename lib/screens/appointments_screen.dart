import 'package:auto_size_text/auto_size_text.dart';
import 'package:clinic_reservation_app/models/users.dart';
import 'package:clinic_reservation_app/providers/appointmets_provider.dart';
import 'package:clinic_reservation_app/providers/user_provider.dart';
import 'package:clinic_reservation_app/widgets/appointments_widget.dart';
import 'package:clinic_reservation_app/widgets/empty_appointments.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppointmentsScreen extends StatelessWidget {
  static const routeName = '/appointments_screen';

  const AppointmentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<dynamic> initRequest(context) async {
      UserModel doctor = Provider.of<UserProvider>(context).user!;
      final List<Future<dynamic>> promise = [
        doctor.role == 'doctor'
            ? Provider.of<AppointmentsProvider>(context, listen: false)
                .getDoctosAppointment()
            : Provider.of<AppointmentsProvider>(context, listen: false)
                .getUserAppointments()
      ];
      return Future.wait(promise);
    }

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
      body: FutureBuilder(
        future: initRequest(context),
        builder: (context, snap) {
          if (snap.hasData) {
            return Consumer<AppointmentsProvider>(
              builder: (context, provider, _) {
                return provider.appo.isEmpty
                    ? const EmptyAppointments()
                    : ListView.builder(
                        itemBuilder: (context, index) {
                          return AppointmetnWidget(
                            appo: provider.appo[index],
                          );
                        },
                        itemCount: provider.appo.length,
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
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
