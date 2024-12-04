import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/components/reportCardComp/report_card_comp.dart';
import 'package:emend_web_app/config/extenshions/extenshion.dart';
import 'package:emend_web_app/views/Reports/widgets/reports_header_widget.dart';
import 'package:emend_web_app/views/Reports/widgets/reports_user_search_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class ReportsView extends StatelessWidget {
  const ReportsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.viewsBackgroundColor,
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
            0.02.ph(context),
            const ReportsUserSearchWidget(),
            0.02.ph(context),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.mw * 0.02),
              child: const Row(
                children: [
                  ReportCardComp(),
                  ReportCardComp(),
                  ReportCardComp(),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.mw * 0.02),
              child: Card(
                color: AppColor.whiteColor,
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.mw * 0.02,
                      vertical: context.mh * 0.02),
                  height: context.mh * 0.6,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: context.mw * 0.15,
                            child: Text(
                              "Name",
                              style: GoogleFonts.barlow(
                                fontSize: context.mh * 0.018,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: context.mw * 0.13,
                            child: Text(
                              "User Id",
                              style: GoogleFonts.barlow(
                                fontSize: context.mh * 0.018,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: context.mw * 0.13,
                            child: Text(
                              "OPENERS",
                              style: GoogleFonts.barlow(
                                fontSize: context.mh * 0.018,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: context.mw * 0.13,
                            child: Text(
                              "Date",
                              style: GoogleFonts.barlow(
                                fontSize: context.mh * 0.018,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: context.mw * 0.10,
                            child: Text(
                              "Clickers",
                              style: GoogleFonts.barlow(
                                fontSize: context.mh * 0.018,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: context.mw * 0.10,
                            child: Text(
                              "ACTIONS",
                              style: GoogleFonts.barlow(
                                fontSize: context.mh * 0.018,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      Expanded(
                        child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: context.mw * 0.002),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: context.mw * 0.15,
                                    child: Text(
                                      "Victoria Perez",
                                      style: GoogleFonts.barlow(
                                        fontSize: context.mh * 0.018,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: context.mw * 0.13,
                                    child: Text(
                                      "LA-0234",
                                      style: GoogleFonts.barlow(
                                        fontSize: context.mh * 0.018,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: context.mw * 0.13,
                                    child: Text(
                                      "OPENERS",
                                      style: GoogleFonts.barlow(
                                        fontSize: context.mh * 0.018,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: context.mw * 0.13,
                                    child: Text(
                                      "30 Apr, 2017 to 24 Otc 2020",
                                      style: GoogleFonts.barlow(
                                        fontSize: context.mh * 0.018,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: context.mw * 0.10,
                                    child: Text(
                                      "Clickers",
                                      style: GoogleFonts.barlow(
                                        fontSize: context.mh * 0.018,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                      width: context.mw * 0.10,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            height: context.mw * 0.03,
                                            width: context.mw * 0.03,
                                            decoration: BoxDecoration(
                                              color: AppColor
                                                  .notificationBackgroundColor,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: const Icon(
                                                IconlyLight.edit_square),
                                          ),
                                          0.01.pw(context),
                                          Container(
                                            height: context.mw * 0.03,
                                            width: context.mw * 0.03,
                                            decoration: BoxDecoration(
                                              color: AppColor
                                                  .notificationBackgroundColor,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child:
                                                const Icon(IconlyLight.delete),
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
