import 'package:clinic_reservation_app/providers/date_selector.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime selectedDate = DateTime.now(); // TO tracking date

  int currentDateSelectedIndex = 0; //For Horizontal Date
  ScrollController scrollController = ScrollController(); //To Track Scroll of ListView

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  List<String> listOfMonths = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];

  List<String> listOfDays = [
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Choose A Date',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            IconButton(
              onPressed: () {
                _selectDate(context);
              },
              icon: const FaIcon(
                FontAwesomeIcons.calendar,
              ),
            ),
          ],
        ),
        //To Show Current Date
        Container(
          height: 50,
          alignment: Alignment.centerLeft,
          child: Text(
            selectedDate.day.toString() + '-' + listOfMonths[selectedDate.month - 1] + ', ' + selectedDate.year.toString(),
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
        //To Show Calendar Widget
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          height: MediaQuery.of(context).size.height * 0.17,
          child: Consumer<DateSelector>(
            builder: (context, provider, _) {
              return ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width: 10);
                },
                itemCount: provider.allDates.length,
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        currentDateSelectedIndex = index;
                        selectedDate = DateTime.now().add(
                          Duration(days: index),
                        );
                      });

                      provider.changeDate(
                        selectedDate.day.toInt(),
                      );
                      provider.assignDate('${selectedDate.day.toInt()}');
                      provider.assignSelectedDateTime(DateFormat('yyyy-MM-dd').format(selectedDate));
                    },
                    child: Container(
                      margin: const EdgeInsets.all(6),
                      width: MediaQuery.of(context).size.width * 0.19,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(3, 3),
                            blurRadius: 4,
                          ),
                        ],
                        color: currentDateSelectedIndex == index ? const Color.fromRGBO(37, 41, 88, 1) : Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            listOfMonths[DateTime.now()
                                        .add(
                                          Duration(days: index),
                                        )
                                        .month -
                                    1]
                                .toString(),
                            style: TextStyle(
                              fontSize: 16,
                              color: currentDateSelectedIndex == index ? Colors.white : Colors.grey,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            provider.allDates[index],
                            style: TextStyle(
                              fontSize: 16,
                              color: currentDateSelectedIndex == index ? Colors.white : Colors.grey,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            listOfDays[DateTime.now()
                                        .add(
                                          Duration(days: index),
                                        )
                                        .weekday -
                                    1]
                                .toString(),
                            style: TextStyle(
                              fontSize: 16,
                              color: currentDateSelectedIndex == index ? Colors.white : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
