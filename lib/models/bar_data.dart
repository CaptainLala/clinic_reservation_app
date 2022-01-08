import 'package:flutter/material.dart';

class BarData {
  // for ordering in the graph
  final int id;
  final String name;
  final double y;
  final Color color;

  const BarData({
    required this.name,
    required this.id,
    required this.y,
    required this.color,
  });
}
