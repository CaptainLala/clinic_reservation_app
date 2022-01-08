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
        color: Colors.black54,
      ),
      child: BarChart(
        BarChartData(
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
                    return '5/20';
                  case 1:
                    return '6/20';
                  case 2:
                    return '7/20';
                  case 3:
                    return '8/20';
                  case 4:
                    return '9/20';
                  case 5:
                    return '10/20';
                  case 6:
                    return '11/20';
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
                  y: 1000,
                  width: 20,
                  colors: [Colors.amber],
                ),
              ],
            ),
            BarChartGroupData(
              x: 2,
              showingTooltipIndicators: [0],
              barRods: [
                BarChartRodData(
                  y: 500,
                  width: 20,
                  colors: [Colors.amber],
                ),
              ],
            ),
            BarChartGroupData(
              x: 3,
              showingTooltipIndicators: [0],
              barRods: [
                BarChartRodData(
                  y: 300,
                  width: 20,
                  colors: [Colors.amber],
                ),
              ],
            ),
            BarChartGroupData(
              x: 4,
              showingTooltipIndicators: [0],
              barRods: [
                BarChartRodData(
                  y: 800,
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
                  y: 900,
                  width: 20,
                  colors: [Colors.amber],
                ),
              ],
            ),
            BarChartGroupData(
              x: 6,
              showingTooltipIndicators: [0],
              barRods: [
                BarChartRodData(
                  y: 1000,
                  width: 20,
                  colors: [Colors.amber],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
