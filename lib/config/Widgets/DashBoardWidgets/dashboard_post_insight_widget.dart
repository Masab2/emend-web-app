import 'package:emend_web_app/config/extenshions/extenshion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PostInsightsWidget extends StatelessWidget {
  const PostInsightsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Card(
      color: Colors.white,
      child: Container(
        height: screenHeight * 0.37,
        child: Container(
          height: screenHeight * 0.37,
          width: context.mw,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title and Date Range Dropdown
              Padding(
                padding: EdgeInsets.symmetric(horizontal: context.mw * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Post Insights",
                          style: GoogleFonts.barlow(
                            fontSize: context.mh * 0.018,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Mar 26 - Apr 01",
                          style: GoogleFonts.barlow(
                            fontSize: context.mh * 0.018,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    DropdownButton<String>(
                      value: "Week 1",
                      items: <String>['Week 1', 'Week 2', 'Week 3']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: GoogleFonts.barlow(
                              fontSize: context.mh * 0.014,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              // Bar Chart
              Expanded(
                child: SfCartesianChart(
                  plotAreaBorderWidth: 0,
                  primaryXAxis: const CategoryAxis(
                    axisLine: AxisLine(width: 0),
                    majorTickLines: MajorTickLines(width: 0),
                  ),
                  primaryYAxis: const NumericAxis(
                    isVisible: false,
                    minimum: 0,
                    maximum: 10,
                    interval: 2,
                  ),
                  series: <CartesianSeries>[
                    ColumnSeries<ChartData, String>(
                      dataSource: _getChartData(),
                      xValueMapper: (ChartData data, _) => data.day,
                      yValueMapper: (ChartData data, _) => data.views,
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                      width: 0.2,
                    )
                  ],
                ),
              ),

              SizedBox(height: screenHeight * 0.02),
              // Best and Worst Performance
              Row(
                children: [
                  _performanceWidget(
                      context, "Best Performance", "Sunday", "8.6k"),
                  0.01.pw(context),
                  _performanceWidget(
                      context, "Worst Performance", "Thursday", "246"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _performanceWidget(
      BuildContext context, String title, String day, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.remove_red_eye,
                size: context.mh * 0.014, color: Colors.grey),
            Text(
              title,
              style: GoogleFonts.barlow(
                fontSize: context.mh * 0.014,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        SizedBox(width: context.mw * 0.01),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.mw * 0.01),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                day,
                style: GoogleFonts.barlow(
                  fontSize: context.mh * 0.018,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                value,
                style: GoogleFonts.barlow(
                  fontSize: context.mh * 0.018,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  List<ChartData> _getChartData() {
    return [
      ChartData("M", 4),
      ChartData("T", 5),
      ChartData("W", 3),
      ChartData("T", 2),
      ChartData("F", 6),
      ChartData("S", 9),
      ChartData("S", 8),
    ];
  }
}

class ChartData {
  ChartData(this.day, this.views);

  final String day;
  final double views;
}
