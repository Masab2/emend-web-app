import 'package:emend_web_app/config/Color/app_color.dart';
import 'package:emend_web_app/config/Routes/route_names.dart';
import 'package:emend_web_app/config/components/components.dart';
import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import 'sms_campaign_list_widget.dart';

class SmsCampaignsCardWidget extends StatelessWidget {
  const SmsCampaignsCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        0.02.ph(context),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.mw * 0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "SMS Campaigns",
                style: TextStyle(
                  fontSize: context.mh * 0.020,
                  fontWeight: FontWeight.w600,
                  color: AppColor.primaryColor,
                ),
              ),
            ],
          ),
        ),
        0.02.ph(context),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.mw * 0.022),
          child: Row(
            spacing: context.mw * 0.010,
            children: const [
              SmsCampaignComp(
                  count: "12",
                  icon: IconlyLight.message,
                  heading: "Unread Message"),
              SmsCampaignComp(
                  count: "12",
                  icon: IconlyLight.message,
                  heading: "Unread Message"),
              SmsCampaignComp(
                  count: "12",
                  icon: IconlyLight.message,
                  heading: "Unread Message"),
              SmsCampaignComp(
                  count: "12",
                  icon: IconlyLight.message,
                  heading: "Unread Message"),
            ],
          ),
        ),
        0.02.ph(context),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.mw * 0.02),
          child: Row(
            children: [
              Expanded(
                child: _buildMessageCard(
                  context,
                  title: "One-to-One Messaging",
                  description:
                      "Send personalized messages to individual recipients",
                  icon: IconlyBold.message,
                  gradient: const LinearGradient(
                    colors: [AppColor.primaryColor, AppColor.secondaryColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  onTap: () =>
                      Get.toNamed(RouteNames.createSmsOneToOneCampaignScreen),
                ),
              ),
              SizedBox(width: context.mw * 0.01),
              Expanded(
                child: _buildMessageCard(
                  context,
                  title: "Bulk SMS Campaign",
                  description:
                      "Send mass SMS campaigns to multiple recipients with scheduling options.",
                  icon: IconlyBold.chart,
                  gradient: const LinearGradient(
                    colors: [AppColor.primaryColor, AppColor.secondaryColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  onTap: () =>
                      Get.toNamed(RouteNames.createSmsBulkCampaignScreen),
                ),
              ),
            ],
          ),
        ),
        0.02.ph(context),
        const SmsCampaignsListWidget()
      ],
    );
  }

  Widget _buildMessageCard(
    BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
    required LinearGradient gradient,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: context.mh * 0.16,
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(context.mw * 0.015),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
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
                      child: Icon(icon),
                    ),
                  ),
                  SizedBox(width: context.mw * 0.01),
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        color: AppColor.primaryColor,
                        fontSize: context.mh * 0.015,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: context.mh * 0.012),
              Expanded(
                child: Text(
                  description,
                  style: TextStyle(
                    color: AppColor.primaryColor.withOpacity(0.9),
                    fontSize: context.mh * 0.010,
                    height: 1.4,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
