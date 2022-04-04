import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DateSelector with ChangeNotifier {
  Dio dio = Dio();

  int? _selectedDate;
  String? _selecredTime;
  String? _docId;

  int? get selectedDate => _selectedDate;
  String? get selecredTime => _selecredTime;
  String? get docId => _docId;

  void assignDate(String date) {
    _selecredTime = date;
    notifyListeners();
  }

  void addignTime(String time) {
    _selecredTime = time;
    notifyListeners();
  }

  void assignDocId(String id) {
    _docId = id;
    notifyListeners();
  }

  List<String> _allDates = [];

  List<String> get allDates {
    return [..._allDates];
  }

  Future getAllDates() async {
    try {
      Response res =
          await dio.get('http://127.0.0.1:3000/api/available/date/all');
      List<String> tempData = [];
      for (var data in res.data['avail']) {
        tempData.add(data['date']);
      }
      _allDates = tempData;
    } catch (e) {
      print(e);
    }
  }

  void changeDate(int date) {
    _selectedDate = date;
    notifyListeners();
  }
}
