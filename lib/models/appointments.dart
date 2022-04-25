class Appointment {
  final String date;
  final String time;

  final String userId;
  final String docId;
  final bool status; // ... Pending, Done
  final String purpose; // ... Plazma, Visit

  Appointment({
    required this.date,
    required this.time,
    required this.userId,
    required this.docId,
    required this.status,
    required this.purpose,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      date: json['date'],
      time: json['time'],
      userId: json['uid'],
      docId: json['docid'],
      status: json['status'],
      purpose: json['purpose'],
    );
  }
}
