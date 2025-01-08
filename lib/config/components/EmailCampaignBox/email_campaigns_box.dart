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
    return Container(
      height: context.mh * 0.14,
      width: context.mw * 0.182,
      margin: EdgeInsets.symmetric(horizontal: context.mw * 0.01),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey.shade200,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon with background
          0.01.ph(context),
          Container(
            padding: EdgeInsets.all(context.mw * 0.01),
            decoration: BoxDecoration(
              color: AppColor.primaryColor.withOpacity(0.08),
              borderRadius: BorderRadius.circular(6),
            ),
            child: IconTheme(
              data: IconThemeData(
                color: AppColor.primaryColor,
                size: context.mh * 0.020,
              ),
              child: icon,
            ),
          ),


          // Count
          Text(
            count,
            style: TextStyle(
              fontSize: context.mh * 0.020,
              fontWeight: FontWeight.w600,
              color: Colors.grey[800],
            ),
          ),

          SizedBox(height: context.mh * 0.008),

          // Heading
          Text(
            heading,
            style: TextStyle(
              fontSize: context.mh * 0.013,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
              letterSpacing: 0.2,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
