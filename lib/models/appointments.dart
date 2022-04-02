import 'doctors.dart';

class Appointment {
  final String id;
  final String date;
  final String time;
  final Doctor doctor;
  final String user;
  final bool status; // ... Pending, Done
  final String purpose; // ... Plazma, Visit

  Appointment({
    required this.id,
    required this.date,
    required this.time,
    required this.doctor,
    required this.user,
    required this.status,
    required this.purpose,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json['_id'],
      date: json['date'],
      time: json['time'],
      doctor: Doctor.fromJson(json['doctor']),
      user: json['user'],
      status: json['status'],
      purpose: json['purpose'],
    );
  }
}
