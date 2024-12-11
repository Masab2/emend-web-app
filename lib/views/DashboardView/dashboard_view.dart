import 'package:emend_web_app/Model/GraphDataModel/graph_model.dart';
import 'package:emend_web_app/config/Widgets/widgets.dart';
import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/extenshions/extenshion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.mh,
      color: AppColor.viewsBackgroundColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const DashBoardHeaderWidget(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.mw * 0.02),
              child: Row(
                children: [
                  Text(
                    "Analytics Overview",
                    style: GoogleFonts.barlow(
                      fontSize: context.mh * 0.028,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
            0.02.ph(context),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.mw * 0.01),
              child: Row(
                children: [
                  Column(
                    children: [
                       const Row(
                        children: [
                          DashboardBarGraphTiles(),
                          DashboardBarGraphTiles(),
                          DashboardBarGraphTiles(),
                        ],
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Card(
                          color: AppColor.whiteColor,
                          child: Container(
                            height: context.mh * 0.5,
                            width: context.mw * 0.6,
                            padding: EdgeInsets.symmetric(
                                horizontal: context.mw * 0.02),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                0.02.ph(context),
                                Text(
                                  "Profile Growth & Discovery",
                                  style: GoogleFonts.barlow(
                                    fontSize: context.mh * 0.024,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: context.mh * 0.01,
                                ),
                                Text(
                                  "See insights on how your profile has grown and changed over time",
                                  style: GoogleFonts.barlow(
                                    fontSize: context.mh * 0.017,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                  height: context.mh * 0.02,
                                ),
                                Expanded(
                                  child: SfCartesianChart(
                                    legend: const Legend(isVisible: false),
                                    tooltipBehavior:
                                        TooltipBehavior(enable: false),
                                    primaryXAxis: const CategoryAxis(
                                      isVisible: false,
                                    ),
                                    primaryYAxis: const NumericAxis(
                                      isVisible: false,
                                      axisLine: AxisLine(width: 0),
                                      majorGridLines:
                                          MajorGridLines(color: Colors.white),
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
                                        xValueMapper: (GraphData sales, _) =>
                                            sales.month,
                                        yValueMapper: (GraphData sales, _) =>
                                            sales.sales,
                                        color: Colors.blue,
                                        width: 0.2, // Reduced bar width
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const PostImmpresshionCardWidget(),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      height: context.mh * 1.1,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
