import 'package:clinic_reservation_app/models/users.dart';
import 'package:clinic_reservation_app/utils/socket_handler.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  Dio dio = Dio();
  User? _user;

  User? get user => _user;

  void addUser(User data) {
    _user = data;
    notifyListeners();
  }

  Future getUser(BuildContext context, String token) async {
    try {
      Response res = await dio.get(
        'http://127.0.0.1:3000/api/users/me',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (res.statusCode == 200) {
        User user = User.fromJson(res.data);
        addUser(user);
        return user;
      }
    } on DioError catch (e) {
      SocketHandler error = SocketHandler();
      error.handler(e, context);
    }
  }
}
