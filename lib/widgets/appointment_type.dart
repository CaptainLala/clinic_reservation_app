import 'package:auto_size_text/auto_size_text.dart';
import 'package:clinic_reservation_app/providers/date_selector.dart';
import 'package:flutter/material.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:provider/provider.dart';

class AppointmentType extends StatelessWidget {
  const AppointmentType({Key? key}) : super(key: key);

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
            'Choose An Appointment',
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
          buttonLables: const [
            'Emergency',
            'Visit',
            'Revist',
            'Blood Test',
            'X-Ray',
            'Consultancy',
            'Monitoring',
          ],
          buttonValues: const [
            'Emergency',
            'Visit',
            'Revisit',
            'Blood Test',
            'X-Ray',
            'Consultancy',
            'Monitoring',
          ],
          elevation: 5,
          enableShape: true,
          radius: 15,
          shapeRadius: 15,
          radioButtonValue: (val) {
            Provider.of<DateSelector>(context, listen: false).assignPurpose(
              val.toString().toLowerCase(),
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
