import 'package:eyeoptic_app/screen/admin/barchart/barchartwidget.dart';
import 'package:flutter/material.dart';

class DashBoardTab extends StatefulWidget {
  const DashBoardTab({super.key});

  @override
  State<DashBoardTab> createState() => _DashBoardTabState();
}

class _DashBoardTabState extends State<DashBoardTab> {
  final List<Map<String, dynamic>> data = [
    {'icon': Icons.person, 'count': '325', 'subdescript': 'Total Patients'},
    {'icon': Icons.person, 'count': '12', 'subdescript': 'Total Doctors'},
    {
      'icon': Icons.medical_services,
      'count': '5',
      'subdescript': 'Clinic Services'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Dashboard', style: Theme.of(context).textTheme.headlineMedium),
          Row(
            children: data.map((e) {
              return dashboardSummaryBox(e);
            }).toList(),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 25.0),
            height: MediaQuery.of(context).size.height * 0.50,
            child: const BarChartWidget(),
          ),
        ],
      ),
    );
  }

  Widget dashboardSummaryBox(e) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Row(
            children: [
              Icon(e['icon']),
              const SizedBox(
                width: 8.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    e['count'],
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(e['subdescript']),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
