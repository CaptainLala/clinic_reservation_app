import 'package:clinic_reservation_app/models/request_appointment_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RequestAppointmentProvider with ChangeNotifier {
  Dio dio = Dio();

  RequestAppointmentModel? _requestAppointmen;

  RequestAppointmentModel? get requestAppointment => _requestAppointmen;

  void addData(RequestAppointmentModel data) {
    _requestAppointmen = data;
  }

  Future<RequestAppointmentModel?> getMonthAppointment(int date) async {
    try {
      Response res = await dio.get('http://127.0.0.1:3000/api/available/$date');
      RequestAppointmentModel? tempData;
      if (res.statusCode == 200) {
        tempData = RequestAppointmentModel.fromJson(res.data['available']);
        addData(tempData);
      }
      return tempData;
    } catch (e) {
      rethrow;
    }
  }

  Future deleteAvailable(String date, String time, String docId) async {
    try {
      await dio.patch('http://127.0.0.1:3000/api/available',
          data: {'date': date, 'time': time, 'id': docId});
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  // Future getAllAvailableAppoint() async {
  //   try {
  //     Response res = await dio.get('http://127.0.0.1:3000/api/available');
  //     if (res.statusCode == 200) {
  //       List<RequestAppointmentModel> tempData = [];
  //       for (var data in res.data['available']) {
  //         tempData.add(
  //           RequestAppointmentModel.fromJson(data),
  //         );
  //       }

  //       _requestAppointment = tempData;
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

}
