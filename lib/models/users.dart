class User {
  final String id;
  final String username;
  final int age;
  final int phone;

  User({
    required this.id,
    required this.username,
    required this.age,
    required this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['user']['_id'],
      username: json['user']['name'],
      age: 12,
      phone: 12345678,
    );
  }
}
