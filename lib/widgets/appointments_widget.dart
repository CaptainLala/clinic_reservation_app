import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppointmetnWidget extends StatelessWidget {
  const AppointmetnWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<String> options = ['Edit Appointment', 'Cancel Appointment'];

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.15,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
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
            Icons.timer,
            size: 50,
            color: Theme.of(context).iconTheme.color,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText(
                'Visit',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              AutoSizeText(
                'October 16 2021',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              AutoSizeText(
                '10:00 - 11:00',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: PopupMenuButton<String>(
              icon: Icon(
                Icons.more_vert,
                size: 50,
                color: Theme.of(context).iconTheme.color,
              ),
              itemBuilder: (BuildContext context) {
                return options.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: choice == 'Cancel Appointment'
                        ? Text(
                            choice,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                            ),
                          )
                        : Text(
                            choice,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Color.fromRGBO(37, 41, 88, 1),
                            ),
                          ),
                  );
                }).toList();
              },
            ),
          ),
        ],
      ),
    );
  }
}
