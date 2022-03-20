import 'package:clinic_reservation_app/screens/home_screen.dart';
import 'package:clinic_reservation_app/utils/socket_handler.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth with ChangeNotifier {
  Dio dio = Dio();

  Future signIn(BuildContext context, String email, String password) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    try {
      Response res = await dio.post(
        'http://127.0.0.1:3000/api/users/signin',
        data: {
          'phone': '1234567890',
          'password': '12345678',
        },
      );

      if (res.statusCode == 200) {
        String token = res.data['token'];
        _prefs.setString('token', token);
        _prefs.setBool('isLoggedIn', true);
        Navigator.pushNamedAndRemoveUntil(
          context,
          HomeScreen.routeName,
          (route) => false,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'wrong phone number or password',
            ),
          ),
        );
        throw Exception('wrong phone number or password');
      }
    } on DioError catch (e) {
      SocketHandler error = SocketHandler();
      error.handler(e, context);
    } catch (error) {
      throw (error.toString());
    }
  }
}
