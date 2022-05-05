import 'package:clinic_reservation_app/models/bar_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarProvider with ChangeNotifier {
  final db = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance;

  List<BarData> _barData = [];

  List<BarData> get barData {
    return [..._barData];
  }

  List<BarChartGroupData> _barY = [];
  List<BarChartGroupData> get barY {
    return [..._barY];
  }

  void addY() {
    List<BarChartGroupData> tempData = [];
    for (int i = 0; i < _barData.length; i++) {
      tempData.add(
        BarChartGroupData(
          showingTooltipIndicators: [0],
          x: i,
          barRods: [
            BarChartRodData(
              y: barData[i].y.toDouble(),
              width: 20,
              colors: [Colors.white],
            ),
          ],
        ),
      );
    }
    _barY = tempData;
  }

  Future<List<BarData>> getMonthlyBoard() async {
    try {
      final _collection = await db
          .collection('finished')
          .where('docid', isEqualTo: user.currentUser!.uid)
          .get();

      List<BarData> tempData = [];
      _collection.docs.forEach((element) {
        tempData.add(
          BarData.fromJson(
            element.data(),
          ),
        );
      });
      _barData = tempData;
      addY();
      return tempData;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
