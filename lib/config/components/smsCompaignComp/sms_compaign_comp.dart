import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/extenshions/extenshion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SmsCompaignComp extends StatelessWidget {
  final String count;
  const SmsCompaignComp({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.whiteColor,
      child: SizedBox(
        height: context.mh * 0.16,
        width: context.mw * 0.18,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              count,
              style: TextStyle(
                fontSize: context.mh * 0.022,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
            Text(
              "UnRead Message",
              style: TextStyle(
                fontSize: context.mh * 0.022,
                fontWeight: FontWeight.w600,
                color: AppColor.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
