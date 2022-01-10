import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartWidget extends StatelessWidget {
  const BarChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          maxY: 1500,
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
                    return '7/21';
                  case 1:
                    return '8/21';
                  case 2:
                    return '9/21';
                  case 3:
                    return '10/21';
                  case 4:
                    return '11/21';
                  case 5:
                    return '12/21';
                  case 6:
                    return '1/22';
                  default:
                    return '';
                }
              },
            ),
            leftTitles: SideTitles(showTitles: false),
            topTitles: SideTitles(showTitles: false),
            rightTitles: SideTitles(showTitles: false),
          ),
          barGroups: [
            BarChartGroupData(
              x: 1,
              showingTooltipIndicators: [0],
              barRods: [
                BarChartRodData(
                  y: 946,
                  width: 20,
                  colors: [Colors.white],
                ),
              ],
            ),
            BarChartGroupData(
              x: 2,
              showingTooltipIndicators: [0],
              barRods: [
                BarChartRodData(
                  y: 780,
                  width: 20,
                  colors: [Colors.white],
                ),
              ],
            ),
            BarChartGroupData(
              x: 3,
              showingTooltipIndicators: [0],
              barRods: [
                BarChartRodData(
                  y: 555,
                  width: 20,
                  colors: [Colors.white],
                ),
              ],
            ),
            BarChartGroupData(
              x: 4,
              showingTooltipIndicators: [0],
              barRods: [
                BarChartRodData(
                  y: 768,
                  width: 20,
                  colors: [Colors.amber],
                ),
              ],
            ),
            BarChartGroupData(
              x: 5,
              showingTooltipIndicators: [0],
              barRods: [
                BarChartRodData(
                  y: 450,
                  width: 20,
                  colors: [Colors.white],
                ),
              ],
            ),
            BarChartGroupData(
              x: 6,
              showingTooltipIndicators: [0],
              barRods: [
                BarChartRodData(
                  y: 670,
                  width: 20,
                  colors: [Colors.white],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
