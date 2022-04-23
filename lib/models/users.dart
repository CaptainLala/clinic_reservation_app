class UserModel {
  final String username;
  final int age;
  final String phone;

  UserModel({
    required this.username,
    required this.age,
    required this.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['name'],
      age: json['age'],
      phone: json['phoneNo'],
    );
  }
}
