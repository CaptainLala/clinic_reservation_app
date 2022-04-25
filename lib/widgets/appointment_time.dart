import 'package:auto_size_text/auto_size_text.dart';
import 'package:clinic_reservation_app/models/request_appointment_model.dart';
import 'package:clinic_reservation_app/providers/date_selector.dart';
import 'package:flutter/material.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:provider/provider.dart';

class AppointmentTime extends StatelessWidget {
  final List<Time> time;
  const AppointmentTime({Key? key, required this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 15,
            bottom: 10,
          ),
          child: AutoSizeText(
            'Choose A Time',
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
        CustomRadioButton(
          autoWidth: true,
          height: 50,
          buttonTextStyle: const ButtonTextStyle(
            selectedColor: Colors.white,
            unSelectedColor: Color.fromRGBO(37, 41, 88, 1),
            textStyle: TextStyle(
              fontSize: 16,
            ),
          ),
          unSelectedColor: Colors.white,
          buttonLables: time.map((e) => e.time).toList(),
          buttonValues: time.map((e) => e.time).toList(),
          elevation: 5,
          enableShape: true,
          radius: 15,
          shapeRadius: 15,
          radioButtonValue: (value) {
            Provider.of<DateSelector>(context, listen: false).assignTime(
              value.toString(),
            );
          },
          spacing: 5,
          horizontal: false,
          enableButtonWrap: false,
          absoluteZeroSpacing: false,
          selectedColor: const Color.fromRGBO(37, 41, 88, 1),
          padding: 10,
          unSelectedBorderColor: const Color.fromRGBO(37, 41, 88, 1),
          selectedBorderColor: const Color.fromRGBO(37, 41, 88, 1),
        ),
      ],
    );
  }
}
