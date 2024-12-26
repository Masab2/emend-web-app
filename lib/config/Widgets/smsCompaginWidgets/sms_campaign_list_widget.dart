import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/extenshions/extenshion.dart';
import 'package:flutter/material.dart';

class SmsCompaignsListWidget extends StatelessWidget {
  const SmsCompaignsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.mw * 0.03,
      ),
      child: Card(
        color: AppColor.whiteColor,
        child: Container(
          height: context.mh * 0.40,
          padding: EdgeInsets.symmetric(
            horizontal: context.mw * 0.01,
          ),
          margin: EdgeInsets.symmetric(
            vertical: context.mh * 0.01,
          ),
          child: Column(
            children: [
              0.01.ph(context),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Previous Campaigns',
                  style: TextStyle(
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
                        width: context.mw * 0.15,
                        child: Text(
                          "Name",
                          style: TextStyle(
                            fontSize: context.mh * 0.018,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: context.mw * 0.15,
                        child: Text(
                          "List",
                          style: TextStyle(
                            fontSize: context.mh * 0.018,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: context.mw * 0.15,
                        child: Text(
                          "Contacts",
                          style: TextStyle(
                            fontSize: context.mh * 0.018,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: context.mw * 0.15,
                        child: Text(
                          "Creator",
                          style: TextStyle(
                            fontSize: context.mh * 0.018,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: context.mw * 0.10,
                        child: Text(
                          "Status",
                          style: TextStyle(
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
                        width: context.mw * 0.15,
                        child: Text(
                          "Test User",
                          style: TextStyle(
                            fontSize: context.mh * 0.017,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: context.mw * 0.15,
                        child: Text(
                          "Test List",
                          style: TextStyle(
                            fontSize: context.mh * 0.017,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: context.mw * 0.15,
                        child: Text(
                          "133 Contacts",
                          style: TextStyle(
                            fontSize: context.mh * 0.017,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: context.mw * 0.15,
                        child: Text(
                          "Syed Zain",
                          style: TextStyle(
                            fontSize: context.mh * 0.017,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: context.mw * 0.10,
                        child: MaterialButton(
                          minWidth: context.mw * 0.05,
                          height: context.mh * 0.05,
                          color: AppColor.primaryColor,
                          onPressed: () {},
                          child: Text(
                            "Active",
                            style: TextStyle(
                              fontSize: context.mh * 0.017,
                              color: AppColor.whiteColor,
                            ),
                          ),
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
