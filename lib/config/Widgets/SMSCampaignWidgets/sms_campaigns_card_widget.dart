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
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.mw * 0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "SMS Campaigns",
                style: TextStyle(
                  fontSize: context.mh * 0.025,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        0.02.ph(context),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.mw * 0.035),
          child: const Row(
            children: [
              SmsCampaignComp(count: "0"),
              SmsCampaignComp(count: "0"),
              SmsCampaignComp(count: "0"),
              SmsCampaignComp(count: "0"),
            ],
          ),
        ),
        0.02.ph(context),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.mw * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Messaging",
                style: TextStyle(
                  fontSize: context.mh * 0.019,
                  fontWeight: FontWeight.w500,
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
                          colors: [
                            AppColor.primaryColor,
                            AppColor.secondaryColor
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        onTap: () => Get.toNamed(
                            RouteNames.createSmsOneToOneCompaignScreen),
                      ),
                    ),
                    SizedBox(width: context.mw * 0.02),
                    Expanded(
                      child: _buildMessageCard(
                        context,
                        title: "Bulk SMS Campaign",
                        description:
                            "Send mass SMS campaigns to multiple recipients with scheduling options.",
                        icon: IconlyBold.chart,
                        gradient: const LinearGradient(
                          colors: [
                            AppColor.primaryColor,
                            AppColor.secondaryColor
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        onTap: () =>
                            Get.toNamed(RouteNames.createSmsBulkCompaignScreen),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        0.01.ph(context),
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
        height: context.mh * 0.16, // Reduced height
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: gradient.colors.first.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(context.mw * 0.015),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(context.mw * 0.008),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      icon,
                      color: Colors.white,
                      size: context.mh * 0.025,
                    ),
                  ),
                  SizedBox(width: context.mw * 0.01),
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: context.mh * 0.02,
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
                    color: Colors.white.withOpacity(0.9),
                    fontSize: context.mh * 0.014,
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
