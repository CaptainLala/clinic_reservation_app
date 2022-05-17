import 'package:auto_size_text/auto_size_text.dart';
import 'package:clinic_reservation_app/providers/appointmets_provider.dart';
import 'package:clinic_reservation_app/providers/bar_provider.dart';
import 'package:clinic_reservation_app/widgets/bar_chart_widget.dart';
import 'package:clinic_reservation_app/widgets/demo_appointment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MonthlyBoardScreen extends StatelessWidget {
  static const routeName = '/monthly_board';
  const MonthlyBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<dynamic> initRequest(context) async {
      final List<Future<dynamic>> promise = [
        Provider.of<BarProvider>(context).getMonthlyBoard(),
        Provider.of<AppointmentsProvider>(context, listen: false)
            .getFinishedAppointment(),
      ];

      return Future.wait(promise);
    }

    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          'Monthly Board',
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
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 15,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const BarChartWidget(),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        bottom: 15,
                      ),
                      child: AutoSizeText(
                        'Appointments:',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: Consumer<AppointmentsProvider>(
                        builder: (context, provider, _) {
                          return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return DemoAppointment(
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
                      ),
                    )
                  ],
                ),
              ),
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
