// import 'package:intl/intl.dart';

class RequestAppointmentModel {
  String? date;
  List<Time> time;

  RequestAppointmentModel({
    required this.date,
    required this.time,
  });
  factory RequestAppointmentModel.fromJson(Map<String, dynamic> json) {
    var timeJson = json['time'];
    // Timestamp dateJson = json['date'];

    // DateTime date =
    //     DateTime.fromMicrosecondsSinceEpoch(dateJson.microsecondsSinceEpoch);

    // var dateString = DateFormat.d().format(date);

    List<Time> time = [];

    for (var data in timeJson) {
      time.add(Time.fromJson(data));
    }
    return RequestAppointmentModel(
      date: json['date'],
      time: time,
    );
  }
}

class Time {
  String time;
  List<Docs> docs;

  Time({required this.time, required this.docs});

  factory Time.fromJson(Map<String, dynamic> json) {
    var docsJson = json['docs'];
    List<Docs> docs = [];
    for (var data in docsJson) {
      docs.add(Docs.fromJson(data));
    }
    return Time(
      time: json['time'],
      docs: docs,
    );
  }
}

class Docs {
  String id;
  String name;

  Docs({required this.id, required this.name});

  factory Docs.fromJson(Map<String, dynamic> json) {
    return Docs(
      id: json['uid'],
      name: json['name'],
    );
  }
}
