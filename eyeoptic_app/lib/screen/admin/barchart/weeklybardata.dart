import 'package:eyeoptic_app/screen/admin/barchart/individualchart.dart';

class WeeklyBarData {
  final double monTotal;
  final double tueTotal;
  final double wedTotal;
  final double thuTotal;
  final double friTotal;
  final double satTotal;
  final double sunTotal;

  WeeklyBarData({
    required this.monTotal,
    required this.tueTotal,
    required this.wedTotal,
    required this.thuTotal,
    required this.friTotal,
    required this.satTotal,
    required this.sunTotal,
  });

  List<DaySummaryModel> barData = [];

  void initializeBarData() {
    barData = [
      DaySummaryModel(x: 0, y: monTotal),
      DaySummaryModel(x: 1, y: tueTotal),
      DaySummaryModel(x: 2, y: wedTotal),
      DaySummaryModel(x: 3, y: thuTotal),
      DaySummaryModel(x: 4, y: friTotal),
      DaySummaryModel(x: 5, y: satTotal),
      DaySummaryModel(x: 6, y: sunTotal),
    ];
  }
}
