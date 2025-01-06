import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:flutter/material.dart';

class SmsCampaignComp extends StatelessWidget {
  final String count;
  const SmsCampaignComp({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.only(right: context.mw * 0.008),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: SizedBox(
        height: context.mh * 0.12,
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
