import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/extenshions/extenshion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class ReportsListWidget extends StatelessWidget {
  const ReportsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.mw * 0.02),
      child: Card(
        color: AppColor.whiteColor,
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: context.mw * 0.02, vertical: context.mh * 0.02),
          height: context.mh * 0.6,
          child: Column(
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
                    width: context.mw * 0.13,
                    child: Text(
                      "User Id",
                      style: TextStyle(
                        fontSize: context.mh * 0.018,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: context.mw * 0.13,
                    child: Text(
                      "OPENERS",
                      style: TextStyle(
                        fontSize: context.mh * 0.018,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: context.mw * 0.13,
                    child: Text(
                      "Date",
                      style: TextStyle(
                        fontSize: context.mh * 0.018,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: context.mw * 0.10,
                    child: Text(
                      "Clickers",
                      style: TextStyle(
                        fontSize: context.mh * 0.018,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: context.mw * 0.10,
                    child: Text(
                      "ACTIONS",
                      style: TextStyle(
                        fontSize: context.mh * 0.018,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(),
              SizedBox(
                height: context.mh * 0.5,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: context.mw * 0.002),
                      child: Row(
                        children: [
                          SizedBox(
                            width: context.mw * 0.15,
                            child: Text(
                              "Victoria Perez",
                              style: TextStyle(
                                fontSize: context.mh * 0.018,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: context.mw * 0.13,
                            child: Text(
                              "LA-0234",
                              style: TextStyle(
                                fontSize: context.mh * 0.018,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: context.mw * 0.13,
                            child: Text(
                              "OPENERS",
                              style: TextStyle(
                                fontSize: context.mh * 0.018,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: context.mw * 0.13,
                            child: Text(
                              "30 Apr, 2017 to 24 Otc 2020",
                              style: TextStyle(
                                fontSize: context.mh * 0.018,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: context.mw * 0.10,
                            child: Text(
                              "Clickers",
                              style: TextStyle(
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
                                      color:
                                          AppColor.notificationBackgroundColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Icon(IconlyLight.edit_square),
                                  ),
                                  0.01.pw(context),
                                  Container(
                                    height: context.mw * 0.03,
                                    width: context.mw * 0.03,
                                    decoration: BoxDecoration(
                                      color:
                                          AppColor.notificationBackgroundColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Icon(IconlyLight.delete),
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
    );
  }
}
