import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/extenshions/extenshion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class EmailCompaaginSecondWidget extends StatelessWidget {
  const EmailCompaaginSecondWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.mw * 0.01),
      child: Row(
        children: [
          Card(
            color: AppColor.whiteColor,
            child: Container(
              height: context.mh * 0.20,
              width: context.mw * 0.35,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: context.mw * 0.023),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Email Compaigns",
                        style: GoogleFonts.barlow(
                          fontSize: context.mh * 0.020,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  0.01.ph(context),
                  Container(
                    height: context.mh * 0.038,
                    width: context.mw * 0.25,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColor.boxBorderColor,
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: context.mw * 0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 10.0,
                                    backgroundColor:
                                        AppColor.chatsBackgroundColor,
                                    child: Icon(
                                      IconlyLight.send,
                                      color: AppColor.redColor,
                                      size: context.mh * 0.020,
                                    ),
                                  ),
                                  // 0.01.pw(context),
                                  Text(
                                    "Send",
                                    style: GoogleFonts.barlow(
                                      fontSize: context.mh * 0.015,
                                      color: Colors.grey,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Text(
                            "52",
                            style: GoogleFonts.barlow(
                              fontSize: context.mh * 0.015,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: context.mh * 0.038,
                    width: context.mw * 0.25,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColor.boxBorderColor,
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: context.mw * 0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 10.0,
                                    backgroundColor:
                                        AppColor.chatsBackgroundColor,
                                    child: Icon(
                                      Icons.edit,
                                      color: Colors.blue,
                                      size: context.mh * 0.020,
                                    ),
                                  ),
                                  // 0.01.pw(context),
                                  Text(
                                    "Drafts",
                                    style: GoogleFonts.barlow(
                                      fontSize: context.mh * 0.015,
                                      color: Colors.grey,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Text(
                            "52",
                            style: GoogleFonts.barlow(
                              fontSize: context.mh * 0.015,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  0.01.ph(context),
                  MaterialButton(
                    minWidth: context.mw * 0.15,
                    height: context.mh * 0.05,
                    onPressed: () {},
                    color: AppColor.buttonColor,
                    child: Text(
                      '+ Create a New Campaign',
                      style: GoogleFonts.barlow(
                        fontSize: context.mh * 0.018,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          0.03.pw(context),
          Card(
            color: AppColor.whiteColor,
            child: Container(
              height: context.mh * 0.20,
              width: context.mw * 0.35,
              child: Column(
                children: [
                  0.02.ph(context),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: context.mw * 0.023),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Email Compaigns",
                        style: GoogleFonts.barlow(
                          fontSize: context.mh * 0.020,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  MaterialButton(
                    minWidth: context.mw * 0.15,
                    height: context.mh * 0.05,
                    onPressed: () {},
                    color: AppColor.buttonColor,
                    child: Text(
                      '+ Create a New Campaign',
                      style: GoogleFonts.barlow(
                        fontSize: context.mh * 0.018,
                      ),
                    ),
                  ),
                  0.02.ph(context),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
