import 'package:emend_web_app/Model/GraphDataModel/pie_chart_graph_model.dart';
import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardPieChartCardWidget extends StatelessWidget {
  const DashboardPieChartCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.mh * 0.4,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey.shade200,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: SizedBox(
        height: context.mh * 0.4,
        width: context.mw,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: context.mw * 0.01, vertical: context.mh * 0.01),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Frequent Post Types",
                            style: TextStyle(
                              fontSize: context.mh * 0.016,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "Mar 26 - Apr 01",
                            style: TextStyle(
                              fontSize: context.mh * 0.012,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  0.05.ph(context),
                  SizedBox(
                    height: context.mw * 0.08,
                    width: context.mw,
                    child: SfCircularChart(
                      legend: const Legend(isVisible: false),
                      series: <DoughnutSeries<ChartData, String>>[
                        DoughnutSeries<ChartData, String>(
                          dataSource: ChartData.getChartData(),
                          xValueMapper: (ChartData data, _) => data.category,
                          yValueMapper: (ChartData data, _) => data.percentage,
                          dataLabelSettings: const DataLabelSettings(
                            isVisible: true,
                            labelPosition: ChartDataLabelPosition.outside,
                            useSeriesColor: true,
                            connectorLineSettings: ConnectorLineSettings(
                              type: ConnectorType.curve,
                              length: '15%',
                            ),
                          ),
                          radius: '70%',
                          innerRadius: '60%',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
