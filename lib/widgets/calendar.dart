import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime selectedDate = DateTime.now(); // TO tracking date

  int currentDateSelectedIndex = 0; //For Horizontal Date
  ScrollController scrollController =
      ScrollController(); //To Track Scroll of ListView

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
      builder: (context, child) {
        return Theme(
          data: ThemeData().copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Color.fromRGBO(37, 41, 88, 1),
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Color.fromRGBO(37, 41, 88, 1),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      if (DateTime.now().month == picked.month &&
          DateTime.now().year == picked.year &&
          DateTime.now().day == picked.day) {
        setState(() {
          selectedDate = picked;
          currentDateSelectedIndex = 0;
        });
        return;
      }

      final int dateDifference = (picked.difference(DateTime.now()).inDays) + 1;
      setState(() {
        selectedDate = picked;
        currentDateSelectedIndex = dateDifference;
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
            selectedDate.day.toString() +
                '-' +
                listOfMonths[selectedDate.month - 1] +
                ', ' +
                selectedDate.year.toString(),
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
        //To Show Calendar Widget
        Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            height: MediaQuery.of(context).size.height * 0.17,
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(width: 10);
              },
              itemCount: 31,
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    setState(() {
                      currentDateSelectedIndex = index;
                      selectedDate = DateTime.now().add(
                        Duration(days: index),
                      );
                    });
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
                      color: currentDateSelectedIndex == index
                          ? const Color.fromRGBO(37, 41, 88, 1)
                          : Colors.white,
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
                            color: currentDateSelectedIndex == index
                                ? Colors.white
                                : Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          DateTime.now()
                              .add(
                                Duration(days: index),
                              )
                              .day
                              .toString(),
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: currentDateSelectedIndex == index
                                ? Colors.white
                                : Colors.grey,
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
                            color: currentDateSelectedIndex == index
                                ? Colors.white
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )),
      ],
    );
  }
}
