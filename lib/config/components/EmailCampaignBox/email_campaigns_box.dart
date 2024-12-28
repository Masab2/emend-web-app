import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:flutter/material.dart';

class EmailCampaignBox extends StatelessWidget {
  final String count;
  final String heading;
  final Icon icon;
  const EmailCampaignBox({
    super.key,
    required this.count,
    required this.heading,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.whiteColor,
      child: SizedBox(
        height: context.mh * 0.16,
        width: context.mw * 0.19,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            Text(
              count,
              style: TextStyle(
                fontSize: context.mh * 0.022,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
            Text(
              heading,
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
