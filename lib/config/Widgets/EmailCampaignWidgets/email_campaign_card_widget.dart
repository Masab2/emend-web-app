// ignore_for_file: deprecated_member_use

import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/components/components.dart';
import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:emend_web_app/config/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class EmailCampaignCardWidget extends StatelessWidget {
  const EmailCampaignCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        0.02.ph(context),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.mw * 0.03),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "E-Mail Campaigns",
                style: TextStyle(
                  fontSize: context.height * 0.020,
                  fontWeight: FontWeight.w600,
                  color: AppColor.primaryColor,
                  letterSpacing: 0.3,
                ),
              ),
            ],
          ),
        ),
        0.01.ph(context),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.mw * 0.01),
              child: const Row(
                children: [
                  EmailCampaignBox(
                    count: '3000',
                    heading: 'All Your Contacts',
                    icon: Icon(IconlyLight.user),
                  ),
                  EmailCampaignBox(
                    count: '2',
                    heading: 'Opened',
                    icon: Icon(IconlyLight.discovery),
                  ),
                  EmailCampaignBox(
                    count: '2',
                    heading: 'Clicked',
                    icon: Icon(IconlyLight.chat),
                  ),
                  EmailCampaignBox(
                    count: '3',
                    heading: 'Unsubscribed',
                    icon: Icon(IconlyLight.calendar),
                  ),
                ],
              ),
            ),
            0.02.ph(context),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.mw * 0.02),
              child: Row(
                children: [
                  Expanded(
                    child: _buildEmailCard(
                      context,
                      title: "Send Email",
                      description:
                          "Send personalized Email to individual recipients",
                      icon: IconlyBold.message,
                      gradient: const LinearGradient(
                        colors: [
                          AppColor.primaryColor,
                          AppColor.secondaryColor
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      onTap: () => Get.toNamed(RouteNames.createEmailCampaign),
                    ),
                  ),
                  0.01.pw(context),
                  Expanded(
                    child: _buildEmailCard(
                      context,
                      title: "Bulk Email Campaign",
                      description:
                          "Send mass Email campaigns to multiple recipients with scheduling options.",
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
                          Get.toNamed(RouteNames.createBulkEmailScreen),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildEmailCard(
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
