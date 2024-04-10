import 'package:eyeoptic_app/screen/admin/barchart/weeklybardata.dart';
import 'package:eyeoptic_app/theme/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartWidget extends StatefulWidget {
  const BarChartWidget({super.key});

  @override
  State<BarChartWidget> createState() => _BarChartWidgetState();
}

class _BarChartWidgetState extends State<BarChartWidget> {
  List<double> weeklySummary = [
    4.5,
    55.0,
    66.0,
    45.0,
    80.0,
    25.0,
    95.0,
  ];

  late WeeklyBarData barData;

  @override
  void initState() {
    super.initState();
    barData = WeeklyBarData(
      monTotal: weeklySummary[0],
      tueTotal: weeklySummary[1],
      wedTotal: weeklySummary[2],
      thuTotal: weeklySummary[3],
      friTotal: weeklySummary[4],
      satTotal: weeklySummary[5],
      sunTotal: weeklySummary[6],
    );

    barData.initializeBarData();
  }

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        gridData: const FlGridData(
          drawHorizontalLine: false,
          drawVerticalLine: false,
        ),
        borderData: FlBorderData(show: false),
        titlesData: const FlTitlesData(
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: getBottomTitle,
            ),
          ),
        ),
        maxY: 100.0,
        minY: 0,
        barGroups: barData.barData
            .map((data) => BarChartGroupData(x: data.x, barRods: [
                  BarChartRodData(
                    toY: data.y,
                    width: 25.0,
                    color: AppColor.primaryColor,
                    backDrawRodData: BackgroundBarChartRodData(
                        show: true, fromY: 100, color: Colors.grey[300]),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5.0),
                      topRight: Radius.circular(5.0),
                    ),
                  )
                ]))
            .toList(),
      ),
    );
  }
}

Widget getBottomTitle(double value, TitleMeta meta) {
  List<String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  return Text(days[value.toInt()]);
}
