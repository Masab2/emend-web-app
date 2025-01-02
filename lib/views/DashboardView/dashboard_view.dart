import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:emend_web_app/config/widgets/widgets.dart';
import 'package:emend_web_app/model/GraphDataModel/graph_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideBarWidgets(key: UniqueKey()),
          Expanded(
            child: Container(
              height: context.mh,
              color: AppColor.viewsBackgroundColor,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const DashBoardHeaderWidget(),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: context.mw * 0.02),
                      child: Row(
                        children: [
                          Text(
                            "Analytics Overview",
                            style: TextStyle(
                              fontSize: context.mh * 0.025,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                    0.02.ph(context),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: context.mw * 0.01),
                      child: Row(
                        children: [
                          SizedBox(
                            height: context.mh * 0.85,
                            child: SingleChildScrollView(
                              child: Column(
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
                                    child: SizedBox(
                                      width: context.mw * 0.6,
                                      child: Row(
                                        children: [
                                          Card(
                                            color: AppColor.whiteColor,
                                            child: Container(
                                              height: context.mh * 0.4,
                                              width: context.mw * 0.4,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      context.mw * 0.02),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  0.02.ph(context),
                                                  Text(
                                                    "Profile Growth & Discovery",
                                                    style: TextStyle(
                                                      fontSize:
                                                          context.mh * 0.018,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: context.mh * 0.01,
                                                  ),
                                                  Text(
                                                    "See insights on how your profile has grown and changed over time",
                                                    style: TextStyle(
                                                      fontSize:
                                                          context.mh * 0.014,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: context.mh * 0.02,
                                                  ),
                                                  Expanded(
                                                    child: SfCartesianChart(
                                                      legend: const Legend(
                                                          isVisible: false),
                                                      plotAreaBorderWidth: 0,
                                                      tooltipBehavior:
                                                          TooltipBehavior(
                                                              enable: false),
                                                      primaryXAxis:
                                                          const CategoryAxis(
                                                        isVisible: true,
                                                      ),
                                                      primaryYAxis:
                                                          const NumericAxis(
                                                        isVisible: true,
                                                        axisLine:
                                                            AxisLine(width: 0),
                                                        majorGridLines:
                                                            MajorGridLines(
                                                                color: Colors
                                                                    .white),
                                                        labelFormat: '',
                                                      ),
                                                      series: <CartesianSeries>[
                                                        ColumnSeries<GraphData,
                                                            String>(
                                                          dataSource: [
                                                            GraphData(
                                                                'Jan', 35),
                                                            GraphData(
                                                                'Feb', 28),
                                                            GraphData(
                                                                'Mar', 34),
                                                            GraphData(
                                                                'Apr', 32),
                                                          ],
                                                          xValueMapper:
                                                              (GraphData sales,
                                                                      _) =>
                                                                  sales.month,
                                                          yValueMapper:
                                                              (GraphData sales,
                                                                      _) =>
                                                                  sales.sales,
                                                          color: AppColor.primaryColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          width: 0.07,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          const PostImpressionCardWidget(),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: context.mw * 0.6,
                                    child: const PostInsightsWidget(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: context.mh * 0.85,
                              child: const SingleChildScrollView(
                                child: Column(
                                  children: [
                                    DashboardPieChartCardWidget(),
                                    DashboardPostSummaryWidget()
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
