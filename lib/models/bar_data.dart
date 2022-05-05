class BarData {
  // for ordering in the graph
  final String date;
  final int y;

  const BarData({
    required this.date,
    required this.y,
  });

  factory BarData.fromJson(Map<String, dynamic> json) {
    return BarData(
      date: json['date'],
      y: json['count'],
    );
  }
}
