import 'package:emend_web_app/config/widgets/SideBarWidgets/side_bar_widgets.dart';
import 'package:emend_web_app/config/widgets/ReportsWidgets/reports_header_widget.dart';
import 'package:emend_web_app/config/widgets/ReportsWidgets/reports_list_widget.dart';
import 'package:emend_web_app/config/widgets/ReportsWidgets/reports_user_search_widget.dart';
import 'package:emend_web_app/config/components/reportCardComp/report_card_comp.dart';
import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:flutter/material.dart';

class ReportsView extends StatelessWidget {
  static const String route = '/reports';
  const ReportsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideBarWidgets(
            key: UniqueKey(),
          ),
          Expanded(
            child: SizedBox(
              height: context.mh,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const ReportsHeaderWidget(),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: context.mw * 0.02),
                      child: Row(
                        children: [
                          Text(
                            "Reports",
                            style: TextStyle(
                              fontSize: context.mh * 0.028,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                    0.01.ph(context),
                    const ReportsUserSearchWidget(),
                    0.01.ph(context),
                    Row(
                      children: [
                        0.02.pw(context),
                        const ReportCardComp(),
                        const ReportCardComp(),
                        const ReportCardComp(),
                      ],
                    ),
                    const ReportsListWidget(),
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
