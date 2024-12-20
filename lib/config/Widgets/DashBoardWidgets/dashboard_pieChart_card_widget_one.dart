import 'package:emend_web_app/Model/GraphDataModel/pie_chart_graph_model.dart';
import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/extenshions/extenshion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardPiechartCardWidgetOne extends StatelessWidget {
  const DashboardPiechartCardWidgetOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.whiteColor,
      child: Container(
        height: context.mh * 0.4,
        child: Container(
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
                              style: GoogleFonts.barlow(
                                fontSize: context.mh * 0.020,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Mar 26 - Apr 01",
                              style: GoogleFonts.barlow(
                                fontSize: context.mh * 0.016,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    0.05.ph(context),
                    Container(
                      height: context.mw * 0.08,
                      width: context.mw,
                      child: SfCircularChart(
                        legend: const Legend(isVisible: false),
                        series: <DoughnutSeries<ChartData, String>>[
                          DoughnutSeries<ChartData, String>(
                            dataSource: ChartData.getChartData(),
                            xValueMapper: (ChartData data, _) => data.category,
                            yValueMapper: (ChartData data, _) =>
                                data.percentage,
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
      ),
    );
  }
}
