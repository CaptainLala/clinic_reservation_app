import 'package:clinic_reservation_app/models/request_appointment_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RequestAppointmentProvider with ChangeNotifier {
  final db = FirebaseFirestore.instance;

  RequestTimeModel? _requestModel;

  RequestTimeModel? get requestModel => _requestModel;

  List<RequestDocModel?> _requestDoctors = [];

  List<RequestDocModel?> get requestDoctors {
    return [..._requestDoctors];
  }

  Future<RequestTimeModel?> getTime(int date) async {
    try {
      var _collection = await db.collection('available').doc('$date').get();

      RequestTimeModel? tempData;

      tempData =
          RequestTimeModel.fromJson(_collection.data() as Map<String, dynamic>);

      _requestModel = tempData;

      // getDoctorsWithTime(25, '9:00');
      return tempData;
    } catch (e) {
      // print(e);
      rethrow;
    }
  }

  Future<List<RequestDocModel>?> getDoctorsWithTime(
      int date, String time) async {
    try {
      var _collection =
          await db.collection('available/$date/docs').doc(time).get();

      var data = _collection.data()!['docs'];
      List<RequestDocModel>? tempData = [];

      for (var field in data) {
        tempData.add(RequestDocModel.fromJson(field));
      }

      _requestDoctors = tempData;
      // print(_requestDoctors[0]!.name);
      return tempData;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
