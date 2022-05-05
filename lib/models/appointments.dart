class Appointment {
  final String date;
  final String time;
  final String userId;
  final String docId;
  final bool pending; // ... Pending, Done
  final String purpose; // ... Plazma, Visit

  Appointment({
    required this.date,
    required this.time,
    required this.userId,
    required this.docId,
    required this.pending,
    required this.purpose,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      date: json['date'],
      time: json['time'],
      userId: json['uid'],
      docId: json['docid'],
      pending: json['pending'],
      purpose: json['purpose'],
    );
  }
}
