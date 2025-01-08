import 'package:emend_web_app/config/Color/app_color.dart';
import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:emend_web_app/config/widgets/widgets.dart';
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
                    0.02.ph(context),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: context.mw * 0.02),
                      child: Row(
                        children: [
                          Text(
                            "Reports",
                            style: TextStyle(
                              fontSize: context.mh * 0.020,
                              fontWeight: FontWeight.w600,
                              color: AppColor.primaryColor,
                              letterSpacing: 0.3,
                            ),
                          )
                        ],
                      ),
                    ),
                    0.01.ph(context),
                    const ReportsUserSearchWidget(),
                    0.01.ph(context),
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
