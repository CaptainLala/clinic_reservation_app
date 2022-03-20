import 'package:auto_size_text/auto_size_text.dart';
import 'package:clinic_reservation_app/providers/doctors_provider.dart';
import 'package:clinic_reservation_app/widgets/doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DoctorsScreen extends StatelessWidget {
  static const routeName = '/doctors';
  const DoctorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<dynamic> initRequest(context) async {
      final List<Future<dynamic>> promise = [
        Provider.of<DoctorsProvider>(context, listen: false).getAllDoctors()
      ];
      return Future.wait(promise);
    }

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
      body: FutureBuilder(
        future: initRequest(context),
        builder: (context, snap) {
          if (snap.hasData) {
            return Consumer<DoctorsProvider>(
              builder: (context, provider, _) {
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  itemCount: provider.doctors.length,
                  itemBuilder: (context, index) {
                    return DoctorCard(
                      doctor: provider.doctors[index],
                    );
                  },
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
