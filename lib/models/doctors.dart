class Doctor {
  final int id;
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
}
