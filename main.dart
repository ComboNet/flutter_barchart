import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = [
      Sales("Sun", 80),
      Sales("Mon", 20),
      Sales("Tue", 50),
      Sales("Wed", 120),
      Sales("Thr", 75),
      Sales("Fri", 60),
      Sales("Sat", 40)
    ];

    var series = [
      charts.Series(
        domainFn: (Sales sales, _) => sales.day,
        measureFn: (Sales sales, _) => sales.sold,
        id: 'Sales',
        data: data
      )
    ];

    var chart = charts.BarChart(series,);

    return MaterialApp(
      title: "Chart Example",
      home: Scaffold(
        appBar: AppBar(
          title: Text('Chart Example'),
        ),
        body: chart,
      )
      ,
    );
  }
}

class Sales {
  final String day;
  final int sold;

  Sales(this.day, this.sold);
}
