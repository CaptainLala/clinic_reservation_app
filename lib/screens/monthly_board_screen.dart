import 'package:auto_size_text/auto_size_text.dart';
import 'package:clinic_reservation_app/widgets/bar_chart_widget.dart';
import 'package:clinic_reservation_app/widgets/demo_appointment.dart';
import 'package:flutter/material.dart';

class MonthlyBoardScreen extends StatelessWidget {
  static const routeName = '/monthly_board';
  const MonthlyBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 15,
        ),
        child: ListView(
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
            const DemoAppointment(),
            const DemoAppointment(),
            const DemoAppointment(),
          ],
        ),
      ),
    );
  }
}
