import 'package:clinic_reservation_app/providers/bar_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BarChartWidget extends StatelessWidget {
  const BarChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<BarProvider>(context);

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromRGBO(37, 41, 88, 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            offset: const Offset(3, 3),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: BarChart(
        BarChartData(
          gridData: FlGridData(
            show: false,
          ),
          alignment: BarChartAlignment.spaceAround,
          maxY: 10,
          minY: 0,
          borderData: FlBorderData(
            show: false,
          ),
          barTouchData: BarTouchData(
            enabled: false,
            touchTooltipData: BarTouchTooltipData(
              tooltipBgColor: Colors.transparent,
              tooltipMargin: 8,
              getTooltipItem: (
                BarChartGroupData group,
                int groupIndex,
                BarChartRodData rod,
                int rodIndex,
              ) {
                return BarTooltipItem(
                  //count
                  rod.y.round().toString(),
                  const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
          ),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: SideTitles(
              showTitles: true,
              getTextStyles: (context, value) => const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              margin: 20,
              getTitles: (double value) {
                switch (value.toInt()) {
                  case 0:
                    return data.barData[0].date;
                  case 1:
                    return data.barData[1].date;
                  case 2:
                    return data.barData[2].date;
                  case 3:
                    return data.barData[3].date;
                  case 4:
                    return data.barData[4].date;
                  case 5:
                    return data.barData[5].date;
                  case 6:
                    return data.barData[6].date;
                  default:
                    return '';
                }
              },
            ),
            leftTitles: SideTitles(showTitles: false),
            topTitles: SideTitles(showTitles: false),
            rightTitles: SideTitles(showTitles: false),
          ),
          barGroups: data.barY,
        ),
      ),
    );
  }
}
