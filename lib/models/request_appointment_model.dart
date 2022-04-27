// import 'package:intl/intl.dart';

class RequestTimeModel {
  String? date;
  List<String> time;

  RequestTimeModel({
    required this.date,
    required this.time,
  });
  factory RequestTimeModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> timeJson = json['time'];

    List<String> timeString = [];
    for (var time in timeJson) {
      timeString.add(time.toString());
    }
    return RequestTimeModel(
      date: json['date'],
      time: timeString,
    );
  }
}

class RequestDocModel {
  String name;
  String uid;

  RequestDocModel({required this.name, required this.uid});

  factory RequestDocModel.fromJson(Map<String, dynamic> json) {
    return RequestDocModel(
      name: json['name'],
      uid: json['uid'],
    );
  }
}
