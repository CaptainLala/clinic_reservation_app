import 'package:clinic_reservation_app/models/appointments.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppointmentsProvider with ChangeNotifier {
  Dio dio = Dio();

  List<Appointment> _appo = [];

  List<Appointment> get appo {
    return [..._appo];
  }

  Future getUserAppointments() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String userId = _prefs.getString('userId')!;
    try {
      Response res =
          await dio.get('http://127.0.0.1:3000/api/appo/user/$userId');
      if (res.statusCode == 200) {
        List<Appointment> appos = [];
        for (var data in res.data['appointments']) {
          appos.add(Appointment.fromJson(data));
        }
        _appo = appos;
      }
    } catch (e) {
      print(e);
    }
  }

  Future createAppointment(
      String docId, String userId, String date, String time) async {
    try {
      Response res = await dio.post('http://127.0.0.1:3000/api/appo', data: {
        "doctor": docId,
        "user": userId,
        "time": time,
        "date": date,
      });
      if (res.statusCode == 201) {
        _appo.add(Appointment.fromJson(res.data['appo']));
      }
    } catch (e) {
      print(e);
    }
  }
}
