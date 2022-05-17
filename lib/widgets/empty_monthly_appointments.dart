import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class EmptyMonthlyAppointments extends StatelessWidget {
  const EmptyMonthlyAppointments({Key? key}) : super(key: key);

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
                'assets/images/empty_board.png',
                height: 180,
                width: 180,
              ),
              AutoSizeText(
                'This Doctor Does Not Have Any Appointments Yet!',
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
