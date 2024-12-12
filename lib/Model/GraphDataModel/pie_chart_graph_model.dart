import 'package:flutter/material.dart';

class ChartData {
  ChartData(this.category, this.percentage, this.color);

  final String category;
  final double percentage;
  final Color color;

  static List<ChartData> getChartData() {
    return [
      ChartData('Images', 72.64, Colors.blue),
      ChartData('Videos', 27.36, Colors.green),
    ];
  }
}
