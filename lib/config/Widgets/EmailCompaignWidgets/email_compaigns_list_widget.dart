import 'package:emend_web_app/config/Color/app_color.dart';
import 'package:emend_web_app/config/extenshions/extenshion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailCompaignsListWidget extends StatelessWidget {
  const EmailCompaignsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.mw * 0.01),
      child: Card(
        color: AppColor.whiteColor,
        child: Container(
          height: context.mh * 0.40,
          // width: context.mw * 0.8,
          padding: EdgeInsets.symmetric(
            horizontal: context.mw * 0.01,
          ),
          child: Column(
            children: [
              0.01.ph(context),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Previous Campaigns',
                  style: GoogleFonts.barlow(
                    fontSize: context.mh * 0.020,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              0.01.ph(context),
              Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: context.mw * 0.05,
                        child: Text(
                          "Id",
                          style: GoogleFonts.barlow(
                            fontSize: context.mh * 0.018,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: context.mw * 0.15,
                        child: Text(
                          "NAME",
                          style: GoogleFonts.barlow(
                            fontSize: context.mh * 0.018,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: context.mw * 0.10,
                        child: Text(
                          "RECIPIENTS",
                          style: GoogleFonts.barlow(
                            fontSize: context.mh * 0.018,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: context.mw * 0.10,
                        child: Text(
                          "OPENERS",
                          style: GoogleFonts.barlow(
                            fontSize: context.mh * 0.018,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: context.mw * 0.10,
                        child: Text(
                          "CLICKERS",
                          style: GoogleFonts.barlow(
                            fontSize: context.mh * 0.018,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: context.mw * 0.10,
                        child: Text(
                          "UNSUBSCRIBED",
                          style: GoogleFonts.barlow(
                            fontSize: context.mh * 0.018,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: context.mw * 0.10,
                        child: Text(
                          "SEND DATE",
                          style: GoogleFonts.barlow(
                            fontSize: context.mh * 0.018,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: context.mw * 0.08,
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
                  0.01.ph(context),
                  Row(
                    children: [
                      SizedBox(
                        width: context.mw * 0.05,
                        child: Text(
                          "0001",
                          style: GoogleFonts.barlow(
                            fontSize: context.mh * 0.017,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: context.mw * 0.15,
                        child: Text(
                          "Sept 2021 deliverability",
                          style: GoogleFonts.barlow(
                            fontSize: context.mh * 0.017,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: context.mw * 0.10,
                        child: Text(
                          "73  100",
                          style: GoogleFonts.barlow(
                            fontSize: context.mh * 0.017,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: context.mw * 0.10,
                        child: Text(
                          "1.39",
                          style: GoogleFonts.barlow(
                            fontSize: context.mh * 0.017,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: context.mw * 0.10,
                        child: Text(
                          "1.39",
                          style: GoogleFonts.barlow(
                            fontSize: context.mh * 0.017,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: context.mw * 0.10,
                        child: Text(
                          "0",
                          style: GoogleFonts.barlow(
                            fontSize: context.mh * 0.017,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: context.mw * 0.05,
                        child: Text(
                          "02 Sep,2021",
                          style: GoogleFonts.barlow(
                            fontSize: context.mh * 0.017,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: context.mw * 0.10,
                        child: Column(
                          children: [
                            MaterialButton(
                              minWidth: context.mw * 0.08,
                              height: context.mh * 0.05,
                              color: AppColor.primaryColor,
                              onPressed: () {},
                              child: Text(
                                "Reports",
                                style: GoogleFonts.barlow(
                                  fontSize: context.mh * 0.017,
                                  color: AppColor.whiteColor,
                                ),
                              ),
                            ),
                            MaterialButton(
                              minWidth: context.mw * 0.08,
                              height: context.mh * 0.05,
                              
                              onPressed: () {},
                              child: Text(
                                "preview",
                                style: GoogleFonts.barlow(
                                  fontSize: context.mh * 0.017,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
