import 'package:clinic_reservation_app/models/doctors.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DoctorsProvider with ChangeNotifier {
  Dio dio = Dio();
  List<Doctor> _doctors = [];

  List<Doctor> get doctors {
    return [..._doctors];
  }

  void addDoctor(List<Doctor> docs) {
    _doctors = docs;
    notifyListeners();
  }

  Future<List<Doctor>> getAllDoctors() async {
    try {
      Response res = await dio.get('http://127.0.0.1:3000/api/doc/');
      List<Doctor> docs = [];
      if (res.statusCode == 200) {
        // print(res.data);
        for (var data in res.data['doctors']) {
          docs.add(Doctor.fromJson(data));
        }
        _doctors = docs;
      }
      return docs;
    } catch (e) {
      rethrow;
    }
  }
}
