class UserModel {
  final String username;
  final int age;
  final String phone;
  final String role;

  UserModel({
    required this.username,
    required this.age,
    required this.phone,
    required this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['name'],
      age: json['age'],
      phone: json['phoneNo'],
      role: json['role'],
    );
  }
}
