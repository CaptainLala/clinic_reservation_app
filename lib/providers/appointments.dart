import './doctors.dart';
import './users.dart';

class Appointment {
  final int id;
  final DateTime date;
  final DateTime time;
  final Doctor doctor;
  final User user;
  final String status; // ... Pending, Done
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
}

class Appointments {
  // ... MANAGE APPOINTMENTS
}
