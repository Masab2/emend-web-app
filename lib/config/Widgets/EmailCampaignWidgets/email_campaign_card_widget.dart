import 'package:emend_web_app/config/components/EmailCampaignBox/email_campaigns_box.dart';
import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class EmailCampaignCardWidget extends StatelessWidget {
  const EmailCampaignCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.mw * 0.02),
          child: Row(
            children: [
              Text(
                "E-Mail Campaigns",
                style: TextStyle(
                  fontSize: context.mh * 0.028,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
        0.01.ph(context),
        Column(
          children: [
            Row(
              children: [
                0.02.pw(context),
                const EmailCampaignBox(
                  count: '3000',
                  heading: 'All Your Contacts',
                  icon: Icon(IconlyLight.user),
                ),
                const EmailCampaignBox(
                  count: '2',
                  heading: 'Opened',
                  icon: Icon(IconlyLight.discovery),
                ),
                const EmailCampaignBox(
                  count: '2',
                  heading: 'Clicked',
                  icon: Icon(IconlyLight.chat),
                ),
                const EmailCampaignBox(
                  count: '3',
                  heading: 'Unsubscribed',
                  icon: Icon(IconlyLight.calendar),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
