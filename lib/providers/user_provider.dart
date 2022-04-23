import 'package:clinic_reservation_app/models/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  Dio dio = Dio();
  UserModel? _user;

  UserModel? get user => _user;

  void addUser(UserModel data) {
    _user = data;
    notifyListeners();
  }

  Future<UserModel?> getUser(BuildContext context) async {
    try {
      var user = FirebaseAuth.instance.currentUser!.uid;
      var data =
          await FirebaseFirestore.instance.collection('users').doc(user).get();
      addUser(UserModel.fromJson(data.data() as Map<String, dynamic>));
      return _user;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
