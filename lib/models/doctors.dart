class Doctor {
  final String id;
  final String username;
  final String name;
  final String image;
  final int age;
  final String phone;
  final String position; // Dentist, Surgeon ...

  Doctor({
    required this.id,
    required this.username,
    required this.image,
    required this.name,
    required this.age,
    required this.phone,
    required this.position,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['uid'],
      username: json['name'],
      image: 'assets/images/doctor_2.jpg',
      age: 12,
      phone: json['phoneNo'],
      position: 'surgeon',
      name: json['name'],
    );
  }
}
