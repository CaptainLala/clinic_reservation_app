import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';

class AppointmentTime extends StatelessWidget {
  const AppointmentTime({Key? key}) : super(key: key);

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
          buttonLables: const [
            '9:00 AM - 10:00 AM',
            '10:00 AM - 11:00 AM',
            '11:00 AM - 12:00 PM',
            '12:00 PM - 1:00 PM',
            '1:00 PM - 2:00 PM',
            '2:00 PM - 3:00 PM',
            '3:00 PM - 4:00 PM',
          ],
          buttonValues: const [
            '9',
            '10',
            '11',
            '12',
            '1',
            '2',
            '3',
          ],
          elevation: 5,
          enableShape: true,
          radius: 15,
          shapeRadius: 15,
          radioButtonValue: (_) {},
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
