import 'package:clinic_reservation_app/models/appointments.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

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
      Logger().e(e);
      rethrow;
    }
  }

  Future<List<Appointment>> getDoctosAppointment() async {
    try {
      List<Appointment> tempData = [];

      var _collection = await db
          .collection('appointments')
          .where(
            'docid',
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
      Logger().e(e);
      rethrow;
    }
  }

  Future<List<Appointment>> getFinishedAppointment() async {
    try {
      List<Appointment> tempData = [];

      var _collection = await db
          .collection('appointments')
          .where(
            'docid',
            isEqualTo: user.currentUser!.uid,
          )
          .where('pending', isEqualTo: false)
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
      Logger().e(e);
      rethrow;
    }
  }

  Future createAppointment({
    required String docId,
    required String userId,
    required String date,
    required String time,
    required String purpose,
    required bool status,
  }) async {
    try {
      await db.collection('appointments').doc('${date}_${time}_$docId').set({
        "date": date,
        "docid": docId,
        "purpose": purpose,
        "pending": true,
        "time": time,
        "uid": userId
      });

      await db
          .collection('available/$date/docs')
          .doc(time)
          .update({"$docId.isReserved": true});
    } catch (e) {
      Logger().e(e);
      rethrow;
    }
  }

  Future updateStatus(String date, String time, String docId) async {
    try {
      await db
          .collection('appointments')
          .doc('${date}_${time}_$docId')
          .update({"pending": false});

      var _collection =
          await db.collection('finished').doc('${docId}_$date').get();
      if (_collection.exists) {
        await db.collection('finished').doc('${docId}_$date').update({
          'docid': docId,
          'date': date,
          'count': FieldValue.increment(1),
        });
      } else {
        await db.collection('finished').doc('${docId}_$date').set({
          'docid': docId,
          'date': date,
          'count': 1,
        });
      }
    } catch (e) {
      Logger().e(e);
      rethrow;
    }
  }

  Future deleteAppointment(String date, String time, String docId) async {
    try {
      db.collection('appointments').doc('${date}_${time}_$docId').delete();
      await db
          .collection('available/$date/docs')
          .doc(time)
          .update({"$docId.isReserved": false});
    } catch (e) {
      Logger().e(e);
      rethrow;
    }
  }

  Future doctorDeleteAppointment(String date, String time, String docId) async {
    try {
      db.collection('appointments').doc('${date}_${time}_$docId').delete();
      await db
          .collection('available/$date/docs')
          .doc(time)
          .update({"$docId.isReserved": false});
    } catch (e) {
      Logger().e(e);
      rethrow;
    }
  }
}
