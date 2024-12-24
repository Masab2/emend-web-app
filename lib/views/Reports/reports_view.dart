import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/extenshions/extenshion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../config/Widgets/widgets.dart';
import '../../config/components/reportCardComp/report_card_comp.dart';

class ReportsView extends StatelessWidget {
  const ReportsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.viewsBackgroundColor,
      height: context.mh,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const ReportsHeaderWidget(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.mw * 0.02),
              child: Row(
                children: [
                  Text(
                    "Reports",
                    style: GoogleFonts.barlow(
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
    );
  }
}
