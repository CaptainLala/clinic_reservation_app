import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DateSelector with ChangeNotifier {
  var db = FirebaseFirestore.instance;

  int? _selectedDate;
  String? _selecredTime;
  String? _docId;
  String? _purpose;
  String? _docName;

  int? get selectedDate => _selectedDate;
  String? get selecredTime => _selecredTime;
  String? get docId => _docId;
  String? get purpose => _purpose;
  String? get docName => _docName;

  void assignDate(String date) {
    _selecredTime = date;
    notifyListeners();
  }

  void assignTime(String time) {
    _selecredTime = time;
    notifyListeners();
  }

  void assignDocId(String id) {
    _docId = id;

    notifyListeners();
  }

  void assignPurpose(String purpose) {
    _purpose = purpose;

    notifyListeners();
  }

  void assignDocName(String docName) {
    _docName = docName;
    notifyListeners();
  }

  List<String> _allDates = [];

  List<String> get allDates {
    return [..._allDates];
  }

  Future<List<String>> getAllDates() async {
    try {
      var _collection = await db.collection('available').get();
      List<String> tempData = [];
      _collection.docs
          .map(
            (e) => tempData.add(
              e.data()['date'],
            ),
          )
          .toList();
      _allDates = tempData;
      return tempData;
    } catch (e) {
      rethrow;
    }
  }

  void changeDate(int date) {
    _selectedDate = date;
    notifyListeners();
  }
}
