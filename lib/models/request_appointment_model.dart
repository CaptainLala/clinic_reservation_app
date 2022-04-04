import 'package:clinic_reservation_app/models/doctors.dart';

class RequestAppointmentModel {
  String? date;
  List<String>? time;
  List<Doctor> doc;

  RequestAppointmentModel({
    required this.date,
    required this.time,
    required this.doc,
  });
  factory RequestAppointmentModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> timeJson = json['time'];
    List<dynamic> doctorJson = json['doctors'];
    // converting the dynamic list to String !!
    List<String> times = timeJson.map((e) => e.toString()).toList();
    List<Doctor> doctors = doctorJson.map((e) => Doctor.fromJson(e)).toList();
    return RequestAppointmentModel(
      date: json['date'],
      time: times,
      doc: doctors,
    );
  }
}
