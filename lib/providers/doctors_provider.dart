import 'package:clinic_reservation_app/models/doctors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
      var collection = await FirebaseFirestore.instance
          .collection('users')
          .where('role', isEqualTo: 'doctor')
          .get();
      List<Doctor> tempData = [];
      collection.docs
          .map(
            (e) => tempData.add(
              Doctor.fromJson(e.data()),
            ),
          )
          .toList();

      _doctors = tempData;
      return tempData;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
