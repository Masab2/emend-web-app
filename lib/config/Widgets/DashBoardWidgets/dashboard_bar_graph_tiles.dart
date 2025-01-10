import 'package:emend_web_app/Model/GraphDataModel/graph_model.dart';
import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardBarGraphTiles extends StatelessWidget {
  const DashboardBarGraphTiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      width: context.mw * 0.20,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
                "2.648",
                style: TextStyle(
                  fontSize: context.mh * 0.020,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "",
                style: TextStyle(
                  fontSize: context.mh * 0.020,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: context.mw * 0.06,
                width: context.mw * 0.093,
                child: SfCartesianChart(
                  legend: const Legend(isVisible: false),
                  tooltipBehavior: TooltipBehavior(enable: false),
                  plotAreaBorderWidth: 0,
                  primaryXAxis: const CategoryAxis(
                    isVisible: false,
                  ),
                  primaryYAxis: const NumericAxis(
                    isVisible: false,
                    axisLine: AxisLine(width: 0),
                    labelFormat: '',
                  ),
                  series: <CartesianSeries>[
                    ColumnSeries<GraphData, String>(
                      dataSource: [
                        GraphData('Jan', 35),
                        GraphData('Feb', 28),
                        GraphData('Mar', 34),
                        GraphData('Apr', 32),
                      ],
                      xValueMapper: (GraphData sales, _) => sales.month,
                      yValueMapper: (GraphData sales, _) => sales.sales,
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.primaryColor,
                      width: 0.3,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
