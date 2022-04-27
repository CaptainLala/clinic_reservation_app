import 'package:clinic_reservation_app/models/appointments.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AppointmentsProvider with ChangeNotifier {
  final db = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance;

  List<Appointment> _appo = [];

  List<Appointment> get appo {
    return [..._appo];
  }

  Future<List<Appointment>> getUserAppointments() async {
    try {
      List<Appointment> tempData = [];

      var _collection = await db
          .collection('appointments')
          .where(
            'uid',
            isEqualTo: user.currentUser!.uid,
          )
          .get();

      _collection.docs
          .map(
            (e) => tempData.add(
              Appointment.fromJson(
                e.data(),
              ),
            ),
          )
          .toList();
      _appo = tempData;
      return tempData;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future createAppointment(String docId, String userId, String date,
      String time, String purpose, bool status) async {
    try {
      await db
          .collection('appointments')
          .doc('${user.currentUser!.uid}_${date}_${time}_$docId')
          .set({
        "date": date,
        "docid": docId,
        "purpose": purpose,
        "status": false,
        "time": time,
        "uid": user.currentUser!.uid
      });

      await db
          .collection('available/$date/docs')
          .doc(time)
          .update({"$docId.isReserved": true});
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future deleteAppointment(String date, String time, String docId) async {
    try {
      db
          .collection('appointments')
          .doc('${user.currentUser!.uid}_${date}_${time}_$docId')
          .delete();
      await db
          .collection('available/$date/docs')
          .doc(time)
          .update({"$docId.isReserved": false});
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
